function X = elegant2geophase(X0)
%biaobin,2018-11-30, transform elegant phase to geophase
%X0, 6D phase in elegant, N*6 matrix

x = X0(:,1);
xp = X0(:,2);
y = X0(:,3);
yp = X0(:,4);
t = X0(:,5);
gambet = X0(:,6);

% reference particle
gambet0 = mean(gambet);

% other particles
gambetz  = gambet./sqrt(xp.^2 +yp.^2 +1);
gam = sqrt(gambet.^2 + 1);
betz = gambetz ./gam;

% geo phase
z = -betz .*const.c_mks .*t;   % minus to change to head with z>0
dz = z-mean(z);

tmp1 = x + dz .*xp;
tmp2 = xp;
tmp3 = y + dz .*yp;
tmp4 = yp;
tmp5 = dz;
tmp6 = (gambet-gambet0)/gambet0;

X = [tmp1 tmp2 tmp3 tmp4 tmp5 tmp6];

end