function getControl(input1,contrl)
%biaobin, 2018-10-25, get the section of control in ImpactZ.in

% calculations
f0      =  const.c_mks/(2*pi);                       % Evolution frequency,[Hz]
q_m     = -1/(const.mev_impact *1e6);                % q/m for electron
W0      =  input1.E0 - const.mev_impact*1E6;          % Kinetic energy from total energy,[eV]

% collective effects control
switch contrl.scflag
    case 'OFF'
        I_avef0 = 0;
    case 'ON'
        I_avef0 = input1.Q *f0;
    otherwise
        error('contrl.scflag should be OFF or ON.')
end

% write into ImpactZ.in
% disp('Warning: Initial ImpactZ.in will be deleted.')
% disp(' ')
!rm -f ImpactZ.in
fid = fopen('ImpactZ.in','w');
control_file = [ ...
'%d %d \n' ...                   %1. processor layout
'6 %d 1 0 1 \n' ...              %2. particle number
'%d %d %d 1 1.0 1.0 0.1 \n' ...  %3. grid setting
'%d 0 0 1 \n' ...                %4. distribution type
'%d \n' ...                      %5. particle list for each charge state
'%22.15e \n' ...                 %6. current for each charge state [A]
'%22.15e \n' ...                 %7. q/m for electron
'%22.15e %22.15e %22.15e 1 1 0 0 \n' ...    %8. sigx ...
'%22.15e %22.15e %22.15e 1 1 0 0 \n' ...    %9. sigy ... 
'%22.15e %22.15e %22.15e 1 1 0 0 \n' ...    %10. sigz ...
'%22.15e %22.15e %22.15e -1.0 %22.15e 0.0 \n' %11. current
];

in_va = [input1.proc ...            %1.
         input1.par_num ...         %2.
         input1.grid ...            %3. input valuable
         input1.dis_label ...       %4
         input1.par_num ...         %5
         I_avef0 ...            %6 ???
         q_m  ...               %7
         input1.sigx input1.sigpx    input1.sigxpx   ...         %8
         input1.sigy input1.sigpy    input1.sigypy   ...         %9
         input1.sigz input1.sig_dgam input1.sigzdgam ...         %10
         I_avef0 W0 const.mev_impact*1E6 f0 ...      %11       
         ];

fprintf(fid,control_file,in_va);
fclose(fid);

end
