function X = geophase2elegant(X0,E0)
%biaobin,2018-12-03, transform geo phase to elegant
%X0, 6D phase in geo phase
%E0, reference energy in [MeV]

% reference particle
% gam0    = e2gamma(E0);
% bet0    = e2beta(E0);
gambet0 = e2p(E0);

% geo phase
x      = X0(:,1);
xp     = X0(:,2);
y      = X0(:,3);
yp     = X0(:,4);
dz     = X0(:,5);
delta  = X0(:,6);

gambet  = (delta+1)*gambet0;
gam     = sqrt(gambet.^2 +1);
gambetz = gambet ./sqrt(xp.^2 +yp.^2 +1);
betz    = gambetz./gam;

% elegant phase
tmp1 = x-dz.*xp;
tmp2 = xp;
tmp3 = y-dz.*yp;
tmp4 = yp;
tmp5 = -dz./(betz*const.c_mks);
tmp6 = gambet;

X = [tmp1 tmp2 tmp3 tmp4 tmp5 tmp6];

end