clear all
clc

%%
Lbunch = 2e-3;

Np = 5e6;
z1 = -Lbunch/2;
z2 =  Lbunch/2;
z = z1+(z2-z1)*rand(Np,1);

% figure()
% histogram(z,25)

%% add end gaussian distribution
sigz = 0.6e-3;
Npend = round( Np/(z2-z1)*sqrt(2*pi)*sigz );

endz = sigz * randn(Npend,1);

% figure()
% histogram(endz,25)

id1 = endz > 0;
id2 = endz < 0;

endz(id1) = endz(id1) + Lbunch/2;
endz(id2) = endz(id2) - Lbunch/2;

% figure()
% histogram(endz,25)

%% put them together
newz = [z;endz];

figure()
histogram(newz,100)



