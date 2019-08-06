% this is a macro that converts to AT the madX lattice: lattice.lte
%
% Created: 20-Jul-2019 15:49:30
%
%

global GLOBVAL;
GLOBVAL.E0=100;




%% DEFINITIONS 

MARKQM01.('FamName')='MARKQM01';
MARKQM01.('Class')='Monitor'; 
MARKQM01.('Length')=0; 
MARKQM01.('PassMethod')='IdentityPass'; 
MARKQM02.('FamName')='MARKQM02';
MARKQM02.('Class')='Monitor'; 
MARKQM02.('Length')=0; 
MARKQM02.('PassMethod')='IdentityPass'; 
MARKQM03.('FamName')='MARKQM03';
MARKQM03.('Class')='Monitor'; 
MARKQM03.('Length')=0; 
MARKQM03.('PassMethod')='IdentityPass'; 
MARKQM04.('FamName')='MARKQM04';
MARKQM04.('Class')='Monitor'; 
MARKQM04.('Length')=0; 
MARKQM04.('PassMethod')='IdentityPass'; 
MARKQM012.('FamName')='MARKQM012';
MARKQM012.('Class')='Monitor'; 
MARKQM012.('Length')=0; 
MARKQM012.('PassMethod')='IdentityPass'; 
MARKQM022.('FamName')='MARKQM022';
MARKQM022.('Class')='Monitor'; 
MARKQM022.('Length')=0; 
MARKQM022.('PassMethod')='IdentityPass'; 
MARKQM032.('FamName')='MARKQM032';
MARKQM032.('Class')='Monitor'; 
MARKQM032.('Length')=0; 
MARKQM032.('PassMethod')='IdentityPass'; 
MARKQM042.('FamName')='MARKQM042';
MARKQM042.('Class')='Monitor'; 
MARKQM042.('Length')=0; 
MARKQM042.('PassMethod')='IdentityPass'; 
MARKQM11.('FamName')='MARKQM11';
MARKQM11.('Class')='Monitor'; 
MARKQM11.('Length')=0; 
MARKQM11.('PassMethod')='IdentityPass'; 
MARKQM12.('FamName')='MARKQM12';
MARKQM12.('Class')='Monitor'; 
MARKQM12.('Length')=0; 
MARKQM12.('PassMethod')='IdentityPass'; 
MARKQM13.('FamName')='MARKQM13';
MARKQM13.('Class')='Monitor'; 
MARKQM13.('Length')=0; 
MARKQM13.('PassMethod')='IdentityPass'; 
MARKQM14.('FamName')='MARKQM14';
MARKQM14.('Class')='Monitor'; 
MARKQM14.('Length')=0; 
MARKQM14.('PassMethod')='IdentityPass'; 
MARKQM21.('FamName')='MARKQM21';
MARKQM21.('Class')='Monitor'; 
MARKQM21.('Length')=0; 
MARKQM21.('PassMethod')='IdentityPass'; 
MARKQM22.('FamName')='MARKQM22';
MARKQM22.('Class')='Monitor'; 
MARKQM22.('Length')=0; 
MARKQM22.('PassMethod')='IdentityPass'; 
MARKQM23.('FamName')='MARKQM23';
MARKQM23.('Class')='Monitor'; 
MARKQM23.('Length')=0; 
MARKQM23.('PassMethod')='IdentityPass'; 
MARKQM24.('FamName')='MARKQM24';
MARKQM24.('Class')='Monitor'; 
MARKQM24.('Length')=0; 
MARKQM24.('PassMethod')='IdentityPass'; 
MARKQM310.('FamName')='MARKQM310';
MARKQM310.('Class')='Monitor'; 
MARKQM310.('Length')=0; 
MARKQM310.('PassMethod')='IdentityPass'; 
MARKQM320.('FamName')='MARKQM320';
MARKQM320.('Class')='Monitor'; 
MARKQM320.('Length')=0; 
MARKQM320.('PassMethod')='IdentityPass'; 
MARKQM330.('FamName')='MARKQM330';
MARKQM330.('Class')='Monitor'; 
MARKQM330.('Length')=0; 
MARKQM330.('PassMethod')='IdentityPass'; 
MARKQM340.('FamName')='MARKQM340';
MARKQM340.('Class')='Monitor'; 
MARKQM340.('Length')=0; 
MARKQM340.('PassMethod')='IdentityPass'; 
MARKQM311.('FamName')='MARKQM311';
MARKQM311.('Class')='Monitor'; 
MARKQM311.('Length')=0; 
MARKQM311.('PassMethod')='IdentityPass'; 
MARKQM321.('FamName')='MARKQM321';
MARKQM321.('Class')='Monitor'; 
MARKQM321.('Length')=0; 
MARKQM321.('PassMethod')='IdentityPass'; 
MARKQM331.('FamName')='MARKQM331';
MARKQM331.('Class')='Monitor'; 
MARKQM331.('Length')=0; 
MARKQM331.('PassMethod')='IdentityPass'; 
MARKQM341.('FamName')='MARKQM341';
MARKQM341.('Class')='Monitor'; 
MARKQM341.('Length')=0; 
MARKQM341.('PassMethod')='IdentityPass'; 
MARKQF01.('FamName')='MARKQF01';
MARKQF01.('Class')='Monitor'; 
MARKQF01.('Length')=0; 
MARKQF01.('PassMethod')='IdentityPass'; 
MARKQF02.('FamName')='MARKQF02';
MARKQF02.('Class')='Monitor'; 
MARKQF02.('Length')=0; 
MARKQF02.('PassMethod')='IdentityPass'; 
MARKQF11.('FamName')='MARKQF11';
MARKQF11.('Class')='Monitor'; 
MARKQF11.('Length')=0; 
MARKQF11.('PassMethod')='IdentityPass'; 
MARKQF12.('FamName')='MARKQF12';
MARKQF12.('Class')='Monitor'; 
MARKQF12.('Length')=0; 
MARKQF12.('PassMethod')='IdentityPass'; 
MARKQF21.('FamName')='MARKQF21';
MARKQF21.('Class')='Monitor'; 
MARKQF21.('Length')=0; 
MARKQF21.('PassMethod')='IdentityPass'; 
MARKQF22.('FamName')='MARKQF22';
MARKQF22.('Class')='Monitor'; 
MARKQF22.('Length')=0; 
MARKQF22.('PassMethod')='IdentityPass'; 
MARKQF31.('FamName')='MARKQF31';
MARKQF31.('Class')='Monitor'; 
MARKQF31.('Length')=0; 
MARKQF31.('PassMethod')='IdentityPass'; 
MARKQF32.('FamName')='MARKQF32';
MARKQF32.('Class')='Monitor'; 
MARKQF32.('Length')=0; 
MARKQF32.('PassMethod')='IdentityPass'; 
MARKBC0BEG.('FamName')='MARKBC0BEG';
MARKBC0BEG.('Class')='Monitor'; 
MARKBC0BEG.('Length')=0; 
MARKBC0BEG.('PassMethod')='IdentityPass'; 
MARKBC0END.('FamName')='MARKBC0END';
MARKBC0END.('Class')='Monitor'; 
MARKBC0END.('Length')=0; 
MARKBC0END.('PassMethod')='IdentityPass'; 
MARKBC1BEG.('FamName')='MARKBC1BEG';
MARKBC1BEG.('Class')='Monitor'; 
MARKBC1BEG.('Length')=0; 
MARKBC1BEG.('PassMethod')='IdentityPass'; 
MARKBC1END.('FamName')='MARKBC1END';
MARKBC1END.('Class')='Monitor'; 
MARKBC1END.('Length')=0; 
MARKBC1END.('PassMethod')='IdentityPass'; 
MARKL0BEG.('FamName')='MARKL0BEG';
MARKL0BEG.('Class')='Monitor'; 
MARKL0BEG.('Length')=0; 
MARKL0BEG.('PassMethod')='IdentityPass'; 
MARKL0END.('FamName')='MARKL0END';
MARKL0END.('Class')='Monitor'; 
MARKL0END.('Length')=0; 
MARKL0END.('PassMethod')='IdentityPass'; 
MARKL1BEG.('FamName')='MARKL1BEG';
MARKL1BEG.('Class')='Monitor'; 
MARKL1BEG.('Length')=0; 
MARKL1BEG.('PassMethod')='IdentityPass'; 
MARKL1END.('FamName')='MARKL1END';
MARKL1END.('Class')='Monitor'; 
MARKL1END.('Length')=0; 
MARKL1END.('PassMethod')='IdentityPass'; 
MARKL2BEG.('FamName')='MARKL2BEG';
MARKL2BEG.('Class')='Monitor'; 
MARKL2BEG.('Length')=0; 
MARKL2BEG.('PassMethod')='IdentityPass'; 
MARKL2END.('FamName')='MARKL2END';
MARKL2END.('Class')='Monitor'; 
MARKL2END.('Length')=0; 
MARKL2END.('PassMethod')='IdentityPass'; 
MARKL3BEG.('FamName')='MARKL3BEG';
MARKL3BEG.('Class')='Monitor'; 
MARKL3BEG.('Length')=0; 
MARKL3BEG.('PassMethod')='IdentityPass'; 
MARKL3END.('FamName')='MARKL3END';
MARKL3END.('Class')='Monitor'; 
MARKL3END.('Length')=0; 
MARKL3END.('PassMethod')='IdentityPass'; 
MARKL4BEG.('FamName')='MARKL4BEG';
MARKL4BEG.('Class')='Monitor'; 
MARKL4BEG.('Length')=0; 
MARKL4BEG.('PassMethod')='IdentityPass'; 
MARKL4END.('FamName')='MARKL4END';
MARKL4END.('Class')='Monitor'; 
MARKL4END.('Length')=0; 
MARKL4END.('PassMethod')='IdentityPass'; 
MARKDGBEG.('FamName')='MARKDGBEG';
MARKDGBEG.('Class')='Monitor'; 
MARKDGBEG.('Length')=0; 
MARKDGBEG.('PassMethod')='IdentityPass'; 
MARKDGEND.('FamName')='MARKDGEND';
MARKDGEND.('Class')='Monitor'; 
MARKDGEND.('Length')=0; 
MARKDGEND.('PassMethod')='IdentityPass'; 
MARKQG1F.('FamName')='MARKQG1F';
MARKQG1F.('Class')='Monitor'; 
MARKQG1F.('Length')=0; 
MARKQG1F.('PassMethod')='IdentityPass'; 
MARKQG1DA.('FamName')='MARKQG1DA';
MARKQG1DA.('Class')='Monitor'; 
MARKQG1DA.('Length')=0; 
MARKQG1DA.('PassMethod')='IdentityPass'; 
MARKQG1DB.('FamName')='MARKQG1DB';
MARKQG1DB.('Class')='Monitor'; 
MARKQG1DB.('Length')=0; 
MARKQG1DB.('PassMethod')='IdentityPass'; 
MARKQG2D.('FamName')='MARKQG2D';
MARKQG2D.('Class')='Monitor'; 
MARKQG2D.('Length')=0; 
MARKQG2D.('PassMethod')='IdentityPass'; 
MARKQG2FA.('FamName')='MARKQG2FA';
MARKQG2FA.('Class')='Monitor'; 
MARKQG2FA.('Length')=0; 
MARKQG2FA.('PassMethod')='IdentityPass'; 
MARKQG2FB.('FamName')='MARKQG2FB';
MARKQG2FB.('Class')='Monitor'; 
MARKQG2FB.('Length')=0; 
MARKQG2FB.('PassMethod')='IdentityPass'; 
MARKQG3F.('FamName')='MARKQG3F';
MARKQG3F.('Class')='Monitor'; 
MARKQG3F.('Length')=0; 
MARKQG3F.('PassMethod')='IdentityPass'; 
MARKQG3DA.('FamName')='MARKQG3DA';
MARKQG3DA.('Class')='Monitor'; 
MARKQG3DA.('Length')=0; 
MARKQG3DA.('PassMethod')='IdentityPass'; 
MARKQG3DB.('FamName')='MARKQG3DB';
MARKQG3DB.('Class')='Monitor'; 
MARKQG3DB.('Length')=0; 
MARKQG3DB.('PassMethod')='IdentityPass'; 

BC10=atsbend('BC10',0,0,0,'BndMPoleSymplectic4Pass');
BC10.('NumIntSteps')=10; 
BC10.('Length')=0.2; 
BC10.('BendingAngle')=0.03992591; 
BC10.('ExitAngle')=0.03992591; 
BC10.('MaxOrder')=length(BC10.('PolynomB'))-1; 

BC20=atsbend('BC20',0,0,0,'BndMPoleSymplectic4Pass');
BC20.('NumIntSteps')=10; 
BC20.('Length')=0.2; 
BC20.('BendingAngle')=-0.03992591; 
BC20.('EntranceAngle')=-0.03992591; 
BC20.('MaxOrder')=length(BC20.('PolynomB'))-1; 

BC30=atsbend('BC30',0,0,0,'BndMPoleSymplectic4Pass');
BC30.('NumIntSteps')=10; 
BC30.('Length')=0.2; 
BC30.('BendingAngle')=-0.03992591; 
BC30.('ExitAngle')=-0.03992591; 
BC30.('MaxOrder')=length(BC30.('PolynomB'))-1; 

BC40=atsbend('BC40',0,0,0,'BndMPoleSymplectic4Pass');
BC40.('NumIntSteps')=10; 
BC40.('Length')=0.2; 
BC40.('BendingAngle')=0.03992591; 
BC40.('EntranceAngle')=0.03992591; 
BC40.('MaxOrder')=length(BC40.('PolynomB'))-1; 

BC1A=atsbend('BC1A',0,0,0,'BndMPoleSymplectic4Pass');
BC1A.('NumIntSteps')=10; 
BC1A.('Length')=0.2; 
BC1A.('BendingAngle')=0.1105843492438955; 
BC1A.('ExitAngle')=0.1105843492438955; 
BC1A.('MaxOrder')=length(BC1A.('PolynomB'))-1; 

BC2A=atsbend('BC2A',0,0,0,'BndMPoleSymplectic4Pass');
BC2A.('NumIntSteps')=10; 
BC2A.('Length')=0.2; 
BC2A.('BendingAngle')=-0.1105843492438955; 
BC2A.('EntranceAngle')=-0.1105843492438955; 
BC2A.('MaxOrder')=length(BC2A.('PolynomB'))-1; 

BC3A=atsbend('BC3A',0,0,0,'BndMPoleSymplectic4Pass');
BC3A.('NumIntSteps')=10; 
BC3A.('Length')=0.2; 
BC3A.('BendingAngle')=-0.1105843492438955; 
BC3A.('ExitAngle')=-0.1105843492438955; 
BC3A.('MaxOrder')=length(BC3A.('PolynomB'))-1; 

BC4A=atsbend('BC4A',0,0,0,'BndMPoleSymplectic4Pass');
BC4A.('NumIntSteps')=10; 
BC4A.('Length')=0.2; 
BC4A.('BendingAngle')=0.1105843492438955; 
BC4A.('EntranceAngle')=0.1105843492438955; 
BC4A.('MaxOrder')=length(BC4A.('PolynomB'))-1; 

BC1B=atsbend('BC1B',0,0,0,'BndMPoleSymplectic4Pass');
BC1B.('NumIntSteps')=10; 
BC1B.('Length')=0.2; 
BC1B.('BendingAngle')=0.09713503; 
BC1B.('ExitAngle')=0.09713503; 
BC1B.('MaxOrder')=length(BC1B.('PolynomB'))-1; 

BC2B=atsbend('BC2B',0,0,0,'BndMPoleSymplectic4Pass');
BC2B.('NumIntSteps')=10; 
BC2B.('Length')=0.2; 
BC2B.('BendingAngle')=-0.09713503; 
BC2B.('EntranceAngle')=-0.09713503; 
BC2B.('MaxOrder')=length(BC2B.('PolynomB'))-1; 

BC3B=atsbend('BC3B',0,0,0,'BndMPoleSymplectic4Pass');
BC3B.('NumIntSteps')=10; 
BC3B.('Length')=0.2; 
BC3B.('BendingAngle')=-0.09713503; 
BC3B.('ExitAngle')=-0.09713503; 
BC3B.('MaxOrder')=length(BC3B.('PolynomB'))-1; 

BC4B=atsbend('BC4B',0,0,0,'BndMPoleSymplectic4Pass');
BC4B.('NumIntSteps')=10; 
BC4B.('Length')=0.2; 
BC4B.('BendingAngle')=0.09713503; 
BC4B.('EntranceAngle')=0.09713503; 
BC4B.('MaxOrder')=length(BC4B.('PolynomB'))-1; 

BG1=atsbend('BG1',0,0,0,'BndMPoleSymplectic4Pass');
BG1.('NumIntSteps')=10; 
BG1.('Length')=0.8; 
BG1.('BendingAngle')=0.01; 
BG1.('EntranceAngle')=0.005; 
BG1.('ExitAngle')=0.005; 
BG1.('MaxOrder')=length(BG1.('PolynomB'))-1; 

BG2=atsbend('BG2',0,0,0,'BndMPoleSymplectic4Pass');
BG2.('NumIntSteps')=10; 
BG2.('Length')=0.8; 
BG2.('BendingAngle')=0.01; 
BG2.('EntranceAngle')=0.005; 
BG2.('ExitAngle')=0.005; 
BG2.('MaxOrder')=length(BG2.('PolynomB'))-1; 

BG3=atsbend('BG3',0,0,0,'BndMPoleSymplectic4Pass');
BG3.('NumIntSteps')=10; 
BG3.('Length')=0.8; 
BG3.('BendingAngle')=-0.01; 
BG3.('EntranceAngle')=-0.005; 
BG3.('ExitAngle')=-0.005; 
BG3.('MaxOrder')=length(BG3.('PolynomB'))-1; 

BG4=atsbend('BG4',0,0,0,'BndMPoleSymplectic4Pass');
BG4.('NumIntSteps')=10; 
BG4.('Length')=0.8; 
BG4.('BendingAngle')=-0.01; 
BG4.('EntranceAngle')=-0.005; 
BG4.('ExitAngle')=-0.005; 
BG4.('MaxOrder')=length(BG4.('PolynomB'))-1; 

DC0R=atdrift('DC0R',0,'DriftPass');
DC0R.('Length')=0.1; 

DCM0=atdrift('DCM0',0,'DriftPass');
DCM0.('Length')=0.9; 

DC11=atdrift('DC11',0,'DriftPass');
DC11.('Length')=1.4; 

DC12=atdrift('DC12',0,'DriftPass');
DC12.('Length')=1.4; 

DC1L=atdrift('DC1L',0,'DriftPass');
DC1L.('Length')=0.2; 

DC1R=atdrift('DC1R',0,'DriftPass');
DC1R.('Length')=0.9282630768268429; 

DC1A=atdrift('DC1A',0,'DriftPass');
DC1A.('Length')=2.5; 

DCMA=atdrift('DCMA',0,'DriftPass');
DCMA.('Length')=0.65; 

DC2L=atdrift('DC2L',0,'DriftPass');
DC2L.('Length')=0.2; 

DC2R=atdrift('DC2R',0,'DriftPass');
DC2R.('Length')=1.999999927856385; 

DC1B=atdrift('DC1B',0,'DriftPass');
DC1B.('Length')=2.5; 

DCMB=atdrift('DCMB',0,'DriftPass');
DCMB.('Length')=1.5; 

DM01=atdrift('DM01',0,'DriftPass');
DM01.('Length')=8.498678750574161e-08; 

DM02=atdrift('DM02',0,'DriftPass');
DM02.('Length')=1.927964676001367; 

DM03=atdrift('DM03',0,'DriftPass');
DM03.('Length')=1.062857909837083; 

DM04=atdrift('DM04',0,'DriftPass');
DM04.('Length')=0.6750421765444645; 

DM012=atdrift('DM012',0,'DriftPass');
DM012.('Length')=0.0006082713160405946; 

DM022=atdrift('DM022',0,'DriftPass');
DM022.('Length')=1.293328074363445; 

DM032=atdrift('DM032',0,'DriftPass');
DM032.('Length')=1.588564164984896; 

DM042=atdrift('DM042',0,'DriftPass');
DM042.('Length')=1.999999844967575; 

DM11=atdrift('DM11',0,'DriftPass');
DM11.('Length')=0.3412687804968184; 

DM12=atdrift('DM12',0,'DriftPass');
DM12.('Length')=0.6368510845197564; 

DM13=atdrift('DM13',0,'DriftPass');
DM13.('Length')=0.6900401830947493; 

DM14=atdrift('DM14',0,'DriftPass');
DM14.('Length')=1.572229169083766; 

DM15=atdrift('DM15',0,'DriftPass');
DM15.('Length')=0.3920810735326503; 

DM21=atdrift('DM21',0,'DriftPass');
DM21.('Length')=0.0001661433943732535; 

DM22=atdrift('DM22',0,'DriftPass');
DM22.('Length')=0.0002355506898472225; 

DM23=atdrift('DM23',0,'DriftPass');
DM23.('Length')=1.999874733156696; 

DM24=atdrift('DM24',0,'DriftPass');
DM24.('Length')=1.425307444261794; 

DM310=atdrift('DM310',0,'DriftPass');
DM310.('Length')=0.0003281720724559068; 

DM320=atdrift('DM320',0,'DriftPass');
DM320.('Length')=1.949258047091275; 

DM330=atdrift('DM330',0,'DriftPass');
DM330.('Length')=0.7811412361508987; 

DM340=atdrift('DM340',0,'DriftPass');
DM340.('Length')=0.2455719769904053; 

DM311=atdrift('DM311',0,'DriftPass');
DM311.('Length')=4.136481615752504; 

DM321=atdrift('DM321',0,'DriftPass');
DM321.('Length')=9.747368137252153; 

DM331=atdrift('DM331',0,'DriftPass');
DM331.('Length')=8.91004174437607; 

DM341=atdrift('DM341',0,'DriftPass');
DM341.('Length')=0.001311570128571062; 

DDOGL=atdrift('DDOGL',0,'DriftPass');
DDOGL.('Length')=1.494510713459225; 

DDOGR=atdrift('DDOGR',0,'DriftPass');
DDOGR.('Length')=6.890270377239767; 

DG1A=atdrift('DG1A',0,'DriftPass');
DG1A.('Length')=0.01286806013449762; 

DG1B=atdrift('DG1B',0,'DriftPass');
DG1B.('Length')=1.701297054710298; 

DG2A=atdrift('DG2A',0,'DriftPass');
DG2A.('Length')=0.9155460774270912; 

DG2B=atdrift('DG2B',0,'DriftPass');
DG2B.('Length')=0.6706352879009623; 

DG3A=atdrift('DG3A',0,'DriftPass');
DG3A.('Length')=0.01286806013449762; 

DG3B=atdrift('DG3B',0,'DriftPass');
DG3B.('Length')=1.701297054710298; 

DUND=atdrift('DUND',0,'DriftPass');
DUND.('Length')=23.8823; 

DFODO=atdrift('DFODO',0,'DriftPass');
DFODO.('Length')=15; 

DCAV=atdrift('DCAV',0,'DriftPass');
DCAV.('Length')=0.1; 

QC11=atquadrupole('QC11',0,0,'StrMPoleSymplectic4Pass');
QC11.('NumIntSteps')=10; 
QC11.('Length')=0.2; 
QC11.('K')=-7.4551; 
QC11.('PolynomB')(2)=-7.4551; 

QC12=atquadrupole('QC12',0,0,'StrMPoleSymplectic4Pass');
QC12.('NumIntSteps')=10; 
QC12.('Length')=0.2; 
QC12.('K')=7.5933; 
QC12.('PolynomB')(2)=7.5933; 

QCM0=atquadrupole('QCM0',0,0,'StrMPoleSymplectic4Pass');
QCM0.('NumIntSteps')=10; 
QCM0.('Length')=0.2; 
QCM0.('K')=-4.6022; 
QCM0.('PolynomB')(2)=-4.6022; 

QCA=atquadrupole('QCA',0,0,'StrMPoleSymplectic4Pass');
QCA.('NumIntSteps')=10; 
QCA.('Length')=0.2; 
QCA.('K')=0.8337326224808579; 
QCA.('PolynomB')(2)=0.8337326224808579; 

QM01=atquadrupole('QM01',0,0,'StrMPoleSymplectic4Pass');
QM01.('NumIntSteps')=10; 
QM01.('Length')=0.1; 
QM01.('K')=-1.125605779081177; 
QM01.('PolynomB')(2)=-1.125605779081177; 

QM02=atquadrupole('QM02',0,0,'StrMPoleSymplectic4Pass');
QM02.('NumIntSteps')=10; 
QM02.('Length')=0.1; 
QM02.('K')=-1.025328280497717; 
QM02.('PolynomB')(2)=-1.025328280497717; 

QM03=atquadrupole('QM03',0,0,'StrMPoleSymplectic4Pass');
QM03.('NumIntSteps')=10; 
QM03.('Length')=0.1; 
QM03.('K')=3.310600131770449; 
QM03.('PolynomB')(2)=3.310600131770449; 

QM04=atquadrupole('QM04',0,0,'StrMPoleSymplectic4Pass');
QM04.('NumIntSteps')=10; 
QM04.('Length')=0.1; 
QM04.('K')=-4.895554956167152; 
QM04.('PolynomB')(2)=-4.895554956167152; 

QM012=atquadrupole('QM012',0,0,'StrMPoleSymplectic4Pass');
QM012.('NumIntSteps')=10; 
QM012.('Length')=0.1; 
QM012.('K')=-6.379499709352409; 
QM012.('PolynomB')(2)=-6.379499709352409; 

QM022=atquadrupole('QM022',0,0,'StrMPoleSymplectic4Pass');
QM022.('NumIntSteps')=10; 
QM022.('Length')=0.1; 
QM022.('K')=0.5997478590261117; 
QM022.('PolynomB')(2)=0.5997478590261117; 

QM032=atquadrupole('QM032',0,0,'StrMPoleSymplectic4Pass');
QM032.('NumIntSteps')=10; 
QM032.('Length')=0.1; 
QM032.('K')=3.202951442607972; 
QM032.('PolynomB')(2)=3.202951442607972; 

QM042=atquadrupole('QM042',0,0,'StrMPoleSymplectic4Pass');
QM042.('NumIntSteps')=10; 
QM042.('Length')=0.1; 
QM042.('K')=-2.193541729792075; 
QM042.('PolynomB')(2)=-2.193541729792075; 

QM11=atquadrupole('QM11',0,0,'StrMPoleSymplectic4Pass');
QM11.('NumIntSteps')=10; 
QM11.('Length')=0.1; 
QM11.('K')=-5.722141779238331; 
QM11.('PolynomB')(2)=-5.722141779238331; 

QM12=atquadrupole('QM12',0,0,'StrMPoleSymplectic4Pass');
QM12.('NumIntSteps')=10; 
QM12.('Length')=0.1; 
QM12.('K')=7.200852098771735; 
QM12.('PolynomB')(2)=7.200852098771735; 

QM13=atquadrupole('QM13',0,0,'StrMPoleSymplectic4Pass');
QM13.('NumIntSteps')=10; 
QM13.('Length')=0.1; 
QM13.('K')=-3.217107242016935; 
QM13.('PolynomB')(2)=-3.217107242016935; 

QM14=atquadrupole('QM14',0,0,'StrMPoleSymplectic4Pass');
QM14.('NumIntSteps')=10; 
QM14.('Length')=0.1; 
QM14.('K')=-4.132022023383273; 
QM14.('PolynomB')(2)=-4.132022023383273; 

QM15=atquadrupole('QM15',0,0,'StrMPoleSymplectic4Pass');
QM15.('NumIntSteps')=10; 
QM15.('Length')=0.1; 
QM15.('K')=6.567715690088781; 
QM15.('PolynomB')(2)=6.567715690088781; 

QM21=atquadrupole('QM21',0,0,'StrMPoleSymplectic4Pass');
QM21.('NumIntSteps')=10; 
QM21.('Length')=0.1; 
QM21.('K')=0.650666763091882; 
QM21.('PolynomB')(2)=0.650666763091882; 

QM22=atquadrupole('QM22',0,0,'StrMPoleSymplectic4Pass');
QM22.('NumIntSteps')=10; 
QM22.('Length')=0.1; 
QM22.('K')=-2.021258365074747; 
QM22.('PolynomB')(2)=-2.021258365074747; 

QM23=atquadrupole('QM23',0,0,'StrMPoleSymplectic4Pass');
QM23.('NumIntSteps')=10; 
QM23.('Length')=0.1; 
QM23.('K')=1.31617193999209; 
QM23.('PolynomB')(2)=1.31617193999209; 

QM24=atquadrupole('QM24',0,0,'StrMPoleSymplectic4Pass');
QM24.('NumIntSteps')=10; 
QM24.('Length')=0.1; 
QM24.('K')=-0.5259714349650685; 
QM24.('PolynomB')(2)=-0.5259714349650685; 

QM310=atquadrupole('QM310',0,0,'StrMPoleSymplectic4Pass');
QM310.('NumIntSteps')=10; 
QM310.('Length')=0.1; 
QM310.('K')=-0.3219852581007244; 
QM310.('PolynomB')(2)=-0.3219852581007244; 

QM320=atquadrupole('QM320',0,0,'StrMPoleSymplectic4Pass');
QM320.('NumIntSteps')=10; 
QM320.('Length')=0.1; 
QM320.('K')=0.8254105841901698; 
QM320.('PolynomB')(2)=0.8254105841901698; 

QM330=atquadrupole('QM330',0,0,'StrMPoleSymplectic4Pass');
QM330.('NumIntSteps')=10; 
QM330.('Length')=0.1; 
QM330.('K')=-2.685331546226791; 
QM330.('PolynomB')(2)=-2.685331546226791; 

QM340=atquadrupole('QM340',0,0,'StrMPoleSymplectic4Pass');
QM340.('NumIntSteps')=10; 
QM340.('Length')=0.1; 
QM340.('K')=1.103946557997504; 
QM340.('PolynomB')(2)=1.103946557997504; 

QM311=atquadrupole('QM311',0,0,'StrMPoleSymplectic4Pass');
QM311.('NumIntSteps')=10; 
QM311.('Length')=0.1; 
QM311.('K')=-1.320968147797335; 
QM311.('PolynomB')(2)=-1.320968147797335; 

QM321=atquadrupole('QM321',0,0,'StrMPoleSymplectic4Pass');
QM321.('NumIntSteps')=10; 
QM321.('Length')=0.1; 
QM321.('K')=1.07822241276111; 
QM321.('PolynomB')(2)=1.07822241276111; 

QM331=atquadrupole('QM331',0,0,'StrMPoleSymplectic4Pass');
QM331.('NumIntSteps')=10; 
QM331.('Length')=0.1; 
QM331.('K')=-1.896303200792007; 
QM331.('PolynomB')(2)=-1.896303200792007; 

QM341=atquadrupole('QM341',0,0,'StrMPoleSymplectic4Pass');
QM341.('NumIntSteps')=10; 
QM341.('Length')=0.1; 
QM341.('K')=2.012798788343432; 
QM341.('PolynomB')(2)=2.012798788343432; 

QG1F=atquadrupole('QG1F',0,0,'StrMPoleSymplectic4Pass');
QG1F.('NumIntSteps')=10; 
QG1F.('Length')=0.5; 
QG1F.('K')=0.03004206660714321; 
QG1F.('PolynomB')(2)=0.03004206660714321; 

QG1DA=atquadrupole('QG1DA',0,0,'StrMPoleSymplectic4Pass');
QG1DA.('NumIntSteps')=10; 
QG1DA.('Length')=0.5; 
QG1DA.('K')=0.4193135017021257; 
QG1DA.('PolynomB')(2)=0.4193135017021257; 

QG1DB=atquadrupole('QG1DB',0,0,'StrMPoleSymplectic4Pass');
QG1DB.('NumIntSteps')=10; 
QG1DB.('Length')=0.5; 
QG1DB.('K')=-0.01777770876178663; 
QG1DB.('PolynomB')(2)=-0.01777770876178663; 

QG2FA=atquadrupole('QG2FA',0,0,'StrMPoleSymplectic4Pass');
QG2FA.('NumIntSteps')=10; 
QG2FA.('Length')=0.5; 
QG2FA.('K')=-1.424566806413429; 
QG2FA.('PolynomB')(2)=-1.424566806413429; 

QG2FB=atquadrupole('QG2FB',0,0,'StrMPoleSymplectic4Pass');
QG2FB.('NumIntSteps')=10; 
QG2FB.('Length')=0.5; 
QG2FB.('K')=0.420085415754379; 
QG2FB.('PolynomB')(2)=0.420085415754379; 

QG2D=atquadrupole('QG2D',0,0,'StrMPoleSymplectic4Pass');
QG2D.('NumIntSteps')=10; 
QG2D.('Length')=0.5; 
QG2D.('K')=0.3029690043764623; 
QG2D.('PolynomB')(2)=0.3029690043764623; 

QG3F=atquadrupole('QG3F',0,0,'StrMPoleSymplectic4Pass');
QG3F.('NumIntSteps')=10; 
QG3F.('Length')=0.5; 
QG3F.('K')=-1.835682575640526; 
QG3F.('PolynomB')(2)=-1.835682575640526; 

QG3DA=atquadrupole('QG3DA',0,0,'StrMPoleSymplectic4Pass');
QG3DA.('NumIntSteps')=10; 
QG3DA.('Length')=0.5; 
QG3DA.('K')=0.862605309523; 
QG3DA.('PolynomB')(2)=0.862605309523; 

QG3DB=atquadrupole('QG3DB',0,0,'StrMPoleSymplectic4Pass');
QG3DB.('NumIntSteps')=10; 
QG3DB.('Length')=0.5; 
QG3DB.('K')=1.24459798007608; 
QG3DB.('PolynomB')(2)=1.24459798007608; 

QF01=atquadrupole('QF01',0,0,'StrMPoleSymplectic4Pass');
QF01.('NumIntSteps')=10; 
QF01.('Length')=0.1; 
QF01.('K')=0.9266799999999999; 
QF01.('PolynomB')(2)=0.9266799999999999; 

QF02=atquadrupole('QF02',0,0,'StrMPoleSymplectic4Pass');
QF02.('NumIntSteps')=10; 
QF02.('Length')=0.1; 
QF02.('K')=-0.9266799999999999; 
QF02.('PolynomB')(2)=-0.9266799999999999; 

QF11=atquadrupole('QF11',0,0,'StrMPoleSymplectic4Pass');
QF11.('NumIntSteps')=10; 
QF11.('Length')=0.1; 
QF11.('K')=0.800204; 
QF11.('PolynomB')(2)=0.800204; 

QF12=atquadrupole('QF12',0,0,'StrMPoleSymplectic4Pass');
QF12.('NumIntSteps')=10; 
QF12.('Length')=0.1; 
QF12.('K')=-0.800204; 
QF12.('PolynomB')(2)=-0.800204; 

QF21=atquadrupole('QF21',0,0,'StrMPoleSymplectic4Pass');
QF21.('NumIntSteps')=10; 
QF21.('Length')=0.1; 
QF21.('K')=0.988561; 
QF21.('PolynomB')(2)=0.988561; 

QF22=atquadrupole('QF22',0,0,'StrMPoleSymplectic4Pass');
QF22.('NumIntSteps')=10; 
QF22.('Length')=0.1; 
QF22.('K')=-0.988561; 
QF22.('PolynomB')(2)=-0.988561; 

QF31=atquadrupole('QF31',0,0,'StrMPoleSymplectic4Pass');
QF31.('NumIntSteps')=10; 
QF31.('Length')=0.1; 
QF31.('K')=0.296226; 
QF31.('PolynomB')(2)=0.296226; 

QF32=atquadrupole('QF32',0,0,'StrMPoleSymplectic4Pass');
QF32.('NumIntSteps')=10; 
QF32.('Length')=0.1; 
QF32.('K')=-0.296226; 
QF32.('PolynomB')(2)=-0.296226; 


%% LINES 

BC0= { MARKBC0BEG BC10 DC11 QC11 DC11 BC20 DCM0 QCM0 DCM0 BC30 DC12 QC12  DC12 BC40 MARKBC0END };
BC1= { BC1A DC1A BC2A DCMA QCA DCMA BC3A DC1A BC4A MARKBC1END };
BC2= { BC1B DC1B BC2B DCMB BC3B DC1B BC4B };
CELL0= { QF01 DCAV CAV0 DCAV QF02 MARKQF02 QF02 DCAV CAV0 DCAV QF01  MARKQF01 };
CELL1= { QF11 DCAV CAV1 DCAV QF12 MARKQF12 QF12 DCAV CAV1 DCAV QF11  MARKQF11 };
CELL2= { QF21 DCAV CAV2 DCAV QF22 MARKQF22 QF22 DCAV CAV2 DCAV QF21  MARKQF21 };
CELLUND= { QF31 DUND QF32 MARKQF32 QF32 DUND QF31 MARKQF31 };
MATCHSEC01= { QM01 MARKQM01 QM01 DM01 QM02 MARKQM02 QM02 DM02 QM03  MARKQM03 QM03 DM03 QM04 MARKQM04 QM04 DM04 };
MATCHSEC02= { QM012 MARKQM012 QM012 DM012 QM022 MARKQM022 QM022 DM022  QM032 MARKQM032 QM032 DM032 QM042 MARKQM042 QM042 DM042 };
MATCHSEC1= { QM11 MARKQM11 QM11 DM11 QM12 MARKQM12 QM12 DM12 QM13  MARKQM13 QM13 DM13 QM14 MARKQM14 QM14 DM14 };
MATCHSEC2= { QM21 MARKQM21 QM21 DM21 QM22 MARKQM22 QM22 DM22 QM23  MARKQM23 QM23 DM23 QM24 MARKQM24 QM24 DM24 };
MATCHSEC30= { QM310 MARKQM310 QM310 DM310 QM320 MARKQM320 QM320 DM320  QM330 MARKQM330 QM330 DM330 QM340 MARKQM340 QM340 DM340 };
MATCHSEC31= { QM311 MARKQM311 QM311 DM311 QM321 MARKQM321 QM321 DM321  QM331 MARKQM331 QM331 DM331 QM341 MARKQM341 QM341 DM341 };
LINEDOG= { BG1 WDGB1 DG1A QG1DA MARKQG1DA DG1B QG1F MARKQG1F DG1B QG1DB  MARKQG1DB DG1A BG2 WDGB2 DG2A QG2FA MARKQG2FA DG2B QG2D MARKQG2D DG2B QG2FB  MARKQG2FB DG2A BG3 WDGB3 DG3A QG3DA MARKQG3DA DG3B QG3F MARKQG3F DG3B QG3DB  MARKQG3DB DG3A BG4 WDGB4 };
LINE0= { Q WL0BEG MARKL0BEG DC0R MATCHSEC01 QF01 MARKQF01 2*CELL0 QF01  MATCHSEC02 DC1L WL0END MARKL0END };
LINE1= { WL1BEG MARKL1BEG WBC1BEG BC1 WBC1END DC1R MATCHSEC1 QF11  MARKQF11 21*CELL1 QF11 WL1END MARKL1END };
LINE2= { WL2BEG MARKL2BEG DC2L WBC2BEG BC2 WBC2END DC2R MATCHSEC2 QF21  MARKQF21 26*CELL2 QF21 WL2END MARKL2END };
LINE3= { WL3BEG MARKL3BEG DDOGL MATCHSEC30 WDOGBEG MARKDGBEG LINEDOG  WDOGEND MARKDGEND WL3END MARKL3END CHIRPH3 };
LINE4= { WL4BEG MARKL4BEG DDOGR MATCHSEC31 QF31 MARKQF31 4*CELLUND QF31  WL4END MARKL4END };
LINE0BC1= { LINE0 BC1 WBC1END };
LINE01= { LINE0 LINE1 };
LINE012= { LINE0 LINE1 LINE2 };
LINE0123= { LINE0 LINE1 LINE2 LINE3 };
LINE01234= { LINE0 LINE1 LINE2 LINE3 LINE4 };
LINE0123MAT= { LINE012MAT LINE3 };
LINE01234MAT= { LINE0123MAT LINE4 };

 % BUILD LATTICE 

global THERING;
THERING = transpose(LINE01234MAT);
