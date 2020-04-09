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

%% lattice section, all is the same as AT_biaobin
tmp = const;
mev = tmp.mev_elegant * 1e6;

global E_central;         % for AT_biaobin getm66 function
E_central = 100e6;        % beam total energy
E0          = E_central(1);
exn         = 0.3e-6;
ex          = exn/(E0/mev);
ey          = exn/(E0/mev);

betaIni     = [26.0926, 26.0926]; 
alphaIni    = [0,0];
disp0 = [0;0;0;0];
% sigx0 = sqrt( exn/(E_central(1)/0.511e6) * betaIni(1) );

sig_delta0  = 2e-5;  %damping effects
sig_z0      = 1.44e-3;

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
proc = [8 8];
gridNum = [128 64 128];

dis_label = 45;           % 45 distribution type, (x,y) uniform eclipse, z uniform, others gaussian

par_num   = 20E6;         % particle number
I0        = 20;
% I0 = 0;

% SIGMA distribution
rb = 0.4e-3;

sigx = 0.5*rb;
sigy = 0.5*rb;

sigxp = ex/sigx;
sigyp = ey/sigy;

sigpx = sigxp * e2p(E0/1e6);
sigpy = sigyp * e2p(E0/1e6);

sigz  = 2.5e-3;                            % uniform z distribution, sigz=1/2 Lbunch
sig_dgam = sig_delta0 *e2gamma(E0/1e6);    % sigma(Delta gamma)

Lbunch = 2*sigz;
Q = I0*(Lbunch/(const.c_mks*e2beta(E0/1e6)));

sigxpx   = 0;
sigypy   = 0;
sigzdgam = 0;

%control section input1 struct
input1 = struct('proc',proc,'grid',gridNum,'E0',E0,     ...
                'par_num',par_num,'Q',Q,'dis_label',dis_label, ...
                'sigx',rb,'sigpx',sigpx,'sigxpx',sigxpx,     ...
                'sigy',rb,'sigpy',sigpy,'sigypy',sigypy,     ...
                'sigz',sigz,'sig_dgam',sig_dgam,'sigzdgam',sigzdgam);

%% lattice arrangement
% ===================
MARKL0BEG  = struct('Name','1020','Length',0,'PassMethod','MarkPass','SampleFreq',sampleFreq);
MARKL1END  = struct('Name','1023','Length',0,'PassMethod','MarkPass','SampleFreq',sampleFreq);
MARKL2END  = struct('Name','1025','Length',0,'PassMethod','MarkPass','SampleFreq',sampleFreq);
MARKL4END  = struct('Name','1029','Length',0,'PassMethod','MarkPass','SampleFreq',sampleFreq);
MARKBC1END = struct('Name','1033','Length',0,'PassMethod','MarkPass','SampleFreq',sampleFreq);
MARKBC2END = struct('Name','1035','Length',0,'PassMethod','MarkPass','SampleFreq',sampleFreq);
MARKDOGEND = struct('Name','1027','Length',0,'PassMethod','MarkPass','SampleFreq',sampleFreq);

% dipoles
% ============
Lb        = 0.2;
LbDOG     = 0.8;
theta0    = 0.03992591;
% theta1    = 0.12264115;
% with quad, back to r56=0.08
theta1    = 0.1105843492438955;
theta2    = 0.09713503;
theta_DOG = 0.01;

BC10 = struct('Name','BC10','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta0,'EntranceAngle',0,'ExitAngle',theta0,'ID',ID_dipole);
BC20 = struct('Name','BC20','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta0,'EntranceAngle',-theta0,'ExitAngle',0,'ID',ID_dipole);
BC30 = struct('Name','BC30','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta0,'EntranceAngle',0,'ExitAngle',-theta0,'ID',ID_dipole);
BC40 = struct('Name','BC40','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta0,'EntranceAngle',theta0,'ExitAngle',0,'ID',ID_dipole);

BC1A = struct('Name','BC1A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta1,'EntranceAngle',0,'ExitAngle',theta1,'ID',ID_dipole);
BC2A = struct('Name','BC2A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta1,'EntranceAngle',-theta1,'ExitAngle',0,'ID',ID_dipole);
BC3A = struct('Name','BC3A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta1,'EntranceAngle',0,'ExitAngle',-theta1,'ID',ID_dipole);
BC4A = struct('Name','BC4A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta1,'EntranceAngle',theta1,'ExitAngle',0,'ID',ID_dipole);

BC1B = struct('Name','BC1B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta2,'EntranceAngle',0,'ExitAngle',theta2,'ID',ID_dipole);
BC2B = struct('Name','BC2B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta2,'EntranceAngle',-theta2,'ExitAngle',0,'ID',ID_dipole);
BC3B = struct('Name','BC3B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta2,'EntranceAngle',0,'ExitAngle',-theta2,'ID',ID_dipole);
BC4B = struct('Name','BC4B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta2,'EntranceAngle',theta2,'ExitAngle',0,'ID',ID_dipole);

BG1 = struct('Name','BDOG1','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',theta_DOG,'EntranceAngle',0.5*theta_DOG,'ExitAngle',0.5*theta_DOG,'ID',ID_dipole);
BG2 = struct('Name','BDOG2','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',theta_DOG,'EntranceAngle',0.5*theta_DOG,'ExitAngle',0.5*theta_DOG,'ID',ID_dipole);
BG3 = struct('Name','BDOG2','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta_DOG,'EntranceAngle',-0.5*theta_DOG,'ExitAngle',-0.5*theta_DOG,'ID',ID_dipole);
BG4 = struct('Name','BDOG2','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta_DOG,'EntranceAngle',-0.5*theta_DOG,'ExitAngle',-0.5*theta_DOG,'ID',ID_dipole);          
          
% drift lines
% =============
Ldc0r=0.1;
Ldcm0=0.9;
Ldc11=1.4;
Ldc12=1.4;
Ldc1l=0.2;
Ldc1r=0.9282630768268429;
Ldc1a=2.5;
Ldcma=0.65;
Ldc2l=0.2;
Ldc2r=1.999999927856385;
Ldc1b=2.5;
Ldcmb=1.5;
Ldm01=8.498678750574161e-08;
Ldm02=1.927964676001367;
Ldm03=1.062857909837083;
Ldm04=0.6750421765444645;
Ldm012=0.0006082713160405946;
Ldm022=1.293328074363445;
Ldm032=1.588564164984896;
Ldm042=1.999999844967575;
Ldm11=0.3412687804968184;
Ldm12=0.6368510845197564;
Ldm13=0.6900401830947493;
Ldm14=1.572229169083766;
Ldm15=0.3920810735326503;
Ldm21=0.0001661433943732535;
Ldm22=0.0002355506898472225;
Ldm23=1.999874733156696;
Ldm24=1.425307444261794;
Ldm310=0.0003281720724559068;
Ldm320=1.949258047091275;
Ldm330=0.7811412361508987;
Ldm340=0.2455719769904053;
Ldm311=4.136481615752504;
Ldm321=9.747368137252153;
Ldm331=8.91004174437607;
Ldm341=0.001311570128571062;
Lddogl=1.494510713459225;
Lddogr=6.890270377239767;
Ldg1a=0.01286806013449762;
Ldg1b=1.701297054710298;
Ldg2a=0.9155460774270912;
Ldg2b=0.6706352879009623;
Ldg3a=0.01286806013449762;
Ldg3b=1.701297054710298;
Ldund=23.8823;
Ldfodo=15;
Ldcav=0.1;

DC0R = struct('Name','DC0R','Length',Ldc0r,'PassMethod','DriftPass','ID',ID_drift);
DC11 = struct('Name','DC11','Length',Ldc11,'PassMethod','DriftPass','ID',ID_drift);
DC12 = struct('Name','DC12','Length',Ldc12,'PassMethod','DriftPass','ID',ID_drift);
DCM0 = struct('Name','DCM0','Length',Ldcm0,'PassMethod','DriftPass','ID',ID_drift);

DC1L = struct('Name','DC1L','Length',Ldc1l,'PassMethod','DriftPass','ID',ID_drift);
DC1R = struct('Name','DC1R','Length',Ldc1r,'PassMethod','DriftPass','ID',ID_drift);
DC1A = struct('Name','DC1A','Length',Ldc1a,'PassMethod','DriftPass','ID',ID_drift);
DCMA = struct('Name','DCMA','Length',Ldcma,'PassMethod','DriftPass','ID',ID_drift);

DC2L = struct('Name','DC2L','Length',Ldc2l,'PassMethod','DriftPass','ID',ID_drift);
DC2R = struct('Name','DC2R','Length',Ldc2r,'PassMethod','DriftPass','ID',ID_drift);
DC1B = struct('Name','DC1B','Length',Ldc1b,'PassMethod','DriftPass','ID',ID_drift);
DCMB = struct('Name','DCMB','Length',Ldcmb,'PassMethod','DriftPass','ID',ID_drift);

DM01 = struct('Name','DM01','Length',Ldm01,'PassMethod','DriftPass','ID',ID_drift);
DM02 = struct('Name','DM02','Length',Ldm02,'PassMethod','DriftPass','ID',ID_drift);
DM03 = struct('Name','DM03','Length',Ldm03,'PassMethod','DriftPass','ID',ID_drift);
DM04 = struct('Name','DM04','Length',Ldm04,'PassMethod','DriftPass','ID',ID_drift);

DM012 = struct('Name','DM01','Length',Ldm012,'PassMethod','DriftPass','ID',ID_drift);
DM022 = struct('Name','DM02','Length',Ldm022,'PassMethod','DriftPass','ID',ID_drift);
DM032 = struct('Name','DM03','Length',Ldm032,'PassMethod','DriftPass','ID',ID_drift);
DM042 = struct('Name','DM04','Length',Ldm042,'PassMethod','DriftPass','ID',ID_drift);

DM11 = struct('Name','DM11','Length',Ldm11,'PassMethod','DriftPass','ID',ID_drift);
DM12 = struct('Name','DM12','Length',Ldm12,'PassMethod','DriftPass','ID',ID_drift);
DM13 = struct('Name','DM13','Length',Ldm13,'PassMethod','DriftPass','ID',ID_drift);
DM14 = struct('Name','DM14','Length',Ldm14,'PassMethod','DriftPass','ID',ID_drift);

DM21 = struct('Name','DM21','Length',Ldm21,'PassMethod','DriftPass','ID',ID_drift);
DM22 = struct('Name','DM22','Length',Ldm22,'PassMethod','DriftPass','ID',ID_drift);
DM23 = struct('Name','DM23','Length',Ldm23,'PassMethod','DriftPass','ID',ID_drift);
DM24 = struct('Name','DM24','Length',Ldm24,'PassMethod','DriftPass','ID',ID_drift);

DM310 = struct('Name','DM310','Length',Ldm310,'PassMethod','DriftPass','ID',ID_drift);
DM320 = struct('Name','DM320','Length',Ldm320,'PassMethod','DriftPass','ID',ID_drift);
DM330 = struct('Name','DM330','Length',Ldm330,'PassMethod','DriftPass','ID',ID_drift);
DM340 = struct('Name','DM340','Length',Ldm340,'PassMethod','DriftPass','ID',ID_drift);

DM311 = struct('Name','DM311','Length',Ldm311,'PassMethod','DriftPass','ID',ID_drift);
DM321 = struct('Name','DM321','Length',Ldm321,'PassMethod','DriftPass','ID',ID_drift);
DM331 = struct('Name','DM331','Length',Ldm331,'PassMethod','DriftPass','ID',ID_drift);
DM341 = struct('Name','DM341','Length',Ldm341,'PassMethod','DriftPass','ID',ID_drift);

DDOGL = struct('Name','DDOGL','Length',Lddogl,'PassMethod','DriftPass','ID',ID_drift);
DDOGR = struct('Name','DDOGR','Length',Lddogr,'PassMethod','DriftPass','ID',ID_drift);

DG1A = struct('Name','DG1A','Length',Ldg1a,'PassMethod','DriftPass','ID',ID_drift);
DG1B = struct('Name','DG1B','Length',Ldg1b,'PassMethod','DriftPass','ID',ID_drift);

DG2A = struct('Name','DG2A','Length',Ldg2a,'PassMethod','DriftPass','ID',ID_drift);
DG2B = struct('Name','DG2B','Length',Ldg2b,'PassMethod','DriftPass','ID',ID_drift);

DG3A = struct('Name','DG3A','Length',Ldg3a,'PassMethod','DriftPass','ID',ID_drift);
DG3B = struct('Name','DG3B','Length',Ldg3b,'PassMethod','DriftPass','ID',ID_drift);

DUND  = struct('Name','DUND','Length',Ldund,'PassMethod','DriftPass','ID',ID_drift);
DCAV  = struct('Name','DCAV','Length',Ldcav,'PassMethod','DriftPass','ID',ID_drift);

Drift  = struct('Name','Drift','Length',10,'PassMethod','DriftPass','ID',ID_drift);

% Quadrupoles
% ===========
Kqc11 =-7.4551;
Kqc12 =7.5933;
Kqcm0 =-4.6022;
Kqca  =0.8337326224808579;
Kqm01 =-1.125605779081177;
Kqm02 =-1.025328280497717;
Kqm03 =3.310600131770449;
Kqm04 =-4.895554956167152;
Kqm012=-6.379499709352409;
Kqm022=0.5997478590261117;
Kqm032=3.202951442607972;
Kqm042=-2.193541729792075;
Kqm11 =-5.722141779238331;
Kqm12 =7.200852098771735;
Kqm13 =-3.217107242016935;
Kqm14 =-4.132022023383273;
Kqm15 =6.567715690088781;
Kqm21 =0.650666763091882;
Kqm22 =-2.021258365074747;
Kqm23 =1.31617193999209;
Kqm24 =-0.5259714349650685;
Kqm310=-0.3219852581007244;
Kqm320=0.8254105841901698;
Kqm330=-2.685331546226791;
Kqm340=1.103946557997504;
Kqm311=-1.320968147797335;
Kqm321=1.07822241276111;
Kqm331=-1.896303200792007;
Kqm341=2.012798788343432;
Kqg1f =0.03004206660714321;
Kqg1da=0.4193135017021257;
Kqg1db=-0.01777770876178663;
Kqg2fa=-1.424566806413429;
Kqg2fb=0.420085415754379;
Kqg2d =0.3029690043764623;
Kqg3f =-1.835682575640526;
Kqg3da=0.862605309523;
Kqg3db=1.24459798007608;
Kqf01 =0.9266799999999999;
Kqf02 =-0.9266799999999999;
Kqf11 =0.800204;
Kqf12 =-0.800204;
Kqf21 =0.988561;
Kqf22 =-0.988561;
Kqf31 =0.296226;
Kqf32 =-0.296226;

QCA = struct('Name','QCA','Length',0.2,'K',Kqca,'PassMethod','QuadLinearPass','ID',ID_quad);

QM01 = struct('Name','QM012','Length',0.1,'K',Kqm01,'PassMethod','QuadLinearPass','ID',ID_quad);
QM02 = struct('Name','QM022','Length',0.1,'K',Kqm02,'PassMethod','QuadLinearPass','ID',ID_quad);
QM03 = struct('Name','QM032','Length',0.1,'K',Kqm03,'PassMethod','QuadLinearPass','ID',ID_quad);
QM04 = struct('Name','QM042','Length',0.1,'K',Kqm04,'PassMethod','QuadLinearPass','ID',ID_quad);

QM012 = struct('Name','QM012','Length',0.1,'K',Kqm012,'PassMethod','QuadLinearPass','ID',ID_quad);
QM022 = struct('Name','QM022','Length',0.1,'K',Kqm022,'PassMethod','QuadLinearPass','ID',ID_quad);
QM032 = struct('Name','QM032','Length',0.1,'K',Kqm032,'PassMethod','QuadLinearPass','ID',ID_quad);
QM042 = struct('Name','QM042','Length',0.1,'K',Kqm042,'PassMethod','QuadLinearPass','ID',ID_quad);

QM11 = struct('Name','QM11','Length',0.1,'K',Kqm11,'PassMethod','QuadLinearPass','ID',ID_quad);
QM12 = struct('Name','QM12','Length',0.1,'K',Kqm12,'PassMethod','QuadLinearPass','ID',ID_quad);
QM13 = struct('Name','QM13','Length',0.1,'K',Kqm13,'PassMethod','QuadLinearPass','ID',ID_quad);
QM14 = struct('Name','QM14','Length',0.1,'K',Kqm14,'PassMethod','QuadLinearPass','ID',ID_quad);

QM21 = struct('Name','QM21','Length',0.1,'K',Kqm21,'PassMethod','QuadLinearPass','ID',ID_quad);
QM22 = struct('Name','QM22','Length',0.1,'K',Kqm22,'PassMethod','QuadLinearPass','ID',ID_quad);
QM23 = struct('Name','QM23','Length',0.1,'K',Kqm23,'PassMethod','QuadLinearPass','ID',ID_quad);
QM24 = struct('Name','QM24','Length',0.1,'K',Kqm24,'PassMethod','QuadLinearPass','ID',ID_quad);

QM310 = struct('Name','QM310','Length',0.1,'K',Kqm310,'PassMethod','QuadLinearPass','ID',ID_quad);
QM320 = struct('Name','QM320','Length',0.1,'K',Kqm320,'PassMethod','QuadLinearPass','ID',ID_quad);
QM330 = struct('Name','QM330','Length',0.1,'K',Kqm330,'PassMethod','QuadLinearPass','ID',ID_quad);
QM340 = struct('Name','QM340','Length',0.1,'K',Kqm340,'PassMethod','QuadLinearPass','ID',ID_quad);

QM311 = struct('Name','QM311','Length',0.1,'K',Kqm311,'PassMethod','QuadLinearPass','ID',ID_quad);
QM321 = struct('Name','QM321','Length',0.1,'K',Kqm321,'PassMethod','QuadLinearPass','ID',ID_quad);
QM331 = struct('Name','QM331','Length',0.1,'K',Kqm331,'PassMethod','QuadLinearPass','ID',ID_quad);
QM341 = struct('Name','QM341','Length',0.1,'K',Kqm341,'PassMethod','QuadLinearPass','ID',ID_quad);

QG1F = struct('Name','QG1F','Length',0.5,'K',Kqg1f,'PassMethod','QuadLinearPass','ID',ID_quad);
QG1DA = struct('Name','QG1DA','Length',0.5,'K',Kqg1da,'PassMethod','QuadLinearPass','ID',ID_quad);
QG1DB = struct('Name','QG1DB','Length',0.5,'K',Kqg1db,'PassMethod','QuadLinearPass','ID',ID_quad);

QG2FA = struct('Name','QG2FA','Length',0.5,'K',Kqg2fa,'PassMethod','QuadLinearPass','ID',ID_quad);
QG2FB = struct('Name','QG2FB','Length',0.5,'K',Kqg2fb,'PassMethod','QuadLinearPass','ID',ID_quad);
QG2D = struct('Name','QG2D','Length',0.5,'K',Kqg2d,'PassMethod','QuadLinearPass','ID',ID_quad);

QG3F = struct('Name','QG3F','Length',0.5,'K',Kqg3f,'PassMethod','QuadLinearPass','ID',ID_quad);
QG3DA = struct('Name','QG3DA','Length',0.5,'K',Kqg3da,'PassMethod','QuadLinearPass','ID',ID_quad);
QG3DB = struct('Name','QG3DB','Length',0.5,'K',Kqg3db,'PassMethod','QuadLinearPass','ID',ID_quad);

% Four FODO
QF01 = struct('Name','QF01','Length',0.1,'K',Kqf01,'PassMethod','QuadLinearPass','ID',ID_quad);
QF02 = struct('Name','QF02','Length',0.1,'K',Kqf02,'PassMethod','QuadLinearPass','ID',ID_quad);

QF11 = struct('Name','QF11','Length',0.1,'K',Kqf11,'PassMethod','QuadLinearPass','ID',ID_quad);
QF12 = struct('Name','QF12','Length',0.1,'K',Kqf12,'PassMethod','QuadLinearPass','ID',ID_quad);

QF21 = struct('Name','QF21','Length',0.1,'K',Kqf21,'PassMethod','QuadLinearPass','ID',ID_quad);
QF22 = struct('Name','QF22','Length',0.1,'K',Kqf22,'PassMethod','QuadLinearPass','ID',ID_quad);

QF31 = struct('Name','QF31','Length',0.1,'K',Kqf31,'PassMethod','QuadLinearPass','ID',ID_quad);
QF32 = struct('Name','QF32','Length',0.1,'K',Kqf32,'PassMethod','QuadLinearPass','ID',ID_quad);

% cavities
%voltage[V] in single cavity
volt0 = 44465877.1857318;   % voltage of 15m
volt1 = 31519178.4538855;   % voltage of 15m
volt2 = 68722542.0932945;   % voltage of 15m

phi0  = 57.4948672087971;    %[degree]
phi1  = 70.7775567584461;     %[degree]
phi2  = 101.646384302252;      %[degree]
%single cavity length[m]
Lcav0=7.4423;
Lcav1=3.0387;
Lcav2=6.9647;
%gradient [V/m]
A0    = volt0 *sin(phi0/180*pi) /mev/Lcav0;
A1    = volt1 *sin(phi1/180*pi) /mev/Lcav1;
A2    = volt2 *sin(phi2/180*pi) /mev/Lcav2;
%cavity number in each Linac section
N0    = 4;
N1    = 42;
N2    = 52;
%linac length
L0    = N0 * Lcav0;
L1    = N1 * Lcav1;
L2    = N2 * Lcav2;
%frequency [Hz]
f0=1.3E9; 
% ===============
CAV0 = struct('Name','CAV0',...
              'Length',Lcav0,...
              'Voltage',volt0,...
              'Phase',phi0,...
              'Frequency',f0,...
              'PassMethod','CavityLinearPass','ID',ID_cavity);
CAV1 = struct('Name','CAV1',...
              'Length',Lcav1,...
              'Voltage',volt1,...
              'Phase',phi1,...
              'Frequency',f0,...
              'PassMethod','CavityLinearPass','ID',ID_cavity);
% be careful with global variable
CAV2 = struct('Name','CAV2',...
              'Length',Lcav2,...
              'Voltage',volt2,...
              'Phase',phi2,...
              'Frequency',f0,...
              'PassMethod','CavityLinearPass','ID',ID_cavity);     

h0 = -10.416666666666667;    
chirph0 = struct('Name','chirph0','Length',0,'r56',0,'r65',h0,'PassMethod','ChirpPass');          
          
h3 = 62.068944852225;    
chirph3 = struct('Name','chirph3','Length',0,'r56',0,'r65',h3,'PassMethod','ChirpPass');
          
% Lines
% ===============
%BC0 = {BC10,DC11,QC11,DC11,BC20,DCM0,QCM0,DCM0,BC30,DC12,QC12,DC12,BC40};
%BC0 = {Drift};

BC1 = {BC1A,DC1A,BC2A,DCMA,QCA,DCMA,BC3A,DC1A,BC4A};
BC2 = {BC1B,DC1B,BC2B,DCMB,BC3B,DC1B,BC4B};

CELL0    = {QF01,DCAV,CAV0,DCAV,QF02,QF02,DCAV,CAV0,DCAV,QF01};
CELL1    = {QF11,DCAV,CAV1,DCAV,QF12,QF12,DCAV,CAV1,DCAV,QF11};
CELL2    = {QF21,DCAV,CAV2,DCAV,QF22,QF22,DCAV,CAV2,DCAV,QF21};

CELLUND  = {QF31,DUND,QF32,QF32,DUND,QF31};

MATCHSEC01= {QM01,QM01,DM01,QM02,QM02,DM02,QM03, ...
             QM03,DM03,QM04,QM04,DM04};
MATCHSEC02= {QM012,QM012,DM012,QM022,QM022,DM022,QM032, ...
             QM032,DM032,QM042,QM042,DM042};        
        
MATCHSEC1= {QM11,QM11,DM11,QM12,QM12,DM12,QM13, ...
            QM13,DM13,QM14,QM14,DM14};
MATCHSEC2= {QM21,QM21,DM21,QM22,QM22,DM22,QM23, ...
            QM23,DM23,QM24,QM24,DM24};

MATCHSEC30 = {QM310,QM310,DM310,QM320,QM320,DM320,QM330, ...
            QM330,DM330,QM340,QM340,DM340};
MATCHSEC31 = {QM311,QM311,DM311,QM321,QM321,DM321,QM331, ...
            QM331,DM331,QM341,QM341,DM341};
        
LINEDOG  = {BG1,DG1A,QG1DA,DG1B,QG1F,DG1B,QG1DB,DG1A,BG2,DG2A,...
             QG2FA,DG2B,QG2D,DG2B,QG2FB,DG2A,BG3,DG3A,QG3DA,DG3B,QG3F,...
             DG3B,QG3DB,DG3A,BG4};
%LINEDOG = {Drift};

LINE0    = [{MARKL0BEG,DC0R},MATCHSEC01,{QF01},repmat(CELL0,1,2),{QF01},MATCHSEC02,{DC1L}]';
        
% LINE0    = [{chirph0}];
LINE1    = [BC1,{MARKBC1END,DC1R},MATCHSEC1,{QF11},repmat(CELL1,1,21),{QF11,MARKL1END}]';

LINE2    = [{DC2L},BC2,{MARKBC2END,DC2R},MATCHSEC2,{QF21},repmat(CELL2,1,26),{QF21,MARKL2END}]';
LINE3    = [{DDOGL},MATCHSEC30,LINEDOG,{chirph3},{MARKDOGEND}]';
LINE3_nochirp    = [{DDOGL},MATCHSEC30,LINEDOG,{MARKDOGEND}]';

LINE4    = [{DDOGR},MATCHSEC31,{QF31},repmat(CELLUND,1,2),{QF31,MARKL4END}]';

LINE01    = [LINE0;LINE1];
LINE012   = [LINE0;LINE1;LINE2];
LINE0123  = [LINE0;LINE1;LINE2;LINE3;{Drift}];
LINE01234 = [LINE0;LINE1;LINE2;LINE3;LINE4;];

Line = LINE0123;
% Line = LINEDOG;

% Line27 = [LINE1;LINE2;LINE3_nochirp];
%% ImpactZ.in
getControlImpactZ(input1,contrl);            
getLatticeImpactZ(Line,contrl);

%% get transfer matrix
[M66,ConcaM66] = getm66(Line);
M66

%% Dispersion Plot
T = gettwiss(Line,twiss_in);

%%
% figure()
% h=plot(T.s,T.etax,'-');
% legend('\eta_x')
% xlabel('s [m]'),ylabel('dispersion [m]')
% grid on
% % setplot(h)
% 
% %%
figure()
h=semilogy(T.s,T.sigx*1e3,'-',T.s,T.sigy*1e3,'-');
xlabel('s (m)'),ylabel('beam radius (mm)')
legend('\sigma_x','\sigma_y')
% xlim([559,578])
% grid on
% setplot(h,'beamRadius.png')
% % 
% %%
figure()
h=semilogy(T.s,T.exn,T.s,T.eyn);
xlabel('s (m)'),ylabel('norm. emittance (mm\cdot mrad)')
legend('enx','eny')
% xlim([0,655.6])
% grid on
% setplot(h,'emit.png')
 
% %%
% figure()
% sigx_total = sqrt( TW.sigx_beta.^2 + TW.sig_delta.^2 .* TW.etax.^2 );
% 
% h=plot(TW.s,sigx_total)
% xlabel('s (m)'),ylabel('\sigma_x total')
% grid on
% setplot(h)
% 
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

%%
figure()
h = plot(T.s(2:end),m52);
xlabel('s (m)'),ylabel('m_{56} (m)')
grid on
% % setplot(h)


%%


% %
% figure()
% h = plot(T.s(2:end),m16)
% xlabel('s (m)'),ylabel('m_{16} (m)')
% grid on
% setplot(h)
% 
% %
% figure()
% h = plot(T.s(2:end),m26)
% xlabel('s (m)'),ylabel('m_{26} (m)')
% grid on
% setplot(h)
% 
% figure()
% h = plot(T.s(2:end),m51)
% xlabel('s (m)'),ylabel('m_{51} (m)')
% grid on
% setplot(h)
% 
% figure()
% h = plot(T.s(2:end),m52)
% xlabel('s (m)'),ylabel('m_{52} (m)')
% grid on
% setplot(h)

%% checking Eq. (6)

C1 = 6; 
C2 = 12;
R561= 0.08;
R562= 0.05;

E3 = 250;
E5 = 1500;
E7 = 5000;
 
zeta = (C1-1)*C2*(R562*E3)/(R561*E5);

R55 = (1+zeta)/C2
R66 = C2*E3/(1+zeta)/E7



          






