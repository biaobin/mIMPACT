clear all

K  = 0.31;
Lq = 0.05;

f = 1/(sqrt(K)*sin(sqrt(K)*Lq));
L = 14;

kapa = 2*f*(f+L)/(2*L-f);

etap0  = 0.1;
eta0   = etap0*kapa;