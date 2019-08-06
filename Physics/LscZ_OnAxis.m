function sumZ = LscZ_OnAxis(input,j)
% LSC impedance integration with average beam radius
% On axis model for Elegant

% Version
% 09-20-2018, moved to scripts/biaobinAT directoy, changed the threee
% function to same type function names

% input:
% gamma0,  entrance energy of the linac
% A,       accelerating gradient of relative energy
% rb,      beam transverse RMS size
% (s1,s2), integral limit 

L      = input.L;
rb     = input.rb;
A      = input.A;
gamma0 = input.gamma0;
k      = input.k(j);

Z0 = 120*pi;  % impedance in vacume

% ON_AXIS model
func =@(s) i*Z0./(pi*rb*(gamma0+A*s)) .*( 1- (k*rb./(gamma0+A*s) .* besselk(1,k*rb./(gamma0+A*s)) ) )./ (k*rb./(gamma0+A*s)) ;  

sumZ = integral(func,0,L);
 
end