clear all
clear global
clc
% close all

tmp = const;
mev = tmp.mev_elegant * 1e6;

%% lattice section, all is the same as AT_biaobin
global E_central;         % for AT_biaobin getm66 function
E_central = 250e6;        % beam total energy

E0          = E_central(1);
exn         = 0.3e-6;
ex          = exn/(E0/mev);
ey          = exn/(E0/mev);

%%% linac1
betaIni     = [18.2, 3.8]; 
alphaIni    = [0,0];

% solution of dispersion in period lattice
disp0 = [1.06;0;0;0];
% disp0 = [0;1;0;0];

% sigx0 = sqrt( exn/(E_central(1)/0.511e6) * betaIni(1) );
sig_delta0  = 2e-5 ;
sig_z0      = 1e-3;

twiss_in = struct('ElemIndex',1,   ...
                  'SPos',0,        ...
                  'Energy',E0,...               % Initial beam Energy [eV]
                  'Emittance',[ex,ey],  ...
                  'beta',betaIni,'alpha',alphaIni,  ...
                  'sig_z',sig_z0,'delta',sig_delta0,...   % 1e-8, error will give dispersion
                  'Dispersion',disp0);

% lattice arrangement
% ===================
Kqf01  = 0.5;
Kqf02  =-0.5;

% Four FODO
QF01 = struct('Name','QF01','Length',0.5/2,'K',Kqf01,'PassMethod','QuadLinearPass');
QF02 = struct('Name','QF02','Length',0.5/2,'K',Kqf02,'PassMethod','QuadLinearPass');

%drift length[m]
Ld= 1;
D0  = struct('Name','D0','Length',Ld,'PassMethod','DriftPass');

%bend
theta0 = 2*pi/96;
% theta0 = 1e-6;
Lb = 3;
B0 = struct('Name','B0','Length',Lb,'BendingAngle',theta0,'EntranceAngle', ...
             theta0/2,'ExitAngle',theta0/2,'PassMethod','BendLinearPass');      

CELL0    = {QF01,D0,B0,D0,QF02,QF02,D0,B0,D0,QF01};

Line = [repmat(CELL0,1,5)];


%% phase advance
M_cell0 = getm66(CELL0);
trace_x = M_cell0(1,1)+M_cell0(2,2);

phi = acos(trace_x/2);
phi_D = phi/pi*180

%% get transfer matrix
[M66,ConcaM66] = getm66(Line);

%% Dispersion Plot
TW = gettwiss(Line,twiss_in);

%%
figure(1)
% hold on
plot(TW.s,TW.etax,TW.s,TW.etaxp);

%%
figure(2)
% hold on
plot(TW.s,TW.betax,TW.s,TW.betay);
% grid on
% setplot(h)
 
% %% matrix terms plot
% Nmat = size(ConcaM66,3);
% 
% m11 = ConcaM66(1,1,:);
% m11 = reshape(m11,[Nmat,1]);
% 
% m12 = ConcaM66(1,2,:);
% m12 = reshape(m12,[Nmat,1]);
% 
% m21 = ConcaM66(2,1,:);
% m21 = reshape(m21,[Nmat,1]);
% 
% m22 = ConcaM66(1,1,:);
% m22 = reshape(m22,[Nmat,1]);
% 
% m16 = ConcaM66(1,6,:);
% m16 = reshape(m16,[Nmat,1]);
% 
% m26 = ConcaM66(2,6,:);
% m26 = reshape(m26,[Nmat,1]);
% 
% m51 = ConcaM66(5,1,:);
% m51 = reshape(m51,[Nmat,1]);
% 
% m52 = ConcaM66(5,2,:);
% m52 = reshape(m52,[Nmat,1]);

%%
% figure()
% h = plot(TW.s(2:end),m16)
% xlabel('s (m)'),ylabel('m_{16} (m)')
% grid on
% % setplot(h,'m16.png')
% 
% %
% figure()
% h = plot(TW.s(2:end),m26)
% xlabel('s (m)'),ylabel('m_{26} (m)')
% grid on
% % setplot(h,'m26.png')
% 
% figure()
% h = plot(TW.s(2:end),m51)
% xlabel('s (m)'),ylabel('m_{51} (m)')
% grid on
% % setplot(h,'m51.png')
% 
% figure()
% h = plot(TW.s(2:end),m52)
% xlabel('s (m)'),ylabel('m_{52} (m)')
% grid on
% % setplot(h,'m52.png')
% 
% figure()
% h = plot(TW.s(2:end),m11)
% xlabel('s (m)'),ylabel('m_{11} (m)')
% grid on
% % setplot(h,'m11.png')

%%
% figure()
% h = plot(TW.s(2:end),m12)
% xlabel('s (m)'),ylabel('m_{12} (m)')
% grid on
% setplot(h,'m12.png')

% %%
% figure()
% h = plot(TW.s(2:end),m21)
% xlabel('s (m)'),ylabel('m_{21} (m)')
% grid on
% % setplot(h,'m21.png')
% 
% figure()
% h = plot(TW.s(2:end),m22)
% xlabel('s (m)'),ylabel('m_{22} (m)')
% grid on
% % setplot(h,'m22.png')



          






