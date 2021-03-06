function getLattice(Line,contrl)
%biaobin, 2018-10-25, get lattice section, most parameters used default
%                     values

%steps=StepNum*ceil(ElementLength)
StepNum = contrl.StepNum; 

% maps by default is 1, what's the use of this parameter?
maps  = 1;

fid = fopen('ImpactZ.in','a+');
fprintf(fid,'!==========lattice=========== \n');

% ceil(Line{j}.Length)

for j=1:length(Line)
    switch Line{j}.PassMethod
        case 'DriftPass'
            %steps control
            switch contrl.scflag
                case 'OFF'
                    Line{j}.steps=1;
                case 'ON'
                    Line{j}.steps=ceil(StepNum*Line{j}.Length);
                otherwise
                    error('scflag should be ON or OFF.')
            end        
            %linear map or nonlinear map contrl 
            if Line{j}.ID==0
                % linear map with ID<0
                Line{j}.ID=-1;
            else
                % otherwise nonlinear map
                Line{j}.ID=0;
            end
                        
            fprintf(fid,'%f %d %d 0 1.0 %d / \n',Line{j}.Length,Line{j}.steps,maps,Line{j}.ID);
        case 'QuadLinearPass'
            %steps control
            switch contrl.scflag
                case 'OFF'
                    Line{j}.steps=1;
                case 'ON'
                    Line{j}.steps=ceil(StepNum*Line{j}.Length);
                otherwise
                    error('scflag should be ON or OFF.')
            end             
            %biaobin, 2018-10-26, with ID=-1, gradient is K.
            %         201906, ID(-10,0),linear map
            %                 ID<-10, real map           
            %if not defined, by default linear map   
            if Line{j}.ID == 0
                % linear map
                Line{j}.ID = -5;
            else
                % nonlinear map
                Line{j}.ID = -15;
            end         
            fprintf(fid,'%f %d %d 1 %20.15e %d 1.0 0 0 0 0 0 / \n', ...
                        Line{j}.Length,Line{j}.steps,maps,Line{j}.K,Line{j}.ID);                         
        case 'BendLinearPass'
            %steps control
            switch contrl.scflag
                case 'OFF'
                    Line{j}.steps=1;
                case 'ON'
                    Line{j}.steps=ceil(StepNum*Line{j}.Length);
                otherwise
                    error('scflag should be ON or OFF.')
            end 
            %if not defined, by default linear map 
            switch contrl.csrflag
                case 'OFF'
                    if Line{j}.ID==0
                        %linear map without csr
                        Line{j}.ID=25;
                    else
                        %nonlinear map without csr
                        Line{j}.ID=150;
                    end
                case 'ON'
                    if Line{j}.ID==0
                        %linear map with csr
                        Line{j}.ID=75;
                    else
                        %nonlinear map with csr
                        Line{j}.ID=250;
                    end
                otherwise
                    error('csrflag should be setted with ON or OFF.\n')
            end
            
            fprintf(fid,'%f %d %d 4 %20.15e 0 %d 1.0 %20.15e %20.15e 0 0 0 / \n', ...
                         Line{j}.Length,Line{j}.steps,maps,Line{j}.BendingAngle,Line{j}.ID, ...
                         Line{j}.EntranceAngle,Line{j}.ExitAngle);
        
        case 'CavityLinearPass'
            % voltage to gradient
            Line{j}.Gradient = Line{j}.Voltage /Line{j}.Length;  
            % phase in AT and Elegant is sin(90), change to ImpactZ cos(0)
            clear tmp_phase; 
            tmp_phase = Line{j}.Phase - 90;
            %steps control
            switch contrl.scflag
                case 'OFF'
                    Line{j}.steps=1;
                case 'ON'
                    Line{j}.steps=ceil(StepNum*Line{j}.Length);
                otherwise
                    error('scflag should be ON or OFF.')
            end 
            %if not defined, by default linear map 
            if Line{j}.ID==0
                % linear map
                Line{j}.ID = -0.5;
            else
                % nonlinear map
                Line{j}.ID = -1.0;
            end  
            % structure wakefield control, it usually is used in pair
            % the first one turn on, the second one turn off
            switch contrl.wakeflag
                case 'OFF'
                    %no printing
                    %wakeID = -1;
                    %fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
                case 'ON'
                    % ON by default refers to L+Twake
                    wakeID = 25;
                    fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
                case 'Lwake'
                    wakeID = 5;
                    fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
                case 'Twake'
                    wakeID = 15;
                    fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
                otherwise
                    error('wakeflag has {OFF, ON, Lwake, Twake} options.')
            end
            % 103 element                
            fprintf(fid,'%f %d %d 103 %30.20e %30.20e %30.20e %d 1.0 / \n', ...
                    Line{j}.Length,Line{j}.steps,maps,Line{j}.Gradient,Line{j}.Frequency,tmp_phase,Line{j}.ID);
            % close the structure wakefield
            if ~strcmp(contrl.wakeflag,'OFF')
                wakeID = -1;
                fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
            end
        case 'ChirpPass'
            % chirp pass, which is modified in Z-code's -21 element
            % -21 element use matrix method, so r56>0, h<0 for compression
            fprintf(fid,'0 0 0 -21 1.0 %22.15e %22.15e 0 0 0 0 / \n', Line{j}.r56, Line{j}.r65);               
        case 'MarkPass'
            % by default, sample is 1.0, bin is 512
            if ~isfield(Line{j},'SampleFreq')
                Line{j}.sample = 1;
            end
            % by default bin number is 128
            if ~isfield(Line{j},'bin')
                Line{j}.bin = 128;
            end
            % if sample frequency is 0, then no output, i.e. no -2 and -8 
            % element written in ImpactZ.in, this is for speeding up
            % optimization
            if Line{j}.SampleFreq > 0   
                % by default add -8 element before every -2 element
                fprintf(fid,'0 0 %d -8 %d / \n',str2num(Line{j}.Name)+1000,Line{j}.bin);
                fprintf(fid,'0 0 %d -2 %d / \n',str2num(Line{j}.Name),Line{j}.SampleFreq);
            end
        case 'SextPass'
            %for thin sext, k2=K2*Lsext
            fprintf(fid,'0 0 1 -55 1.0 0 0 %22.15e / \n',Line{j}.k2);
        case 'HarmCavityPass'
            %for the thin harm cavity generating nonlinear curvature
            %correction
            % harmPhase [degree]
            fprintf(fid,'0 0 0 -40 1.0 %22.15e %22.15e %22.15e / \n', ...
                    Line{j}.Voltage,Line{j}.Phase,Line{j}.HarmNum);            
        otherwise
            error('Wrong passmethod is given.')   
    end
                     
end
fclose(fid);

end
