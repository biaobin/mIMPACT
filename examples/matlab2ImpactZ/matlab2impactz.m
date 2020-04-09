clear all
clear global
clc
%% nonliner map or linear map
ID_quad   = 0;
ID_dipole = 0;
ID_drift  = 0;
ID_cavity = 0;

% -2 or -8 elements
sampleFreq = 1;

% collective effects contrl
contrl.scflag     = 'OFF';
contrl.csrflag    = 'OFF';
contrl.wakeflag   = 'OFF';  
contrl.wakefileID =  41;

contrl.StepNum = 1;
%% lattice section
tmp = const;
mev = tmp.mev_elegant * 1e6;

global E_central;         % for AT_biaobin getm66 function
E_central = 100e6;        % beam total energy
E0          = E_central(1);
enx         = 0.3e-6;
eny         = 0.3e-6;
ex          = enx/(E0/mev);
ey          = enx/(E0/mev);

betaIni     = [26.0926, 26.0926]; 
alphaIni    = [0,0];
disp0 = [0;0;0;0];
%longitudinal parameters
sig_delta0  = 2e-5;  
sig_z0      = 1.44e-3;
% transfer to twiss format
sigE    = sig_delta0 *E0/1e6;   %[MeV]
sig_phi = sig_z0*180/pi;
enz     = sig_phi*sigE;
betaz = sig_phi^2/enz;
alphaz= 0;

% for Beam-Sigma program
twiss_in = struct('ElemIndex',1,   ...
                  'SPos',0,        ...
                  'Energy',E0,...               % Initial beam Energy [eV]
                  'Emittance',[ex,ey],  ...
                  'beta',betaIni,'alpha',alphaIni,  ...
                  'sig_z',sig_z0,'delta',sig_delta0,...   % 1e-8, error will give dispersion
                  'Dispersion',disp0);
              
%% control section for ImpactZ.in
% control section, 1-11 lines
% ===========================
proc = [1 1];
gridNum = [32 32 256];

dis_label = 45;  % 45 distribution type, (x,y) uniform eclipse, z uniform, others gaussian
par_num   = 1E5; % particle number
I0        = 20;

% uniform distribution
Lbunch = 2*sqrt(3)*sig_z0;
Q = I0*(Lbunch/(const.c_mks*e2beta(E0/1e6)));

%control section input1 struct
input1 = struct('proc',proc,'grid',gridNum,'E0',E0,     ...
                'par_num',par_num,'Q',Q,'dis_label',dis_label, ...
                'alphax',alphaIni(1),'betax',betaIni(1),'enx',enx,     ...
                'alphay',alphaIni(2),'betay',betaIni(2),'eny',eny,     ...
                'alphaz',alphaz,'betaz',betaz,'enz',enz);

%% lattice arrangement
% dipoles
% ============
Lb        = 0.2;
theta1    = 0.1105843492438955;
BC1A = struct('Name','BC1A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta1,'EntranceAngle',0,'ExitAngle',theta1,'ID',ID_dipole);
BC2A = struct('Name','BC2A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta1,'EntranceAngle',-theta1,'ExitAngle',0,'ID',ID_dipole);
BC3A = struct('Name','BC3A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta1,'EntranceAngle',0,'ExitAngle',-theta1,'ID',ID_dipole);
BC4A = struct('Name','BC4A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta1,'EntranceAngle',theta1,'ExitAngle',0,'ID',ID_dipole);
% drift lines
% ============
Ldc1a=2.5;
Ldcma=0.65;
DC1A = struct('Name','DC1A','Length',Ldc1a,'PassMethod','DriftPass','ID',ID_drift);
DCMA = struct('Name','DCMA','Length',Ldcma,'PassMethod','DriftPass','ID',ID_drift);

Kqca = 0;
QCA = struct('Name','QCA','Length',0.2,'K',Kqca,'PassMethod','QuadLinearPass','ID',ID_quad);

BC1 = {BC1A,DC1A,BC2A,DCMA,QCA,DCMA,BC3A,DC1A,BC4A};
Line = BC1;

%% write into ImpactZ.in
getControlImpactZ(input1,contrl);            
getLatticeImpactZ(Line,contrl);

%% get transfer matrix
[M66,ConcaM66] = getm66(Line);

%% Twiss parameters plot
T = gettwiss(Line,twiss_in);

%%%
figure()
h=plot(T.s,T.etax,'-');
legend('\eta_x')
xlabel('s [m]'),ylabel('dispersion [m]')
grid on
 
%%%
figure()
h=semilogy(T.s,T.sigx*1e3,'-',T.s,T.sigy*1e3,'-');
xlabel('s (m)'),ylabel('beam radius (mm)')
legend('\sigma_x','\sigma_y')

%%%
figure()
h=semilogy(T.s,T.exn,T.s,T.eyn);
xlabel('s (m)'),ylabel('norm. emittance (mm\cdot mrad)')
legend('enx','eny')

%% matrix terms plot
Nmat = size(ConcaM66,3);

m16 = ConcaM66(1,6,:);
m16 = reshape(m16,[Nmat,1]);

m26 = ConcaM66(2,6,:);
m26 = reshape(m26,[Nmat,1]);

m51 = ConcaM66(5,1,:);
m51 = reshape(m51,[Nmat,1]);

m52 = ConcaM66(5,2,:);
m52 = reshape(m52,[Nmat,1]);

m56 = ConcaM66(5,6,:);
m56 = reshape(m56,[Nmat,1]);
%%%
figure()
h = plot(T.s(2:end),m52);
xlabel('s (m)'),ylabel('m_{56} (m)')
grid on



          






