function getLattice(Line,contrl)
%Line, lattice arrangements
%contrl,
%  contrl.csrflag, 0 csr OFF, 1 csr ON
%  contrl.scflag, 0 sc OFF, steps=1; 1 sc ON, steps=3/m

% %by default, space charge is off
% if ~isfield(contrl,'scflag')
%     %if scflag is 1, then steps should be setted properly
%     scflag = 0;
% else
%     scflag = contrl.scflag;
% end
% %by default, csr is off
% if ~isfield(contrl,'csrflag')
%     csrflag = 0; 
% else
%     csrflag = contrl.csrflag;
% end
% %by default wakefield is off
% if ~isfield(contrl,'wakeflag')
%     wakeID = -1;
% end
% 
% %by default, cavity structure wakefield fileID=41
% if ~isfield(contrl,'wakefileID')
%     wakefileID=41;
% else
%     wakefileID = contrl.wakefileID;
% end

fid = fopen('ImpactZ.in','a+');
fprintf(fid,'!==========lattice=========== \n');

% ceil(Line{j}.Length)

for j=1:length(Line)
    switch Line{j}.PassMethod
        case 'DriftPass'            
            if contrl.scflag==0
                Line{j}.steps=1;
            elseif contrl.scflag==1
                %the actual steps should be got from gerNkicks,
                %but this function need sigx,y and current information,
                %which need SigmaBeam's help.
                %add in future, right now using 3/m
                Line{j}.steps=ceil(3*Line{j}.Length);
            else
                error('wrong contrl.scflag is given, 0 for OFF, 1 for ON.');
            end                           
            % bydefault, ID = 0, linear map
            if ~isfield(Line{j},'ID')
                Line{j}.ID = 0;
            elseif Line{j}.ID==0
                % linear map with ID=0
                Line{j}.ID = 0;
            elseif Line{j}.ID==1
                % nonlinear map with ID=5
                Line{j}.ID = 5;
            else 
                error('wrong ID flag for drift.')
            end
                        
            fprintf(fid,'%f %d %d 0 1.0 %d / \n',Line{j}.Length,Line{j}.steps,maps,Line{j}.ID);
        case 'QuadLinearPass'
            %ID=-1, gradient is K1
            %ID(-10,0),linear map
            %ID<-10, real map
            
            %if not defined, by default linear map 
            if ~isfield(Line{j},'ID') 
                Line{j}.ID = -5;   
            elseif Line{j}.ID == 0
                % linear map with ID=-5
                Line{j}.ID = -5;
            elseif Line{j}.ID == 1
                % nonlinear map with ID=-15
                Line{j}.ID = -15;
            else 
                error('wrong ID flag for quad.')
            end 
            
            %steps setting
            if contrl.scflag==0
                Line{j}.steps=1;
            elseif contrl.scflag==1
                Line{j}.steps=ceil(3*Line{j}.Length);
            else
                error('wrong contrl.scflag is given, 0 for OFF, 1 for ON.');
            end
            
            fprintf(fid,'%f %d %d 1 %20.15e %d 1.0 0 0 0 0 0 / \n', ...
                        Line{j}.Length,Line{j}.steps,maps,Line{j}.K,Line{j}.ID);                         
        case 'BendLinearPass'
            %steps setting
            if contrl.scflag==0
                Line{j}.steps=1;
            elseif contrl.scflag==1
                Line{j}.steps=ceil(3*Line{j}.Length);
            else
                error('wrong contrl.scflag is given, 0 for OFF, 1 for ON.');
            end
            
            %if not defined, by default linear map, no csr 
            if ~isfield(Line{j},'ID') 
                Line{j}.ID = 25;   
            elseif Line{j}.ID==0
                if csrflag==0                    
                    % linear map with ID=25
                    Line{j}.ID = 25;
                elseif csrflag==1
                    Line{j}.ID = 75;
                else
                    error('wrong csrflag is given, 0 OFF, 1 ON.');
                end                
            elseif Line{j}.ID==1
                if csrflag==0
                    % nonlinear map with csr OFF
                    Line{j}.ID = 150;
                elseif csrflag==1
                    % nonlinear map with csr ON
                    Line{j}.ID = 250;
                else
                    error('wrong csrflag is given, 0 OFF, 1 ON.');
                end                
            else 
                error('wrong ID flag for dipole.');
            end
            fprintf(fid,'%f %d %d 4 %20.15e 0 %d 1.0 %20.15e %20.15e 0 0 0 / \n', ...
                         Line{j}.Length,Line{j}.steps,maps,Line{j}.BendingAngle,Line{j}.ID, ...
                         Line{j}.EntranceAngle,Line{j}.ExitAngle);
        
        case 'CavityLinearPass'
            % voltage to gradient
            Line{j}.Gradient = Line{j}.Voltage /Line{j}.Length;  
            % phase in AT and Elegant is sin(90), change to ImpactZ cos(0)
            cosphase = Line{j}.Phase - 90;
           
            %steps setting
            if contrl.scflag==0 
                Line{j}.steps=1;
            elseif contrl.scflag==1
                Line{j}.steps=ceil(3*Line{j}.Length);
            else
                error('wrong contrl.scflag is given, 0 for OFF, 1 for ON.');
            end
            
            %if not defined, by default linear map 
            if ~isfield(Line{j},'ID') 
                Line{j}.ID = -0.5;  
            elseif Line{j}.ID==0
                % linear map
                Line{j}.ID = -0.5;
            elseif Line{j}.ID==1
                % nonlinear map
                Line{j}.ID = -1.0;
            else 
                error('wrong ID flag for cavity 103.')
            end
            %---------
            %by default, cavity structure wakefield is OFF.
            %-41 element is always used in pair, first one turn ON wake,
            %second one turn OFF.
            %wake file saved in rfdata(fileID), default is rfdate41
            if contrl.wakeflag=='OFF'
                wakeID = -1;
                fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
            elseif contrl.wakeflag == 'LWAKE'
                %only turn on Longitudinal wake
                wakeID = 5;
                fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
            elseif contrl.wakeflag == 'TWAKE'
                %only transverse wake is turned on
                wakeID = 15;
                fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
            elseif or(contrl.wakeflag=='LTWAKE',contrl.wakeflag=='TLWAKE')
                wakeID = 25;
                fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',contrl.wakefileID,wakeID);
            else
                error('wrong wakeflag is given. Either (OFF,LWAKE,TWAKE,LTWAKE,TLWAKE) should be used.')
            end
            %print 103 element
            fprintf(fid,'%f %d %d 103 %30.20e %30.20e %30.20e %d 1.0 / \n', ...
                    Line{j}.Length,Line{j}.steps,maps,Line{j}.Gradient,Line{j}.Frequency,cosphase,Line{j}.ID);
            %close the wakefield
            wakeID=-1;
            fprintf(fid,'0 0 1 -41 1.0 %d %d / \n',wakefileID,wakeID);                
        case 'ChirpPass'
            % chirp pass, which is modified in Z-code's -21 element
            % -21 element use matrix method, so r56>0, h<0 for compression
            fprintf(fid,'0 0 0 -21 1.0 %22.15e %22.15e 0 0 0 0 / \n', Line{j}.r56, Line{j}.r65);               
        case 'MarkPass'
            % by default, sample is 1.0, bin is 128
            if ~isfield(Line{j},'sample')
                Line{j}.sample = 1;
            end
            
            if ~isfield(Line{j},'bin')
                Line{j}.bin = 128;
            end
            % if sample frequency is 0, then no output, i.e. no -2 and -8 
            % element written in ImpactZ.in, this is for speeding up
            % optimization
            if Line{j}.sample > 0                       
                fprintf(fid,'0 0 %d -2 %d / \n',str2num(Line{j}.Name),Line{j}.sample);
                %by default add -8 element after every -2 element
                fprintf(fid,'0 0 %d -8 %d / \n',str2num(Line{j}.Name)+1000,Line{j}.bin);
            end
        case 'SextPass'
            %for thin sext, k2=K2*Lsext
            fprintf(fid,'0 0 1 -55 1.0 0 0 %22.15e / \n',Line{j}.k2);
        case 'HarmCavityPass'
            %for the thin harm cavity generating nonlinear curvature
            %correctionff
            % harmPhase [degree]
            fprintf(fid,'0 0 0 -40 1.0 %22.15e %22.15e %22.15e / \n', ...
                    Line{j}.Voltage,Line{j}.Phase,Line{j}.HarmNum);            
        otherwise
            error('Wrong passmethod is given.')   
    end
                     
end
fclose(fid);

end