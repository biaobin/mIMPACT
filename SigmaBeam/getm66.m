function [M66, ConcaM66] = getm66(Line)
%biaobin, 2018-10-26, consider r56 in drift section

% get first order concatenated transfer matrix after every element.
% - LATTICE, lattice line, structure elements
% - M66,    total matrix of the whole line
% - ConcaM66, concatenated matrix at each step, 6*6*N matrix

% switch nargin
%     case 1
%         if ~iscell(Line)
%             error('Lattice should be cell array.');
%         end
%         E_central(1)=0; % default beam energy.
%     case 2
%         if isnumeric(varargin{1})
%             E_central(1) = varargin{1};
%         else
%             error('Second argument must be a numerical number.')
%         end
%     otherwise
%         error('Wrong input arguments.')        
% end
    
if ~iscell(Line)
    error('Lattice should be cell array.');
end

global E_central

% elements number
NE = length(Line);

M66    = [];
ConcaM66(:,:,1) = eye(6,6);

for j=1:NE
    % according to PassMethod to call the transfer matrix
    switch Line{j}.PassMethod
        case 'DriftPass'
            E_central(j+1) = E_central(j); 
            beta=e2beta(E_central(j)/1E6);            
            mat = Md(Line{j}.Length,1);
            
        case 'BendLinearPass'
            E_central(j+1) = E_central(j);
            beta=e2beta(E_central(j)/1E6);                
            mat = Mb(Line{j}.Length,Line{j}.BendingAngle,...
                     Line{j}.EntranceAngle,Line{j}.ExitAngle,1);
    %split dipole into three sections, for debuging ImpactZ
        case 'DipoleE1Pass'
            E_central(j+1) = E_central(j);
            beta=e2beta(E_central(j)/1E6);                
            mat = MbE1(Line{j}.Length,Line{j}.BendingAngle,...
                     Line{j}.EntranceAngle,Line{j}.ExitAngle,1);
        case 'DipoleE2Pass'
            E_central(j+1) = E_central(j);
            beta=e2beta(E_central(j)/1E6);                
            mat = MbE2(Line{j}.Length,Line{j}.BendingAngle,...
                     Line{j}.EntranceAngle,Line{j}.ExitAngle,1);
        case 'DipoleSectorPass'
            E_central(j+1) = E_central(j);
            beta=e2beta(E_central(j)/1E6);                
            mat = MbSector(Line{j}.Length,Line{j}.BendingAngle,...
                     Line{j}.EntranceAngle,Line{j}.ExitAngle,1);
         
        case 'QuadLinearPass'
            E_central(j+1) = E_central(j);
            beta=e2beta(E_central(j)/1E6);              
            mat = Mq(Line{j}.Length,Line{j}.K,1);
            
        case 'CavityInPass'
            % give the beam energy at the entrance
            E_central(j+1) = E_central(j);
            mat = MacIn(Line{j}.Length,Line{j}.Voltage,....
                      Line{j}.Phase,Line{j}.Frequency,E_central(j));     

        case 'CavityOutPass'
            % give the beam energy at the entrance
            E_central(j+1) = E_central(j);
            mat = MacOut(Line{j}.Length,Line{j}.Voltage,....
                      Line{j}.Phase,Line{j}.Frequency,E_central(j));     

        case 'CavityMidPass'
            % give the beam energy at the entrance
            E_central(j+1) = E_central(j) + Line{j}.Voltage * sin(Line{j}.Phase * pi/180);
            mat = MacMid(Line{j}.Length,Line{j}.Voltage,....
                      Line{j}.Phase,Line{j}.Frequency,E_central(j));     
                
        case 'CavityLinearPass'
            % give the beam energy at the entrance
            E_central(j+1) = E_central(j) + Line{j}.Voltage * sin(Line{j}.Phase * pi/180);
            mat = Mac(Line{j}.Length,Line{j}.Voltage,....
                      Line{j}.Phase,Line{j}.Frequency,E_central(j));  

        % add chirp matrix
        case 'ChirpPass'
            E_central(j+1) = E_central(j); 
            mat = Mchirp(Line{j}.r65);                   

        % ----------------------------------------------------------
        % following are all drift=0 matrix, just for ImpactZ.in file
        % ignore all the nonlinear elements
        case {'MarkPass', 'SextPass', 'HarmCavityPass'}
            E_central(j+1) = E_central(j); 
%             Line{j}.Length = 0;
            mat = Md(Line{j}.Length);
                 
        otherwise
            error('Wrong passmethod is given.')        
    end

    ConcaM66(:,:,j+1)= mat * ConcaM66(:,:,j);
end

% % delete the first eye matrix of ConcaM66
ConcaM66(:,:,1)=[];

M66 = ConcaM66(:,:,NE);
end











