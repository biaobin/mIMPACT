function matlab2elegant(X0,E0,fileName)
%biaobin,2018-12-03, write geo phase X0 into input.sdds

headfile = [ ...
'SDDS1 \n' ...
'&column name=x, units=m, type=double &end \n' ...
'&column name=xp, type=double &end \n' ...
'&column name=y, units=m, type=double &end \n' ...
'&column name=yp, type=double &end \n' ...
'&column name=t, units=s, type=double &end \n' ...
'&column name=p, units="m$be$nc", type=double &end \n' ...
'&column name=particleID,type=long &end \n' ...
'&data mode=ascii &end \n'];

%% calculations
% X = geophase2elegant(X0,E0);

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
bet     = gambet./gam;

% elegant phase
tmp1 = x;       %-dz.*xp;
tmp2 = xp;
tmp3 = y;       %-dz.*yp;
tmp4 = yp;
tmp5 = -dz./(betz*const.c_mks);
tmp6 = gambet;

X = [tmp1 tmp2 tmp3 tmp4 tmp5 tmp6];

Np = size(X,1);
X1 = [X (1:Np)'];
%write into the input.sdds file
h = fopen(fileName,'w');
fprintf(h,headfile);
fprintf(h,'%d \n',Np);
fprintf(h,'%25.15e %25.15e %25.15e %25.15e %25.15e %25.15e %10d \n',X1');
fclose(h);

%for debuging equivalent path-length
s = -bet./betz.*dz;
tmpX = X0;
tmpX(:,5) = s;
fprintf('coord[j] in elegant code:\n');
fprintf('%25.15e %25.15e %25.15e %25.15e %25.15e %25.15e\n',tmpX');

end
