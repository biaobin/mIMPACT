clear all
clear global
setpath()

%% lattice section, all is the same as AT_biaobin
%================================================
global E_central;    %for AT_biaobin getm66 function

E_central = 100E6;

exn         = 0.3e-6;
ex          = exn/(E_central(1)/const.mev_impact/1E6);
ey          = exn/(E_central(1)/const.mev_impact/1E6);

betaIni     = [6.5231,6.5231]; 
alphaIni    = [0,0];
disp0 = [0;0;0;0];
% sigx0 = sqrt( exn/(E_central(1)/0.511e6) * betaIni(1) );

sig_delta0  = 1e-5 ;
sig_z0      = 0.1e-3;
% sig_z0      = 100e-3;

twiss_in = struct('ElemIndex',1,   ...
                  'SPos',0,        ...
                  'Energy',E_central(1),...               % Initial beam Energy [eV]
                  'Emittance',[ex,ey],  ...
                  'beta',betaIni,'alpha',alphaIni,  ...
                  'sig_z',sig_z0,'delta',sig_delta0,...   % 1e-8, error will give dispersion
                  'Dispersion',disp0);

% lattice arrangement
% ===================
MARKQM01 = struct('Name','1000','Length',0,'PassMethod','MarkPass');
MARKQM02 = struct('Name','1001','Length',0,'PassMethod','MarkPass');
MARKQM03 = struct('Name','1002','Length',0,'PassMethod','MarkPass');
MARKQM04 = struct('Name','1003','Length',0,'PassMethod','MarkPass');

MARKQM11 = struct('Name','1004','Length',0,'PassMethod','MarkPass');
MARKQM12 = struct('Name','1005','Length',0,'PassMethod','MarkPass');
MARKQM13 = struct('Name','1006','Length',0,'PassMethod','MarkPass');
MARKQM14 = struct('Name','1007','Length',0,'PassMethod','MarkPass');

MARKQM21 = struct('Name','1008','Length',0,'PassMethod','MarkPass');
MARKQM22 = struct('Name','1009','Length',0,'PassMethod','MarkPass');
MARKQM23 = struct('Name','1010','Length',0,'PassMethod','MarkPass');
MARKQM24 = struct('Name','1011','Length',0,'PassMethod','MarkPass');

MARKQM31 = struct('Name','1012','Length',0,'PassMethod','MarkPass');
MARKQM32 = struct('Name','1013','Length',0,'PassMethod','MarkPass');
MARKQM33 = struct('Name','1014','Length',0,'PassMethod','MarkPass');
MARKQM34 = struct('Name','1015','Length',0,'PassMethod','MarkPass');

MARKQF01 = struct('Name','1016','Length',0,'PassMethod','MarkPass');
MARKQF11 = struct('Name','1017','Length',0,'PassMethod','MarkPass');
MARKQF21 = struct('Name','1018','Length',0,'PassMethod','MarkPass');
MARKQF31 = struct('Name','1019','Length',0,'PassMethod','MarkPass');

MARKL0BEG = struct('Name','1020','Length',0,'PassMethod','MarkPass');
MARKL0END = struct('Name','1021','Length',0,'PassMethod','MarkPass');
MARKL1BEG = struct('Name','1022','Length',0,'PassMethod','MarkPass');
MARKL1END = struct('Name','1023','Length',0,'PassMethod','MarkPass');
MARKL2BEG = struct('Name','1024','Length',0,'PassMethod','MarkPass');
MARKL2END = struct('Name','1025','Length',0,'PassMethod','MarkPass');
MARKL3BEG = struct('Name','1026','Length',0,'PassMethod','MarkPass');
MARKL3END = struct('Name','1027','Length',0,'PassMethod','MarkPass');
MARKL4BEG = struct('Name','1028','Length',0,'PassMethod','MarkPass');
MARKL4END = struct('Name','1029','Length',0,'PassMethod','MarkPass');

MARKBC0BEG = struct('Name','1030','Length',0,'PassMethod','MarkPass');
MARKBC0END = struct('Name','1031','Length',0,'PassMethod','MarkPass');
MARKBC1BEG = struct('Name','1032','Length',0,'PassMethod','MarkPass');
MARKBC1END = struct('Name','1033','Length',0,'PassMethod','MarkPass');
MARKBC2BEG = struct('Name','1034','Length',0,'PassMethod','MarkPass');
MARKBC2END = struct('Name','1035','Length',0,'PassMethod','MarkPass');

MARKDOGBEG = struct('Name','1036','Length',0,'PassMethod','MarkPass');
MARKDOGEND = struct('Name','1037','Length',0,'PassMethod','MarkPass');

MARKQG1F = struct('Name','1038','Length',0,'PassMethod','MarkPass');
MARKQG2D = struct('Name','1039','Length',0,'PassMethod','MarkPass');
MARKQG3F = struct('Name','1040','Length',0,'PassMethod','MarkPass');


% dipoles
% ============
Lb        = 0.2;
LbDOG     = 0.5;
theta0    = 0.03992591;
theta1    = 0.12264115;
theta2    = 0.09713503;
theta_DOG = 0.0872665;

BC10 = struct('Name','BC10','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta0,'EntranceAngle',0,'ExitAngle',theta0);
BC20 = struct('Name','BC20','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta0,'EntranceAngle',-theta0,'ExitAngle',0);
BC30 = struct('Name','BC30','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta0,'EntranceAngle',0,'ExitAngle',-theta0);
BC40 = struct('Name','BC40','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta0,'EntranceAngle',theta0,'ExitAngle',0);

BC1A = struct('Name','BC1A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta1,'EntranceAngle',0,'ExitAngle',theta1);
BC2A = struct('Name','BC2A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta1,'EntranceAngle',-theta1,'ExitAngle',0);
BC3A = struct('Name','BC3A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta1,'EntranceAngle',0,'ExitAngle',-theta1);
BC4A = struct('Name','BC4A','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta1,'EntranceAngle',theta1,'ExitAngle',0);

BC1B = struct('Name','BC1B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta2,'EntranceAngle',0,'ExitAngle',theta2);
BC2B = struct('Name','BC2B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta2,'EntranceAngle',-theta2,'ExitAngle',0);
BC3B = struct('Name','BC3B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta2,'EntranceAngle',0,'ExitAngle',-theta2);
BC4B = struct('Name','BC4B','Length',Lb,'PassMethod','BendLinearPass',...
              'BendingAngle',theta2,'EntranceAngle',theta2,'ExitAngle',0);

BG1 = struct('Name','BDOG1','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',theta_DOG,'EntranceAngle',0.5*theta_DOG,'ExitAngle',0.5*theta_DOG);
BG2 = struct('Name','BDOG2','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',theta_DOG,'EntranceAngle',0.5*theta_DOG,'ExitAngle',0.5*theta_DOG);
BG3 = struct('Name','BDOG2','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta_DOG,'EntranceAngle',-0.5*theta_DOG,'ExitAngle',-0.5*theta_DOG);
BG4 = struct('Name','BDOG2','Length',LbDOG,'PassMethod','BendLinearPass',...
              'BendingAngle',-theta_DOG,'EntranceAngle',-0.5*theta_DOG,'ExitAngle',-0.5*theta_DOG);          
          
% drift lines
% =============
Ldc0r=0.1;
Ldcm0=0.9;
Ldc11=1.4;
Ldc12=1.4;
Ldc1l=0.2;
Ldc1r=0.4930254366560094;
Ldc1a=2.5;
Ldcma=1.5;
Ldc2l=0.2;
Ldc2r=0.01459019569904335;
Ldc1b=2.5;
Ldcmb=1.5;
Ldm01=2.293411349700718;
Ldm02=0.742334894945705;
Ldm03=5.96269346547485;
Ldm04=0.008187632181553401;
Ldm11=4.996722399262668;
Ldm12=0.8778641889184196;
Ldm13=0.000162976537535738;
Ldm14=2.046461780762537;
Ldm21=1.896099363091899;
Ldm22=2.579981975381699;
Ldm23=1.957420046023825;
Ldm24=4.99984418264525;
Ldm31=2.365168329462376;
Ldm32=1.261939303710446;
Ldm33=7.99392597775283;
Ldm34=4.654976555373476;
Lddogl=0.2;
Lddogr=0.04702974635081869;
Ldg1a=2.8;
Ldg1b=0.9999852827061235;
Ldg2a=2.8;
Ldg2b=0.9999852827061235;
Ldg3a=2.8;
Ldg3b=0.9999852827061235;
Ldund=10;
Ldfodo=15;
Ldcav=0.1;

DC0R = struct('Name','DC0R','Length',Ldc0r,'PassMethod','DriftPass');
DC11 = struct('Name','DC11','Length',Ldc11,'PassMethod','DriftPass');
DC12 = struct('Name','DC12','Length',Ldc12,'PassMethod','DriftPass');
DCM0 = struct('Name','DCM0','Length',Ldcm0,'PassMethod','DriftPass');

DC1L = struct('Name','DC1L','Length',Ldc1l,'PassMethod','DriftPass');
DC1R = struct('Name','DC1R','Length',Ldc1r,'PassMethod','DriftPass');
DC1A = struct('Name','DC1A','Length',Ldc1a,'PassMethod','DriftPass');
DCMA = struct('Name','DCMA','Length',Ldcma,'PassMethod','DriftPass');

DC2L = struct('Name','DC2L','Length',Ldc2l,'PassMethod','DriftPass');
DC2R = struct('Name','DC2R','Length',Ldc2r,'PassMethod','DriftPass');
DC1B = struct('Name','DC1B','Length',Ldc1b,'PassMethod','DriftPass');
DCMB = struct('Name','DCMB','Length',Ldcmb,'PassMethod','DriftPass');

DM01 = struct('Name','DM01','Length',Ldm01,'PassMethod','DriftPass');
DM02 = struct('Name','DM02','Length',Ldm02,'PassMethod','DriftPass');
DM03 = struct('Name','DM03','Length',Ldm03,'PassMethod','DriftPass');
DM04 = struct('Name','DM04','Length',Ldm04,'PassMethod','DriftPass');

DM11 = struct('Name','DM11','Length',Ldm11,'PassMethod','DriftPass');
DM12 = struct('Name','DM12','Length',Ldm12,'PassMethod','DriftPass');
DM13 = struct('Name','DM13','Length',Ldm13,'PassMethod','DriftPass');
DM14 = struct('Name','DM14','Length',Ldm14,'PassMethod','DriftPass');

DM21 = struct('Name','DM21','Length',Ldm21,'PassMethod','DriftPass');
DM22 = struct('Name','DM22','Length',Ldm22,'PassMethod','DriftPass');
DM23 = struct('Name','DM23','Length',Ldm23,'PassMethod','DriftPass');
DM24 = struct('Name','DM24','Length',Ldm24,'PassMethod','DriftPass');

DM31 = struct('Name','DM21','Length',Ldm31,'PassMethod','DriftPass');
DM32 = struct('Name','DM22','Length',Ldm32,'PassMethod','DriftPass');
DM33 = struct('Name','DM23','Length',Ldm33,'PassMethod','DriftPass');
DM34 = struct('Name','DM24','Length',Ldm34,'PassMethod','DriftPass');

DDOGL = struct('Name','DDOGL','Length',Lddogl,'PassMethod','DriftPass');
DDOGR = struct('Name','DDOGR','Length',Lddogr,'PassMethod','DriftPass');

DG1A = struct('Name','DG1A','Length',Ldg1a,'PassMethod','DriftPass');
DG1B = struct('Name','DG1B','Length',Ldg1b,'PassMethod','DriftPass');

DG2A = struct('Name','DG2A','Length',Ldg2a,'PassMethod','DriftPass');
DG2B = struct('Name','DG2B','Length',Ldg2b,'PassMethod','DriftPass');

DG3A = struct('Name','DG3A','Length',Ldg3a,'PassMethod','DriftPass');
DG3B = struct('Name','DG3B','Length',Ldg3b,'PassMethod','DriftPass');

DUND  = struct('Name','DUND','Length',Ldund,'PassMethod','DriftPass');
DCAV  = struct('Name','DCAV','Length',Ldcav,'PassMethod','DriftPass');

Drift  = struct('Name','Drift','Length',10,'PassMethod','DriftPass');

% Quadrupoles
% ===========
Kqc11=-7.4551;
Kqc12=7.5933;
Kqcm0=-4.6022;

Kqm01=6.19782597407295;
Kqm02=-3.323783369724773;
Kqm03=1.561074301418078;
Kqm04=7.819700400888695;
Kqm11=2.992487825036551;
Kqm12=-2.138775470225004;
Kqm13=1.270020965698968;
Kqm14=0.6277766610290545;
Kqm21=2.712759731188384;
Kqm22=-3.132439028948256;
Kqm23=2.784848016978993;
Kqm24=-2.10020452853799;
Kqm31=0.8958552498063095;
Kqm32=-0.01579091769213448;
Kqm33=0.6312720972549728;
Kqm34=-0.554859001411375;
Kqg1f=-2.966463444525576;
Kqg1da=0.7324514799589754;
Kqg1db=0.1935493506797756;
Kqg2fa=-0.7379367476960765;
Kqg2fb=0.4355270034990754;
Kqg2d=0.2107829219647057;
Kqg3f=-2.999545929445198;
Kqg3da=0.7661776312771806;
Kqg3db=-2.259548223320492;
Kqf01=2.04;
Kqf02=-2.04;
Kqf11=0.36;
Kqf12=-0.36;
Kqf21=0.4;
Kqf22=-0.4;
Kqf31=0.25;
Kqf32=-0.25;

QC11 = struct('Name','QC11','Length',0.2,'K',Kqc11,'PassMethod','QuadLinearPass');
QC12 = struct('Name','QC12','Length',0.2,'K',Kqc12,'PassMethod','QuadLinearPass');
QCM0 = struct('Name','QCM','Length',0.2,'K',Kqcm0,'PassMethod','QuadLinearPass');

QM01 = struct('Name','QM01','Length',0.1,'K',Kqm01,'PassMethod','QuadLinearPass');
QM02 = struct('Name','QM02','Length',0.1,'K',Kqm02,'PassMethod','QuadLinearPass');
QM03 = struct('Name','QM03','Length',0.1,'K',Kqm03,'PassMethod','QuadLinearPass');
QM04 = struct('Name','QM04','Length',0.1,'K',Kqm04,'PassMethod','QuadLinearPass');

QM11 = struct('Name','QM11','Length',0.1,'K',Kqm11,'PassMethod','QuadLinearPass');
QM12 = struct('Name','QM12','Length',0.1,'K',Kqm12,'PassMethod','QuadLinearPass');
QM13 = struct('Name','QM13','Length',0.1,'K',Kqm13,'PassMethod','QuadLinearPass');
QM14 = struct('Name','QM14','Length',0.1,'K',Kqm14,'PassMethod','QuadLinearPass');

QM21 = struct('Name','QM21','Length',0.1,'K',Kqm21,'PassMethod','QuadLinearPass');
QM22 = struct('Name','QM22','Length',0.1,'K',Kqm22,'PassMethod','QuadLinearPass');
QM23 = struct('Name','QM23','Length',0.1,'K',Kqm23,'PassMethod','QuadLinearPass');
QM24 = struct('Name','QM24','Length',0.1,'K',Kqm24,'PassMethod','QuadLinearPass');

QM31 = struct('Name','QM31','Length',0.1,'K',Kqm31,'PassMethod','QuadLinearPass');
QM32 = struct('Name','QM32','Length',0.1,'K',Kqm32,'PassMethod','QuadLinearPass');
QM33 = struct('Name','QM33','Length',0.1,'K',Kqm33,'PassMethod','QuadLinearPass');
QM34 = struct('Name','QM34','Length',0.1,'K',Kqm34,'PassMethod','QuadLinearPass');

QG1F = struct('Name','QG1F','Length',0.5,'K',Kqg1f,'PassMethod','QuadLinearPass');
QG1DA = struct('Name','QG1DA','Length',0.5,'K',Kqg1da,'PassMethod','QuadLinearPass');
QG1DB = struct('Name','QG1DB','Length',0.5,'K',Kqg1db,'PassMethod','QuadLinearPass');

QG2FA = struct('Name','QG2FA','Length',0.5,'K',Kqg2fa,'PassMethod','QuadLinearPass');
QG2FB = struct('Name','QG2FB','Length',0.5,'K',Kqg2fb,'PassMethod','QuadLinearPass');
QG2D = struct('Name','QG2D','Length',0.5,'K',Kqg2d,'PassMethod','QuadLinearPass');

QG3F = struct('Name','QG3F','Length',0.5,'K',Kqg3f,'PassMethod','QuadLinearPass');
QG3DA = struct('Name','QG3DA','Length',0.5,'K',Kqg3da,'PassMethod','QuadLinearPass');
QG3DB = struct('Name','QG3DB','Length',0.5,'K',Kqg3db,'PassMethod','QuadLinearPass');

% Four FODO
QF01 = struct('Name','QF01','Length',0.05,'K',Kqf01,'PassMethod','QuadLinearPass');
QF02 = struct('Name','QF02','Length',0.05,'K',Kqf02,'PassMethod','QuadLinearPass');

QF11 = struct('Name','QF11','Length',0.05,'K',Kqf11,'PassMethod','QuadLinearPass');
QF12 = struct('Name','QF12','Length',0.05,'K',Kqf12,'PassMethod','QuadLinearPass');

QF21 = struct('Name','QF21','Length',0.05,'K',Kqf21,'PassMethod','QuadLinearPass');
QF22 = struct('Name','QF22','Length',0.05,'K',Kqf22,'PassMethod','QuadLinearPass');

QF31 = struct('Name','QF31','Length',0.05,'K',Kqf31,'PassMethod','QuadLinearPass');
QF32 = struct('Name','QF32','Length',0.05,'K',Kqf32,'PassMethod','QuadLinearPass');

% cavities
%2017-05, initial delta=dgamma/gamma
% %voltage[V] in single cavity
% volt0 = 5.177244613705584e+09;   % voltage of 15m
% volt1 = 40471329750.22275;   % voltage of 15m
% volt2 = 314908788289.6737;   % voltage of 15m
% 
% phi0  = 0.06916781717977299;    %[degree]
% phi1  = 0.1264030310028895;     %[degree]
% phi2  = 179.9872639165749;      %[degree]

%biaobin,2018-11-19, delta=dp/p
%voltage[V] in single cavity
volt0 = 5.1772229834558E9;     % voltage of one cell
volt1 = 4.04714332045509E10;   % voltage of one cell
volt2 = 3.14908768371828E11;   % voltage of one cell

phi0  = 0.069168106160544;            %[degree]
phi1  = 0.126402707887032;            %[degree]
phi2  = -0.0127360842306213+180;      %[degree]

%single cavity length[m]
Lcav0=4.8;
Lcav1=14.8;
Lcav2=14.8;
%gradient [V/m]
A0    = volt0 *sin(phi0/180*pi) /0.511001e6/Lcav0;
A1    = volt1 *sin(phi1/180*pi) /0.511001e6/Lcav1;
A2    = volt2 *sin(phi2/180*pi) /0.511001e6/Lcav2;
% A0    = volt0 *sin(phi0/180*pi) /Lcav0;
% A1    = volt1 *sin(phi1/180*pi) /Lcav1;
% A2    = volt2 *sin(phi2/180*pi) /Lcav2;

%cavity number in each Linac section
N0    = 24;
N1    = 14;
N2    = 50;
%linac length
L0    = N0 * Lcav0;
L1    = N1 * Lcav1;
L2    = N2 * Lcav2;
%frequency [Hz]
f0=1E6; 
% ===============
CAV0 = struct('Name','CAV0',...
              'Length',Lcav0,...
              'Voltage',volt0,...
              'Phase',phi0,...
              'Frequency',f0,...
              'PassMethod','CavityLinearPass');
CAV1 = struct('Name','CAV1',...
              'Length',Lcav1,...
              'Voltage',volt1,...
              'Phase',phi1,...
              'Frequency',f0,...
              'PassMethod','CavityLinearPass');
% be careful with global variable
CAV2 = struct('Name','CAV2',...
              'Length',Lcav2,...
              'Voltage',volt2,...
              'Phase',phi2,...
              'Frequency',f0,...
              'PassMethod','CavityLinearPass');     
% Lines
% ===============
BC0 = {BC10,DC11,QC11,DC11,BC20,DCM0,QCM0,DCM0,BC30,DC12,QC12,DC12,BC40};
%BC0 = {Drift};

BC1 = {BC1A,DC1A,BC2A,DCMA,BC3A,DC1A,BC4A};
BC2 = {BC1B,DC1B,BC2B,DCMB,BC3B,DC1B,BC4B};

CELL0    = {QF01,DCAV,CAV0,DCAV,QF02,QF02,DCAV,CAV0,DCAV,QF01};
CELL1    = {QF11,DCAV,CAV1,DCAV,QF12,QF12,DCAV,CAV1,DCAV,QF11};
CELL2    = {QF21,DCAV,CAV2,DCAV,QF22,QF22,DCAV,CAV2,DCAV,QF21};

CELLUND  = {QF31,DUND,QF32,QF32,DUND,QF31};

MATCHSEC0= {QM01,MARKQM01,QM01,DM01,QM02,MARKQM02,QM02,DM02,QM03, ...
            MARKQM03,QM03,DM03,QM04,MARKQM04,QM04,DM04};
MATCHSEC1= {QM11,MARKQM11,QM11,DM11,QM12,MARKQM12,QM12,DM12,QM13, ...
            MARKQM13,QM13,DM13,QM14,MARKQM14,QM14,DM14};
MATCHSEC2= {QM21,MARKQM21,QM21,DM21,QM22,MARKQM22,QM22,DM22,QM23, ...
            MARKQM23,QM23,DM23,QM24,MARKQM24,QM24,DM24};
MATCHSEC3= {QM31,MARKQM31,QM31,DM31,QM32,MARKQM32,QM32,DM32,QM33, ...
            MARKQM33,QM33,DM33,QM34,MARKQM34,QM34,DM34};
        
LINEDOG  = {BG1,DG1A,QG1DA,DG1B,QG1F,MARKQG1F,DG1B,QG1DB,DG1A,BG2,DG2A,...
             QG2FA,DG2B,QG2D,MARKQG2D,DG2B,QG2FB,DG2A,BG3,DG3A,QG3DA,DG3B,QG3F,MARKQG3F,...
             DG3B,QG3DB,DG3A,BG4};
%LINEDOG = {Drift};

LINE0    = [{MARKL0BEG,MARKBC0BEG},BC0,{MARKBC0END,DC0R},MATCHSEC0,{QF01, MARKQF01},repmat(CELL0,1,12),{QF01,MARKL0END}]';
        
LINE1    = [{MARKL1BEG,DC1L,MARKBC1BEG},BC1,{MARKBC1END,DC1R},MATCHSEC1,{QF11, MARKQF11},repmat(CELL1,1,7),{QF11,MARKL1END}]';
LINE2    = [{MARKL2BEG,DC2L,MARKBC2BEG},BC2,{MARKBC2END,DC2R},MATCHSEC2,{QF21, MARKQF21},repmat(CELL2,1,25),{QF21,MARKL2END}]';
LINE3    = [{MARKL3BEG,DDOGL,MARKDOGBEG},LINEDOG,{MARKDOGEND,MARKL3END}]';
LINE4    = [{MARKL4BEG,DDOGR},MATCHSEC3,{QF31,MARKQF31},repmat(CELLUND,1,4),{QF31,MARKL4END}]';

LINE01    = [LINE0;LINE1];
LINE012   = [LINE0;LINE1;LINE2];
LINE0123  = [LINE0;LINE1;LINE2;LINE3];
LINE01234 = [LINE0;LINE1;LINE2;LINE3;LINE4];

Line = LINE0123;

%% get transfer matrix
[M66,ConcaM66] = getm66(Line);
M66

%% get twiss para based on SIG_beam matrix
TD = gettwiss(Line,twiss_in);
s    = cat(1,TD.SPos);  % Longitudinal direction combine the matrix
emit = cat(1,TD.Emittance);
beta = cat(1,TD.beta);
SIG  = cat(3,TD.SIG);

eta  = reshape(cat(1,TD.Dispersion),[4,length(Line)+1]);
sigx = reshape(sqrt(SIG(1,1,:)),[length(Line)+1,1]);
sigy = reshape(sqrt(SIG(3,3,:)),[length(Line)+1,1]);
sigz = reshape(sqrt(SIG(5,5,:)),[length(Line)+1,1]); 

% %% Paticles tracking
% BeamDis = trackingpass(Line,twiss_in,10); %500 is particles number

%% Beam twiss
BeamTD = beamtwiss(Line,twiss_in,5000);

% twiss with particle tracking
Beam_s    = cat(1,BeamTD.SPos);  % Longitudinal direction combine the matrix
Beam_emit = cat(1,BeamTD.Emittance);
Beam_beta = cat(1,BeamTD.beta);
Beam_SIG  = cat(3,BeamTD.SIG);

Beam_eta  = reshape(cat(1,BeamTD.Dispersion),[4,length(Line)+1]);
Beam_sigx = reshape(sqrt(Beam_SIG(1,1,:)),[length(Line)+1,1]);
Beam_sigy = reshape(sqrt(Beam_SIG(3,3,:)),[length(Line)+1,1]);
Beam_sigz = reshape(sqrt(Beam_SIG(5,5,:)),[length(Line)+1,1]);

% %% beam size plot
% 
% figure(1)
% h=semilogy(s,sigx,'DisplayName','Matlab, \Sigma-Beam Matrix')
% setplot(h,'100mm_sigx_comp.png')
% hold on
% h=semilogy(Beam_s,Beam_sigx,'DisplayName','Matlab, particles tracking')
% % setplot(h,'100mm_sigx_comp.png')
% 
% % % plot with ImpactZ tracking results
% % % ----------------------------------
% % % ft24 = importdata('../trackMap_genImpactZ/0.1mm_fort.24'); 
% % ft24 = importdata('../trackMap_genImpactZ/5mm_fort.24'); 
% % 
% % s_ipz = ft24(:,1);
% % sigx_ipz = ft24(:,3);
% % 
% % hold on
% % h=semilogy(s_ipz,sigx_ipz,'DisplayName','ImpactZ, SC OFF')
% 
% % title('\sigma_z=0.1mm')
% title('\sigma_z=100mm')
% 
% xlabel('s (m)'),ylabel('\sigma_x (m)')
% setplot(h,'100mm_sigx_comp.png')
% hold off

%% beam emittance plot
close all
figure(2)
h = semilogy(s,emit(:,1)*1E6,'DisplayName','Matlab, \Sigma-Beam Matrix');
setplot(h)

hold on
h=semilogy(Beam_s,Beam_emit(:,1)*1E6,'DisplayName','Matlab, particles tracking');

% % plot with ImpactZ tracking results
% % ----------------------------------
% ft24 = importdata('../trackMap_genImpactZ/0.1mm_fort.24'); 
% 
% s_ipz = ft24(:,1);
% sigx_ipz = ft24(:,3);
% enx = ft24(:,7)
% 
% hold on
% h=plot(s_ipz,enx,'DisplayName','ImpactZ, SC OFF')

str_title = sprintf('\\sigma_z=%2.1f mm',sig_z0*1E3);
title(str_title)
xlabel('s (m)'),ylabel('ex (mm\cdotmrad)')
setplot(h,'0.1mm_emitx.png')
hold off

%% tracking with one particle for debuging Dipole in ImpactZ
% phi0 = 1;
% deltagamma = -100;
% 
% beta0  = e2beta(E_central(1)/1E6);
% delta0 = deltagamma2delta(deltagamma,E_central(1)/1E6);
% 
% z0 = -phi0*beta0;
% 
% X0 = [0 0 0 0 z0 delta0];
% BeamDis = particlepass(Line,X0)


