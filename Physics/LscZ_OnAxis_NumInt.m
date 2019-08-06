function sumZ = LscZ_OnAxis_NumInt(input,j)
% LSC impedance numerical integration
% ON_AXIS model

% Version
% 09-20-2018, moved to scripts/biaobinAT directoy, changed the threee
% function to same type function names

% input:
% gamma0,  entrance energy of the linac
% A,       accelerating gradient of relative energy
% rb,      beam transverse size, an array of number, so trapz() is used to 
%          get the integral;
%          uniform,  rb = rb
%          gaussian, rb = 1.7*(sig_x + sig_y)/2, actually 1.7 is from
%                    sqrt(3)
% (s1,s2), integral limit 

L      = input.L;
rb     = input.rb;
A      = input.A;
gamma0 = input.gamma0;
k      = input.k(j);

Z0     = 120*pi;

% calculation of impedance along 0-L
N = length(rb);
s = linspace(0,L,N)';
gamma = gamma0 + A*s;

zeta = k .*rb ./gamma;
z_per_meter = i*Z0 ./(pi .*rb .*gamma) .*(1 -zeta .*besselk(1,zeta))./zeta;

% figure()
% plot(s,z_per_meter);

sumZ = trapz(s,z_per_meter);
end