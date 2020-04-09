function sumZ = LscZ_Average(input,j)
% LSC impedance integration with average beam radius
% Average model for ImpactZ code

% Version
% 09-20-2018, moved to scripts/biaobinAT directoy, changed the threee
% function to same type function names

% input:
% gamma0,  entrance energy of the linac
% A,       accelerating gradient of relative energy
% rb,      transverse beam size;
%          uniform,  rb = rb
%          gaussian, rb = 1.7*(sig_x + sig_y)/2, actually 1.7 is from
%                    sqrt(3)
% (s1,s2), integral limit 


L      = input.L;
rb     = input.rb;
A      = input.A;
gamma0 = input.gamma0;
k      = input.k(j);

Z0 = const.Z0;  % impedance in vacume

% average model
func =@(s) i*Z0./(pi*rb*(gamma0+A*s)) .*( 1-2*besseli(1,k*rb./(gamma0+A*s)).*besselk(1,k*rb./(gamma0+A*s)) )./ (k*rb./(gamma0+A*s)) ;  

% 3D model
% func =@(s) i*Z0./(pi*rb*(gamma0+A*s))*0.5;

sumZ = integral(func,0,L);
 
end