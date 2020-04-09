function N_kicks = getNkicks(input)
%biaobin,2018-11-09, get minimum LSC kicks number per meter

sig_x = input.sig_x;
sig_y = input.sig_y;
I0    = input.I0;
A     = input.A;
gamma = input.gamma;

%for gaussian distribution
% rb = 1.7/2 * (sig_x + sig_y);

%for uniform distribution
rb = 2*(sig_x+sig_y)/2;

%minimum kick distance for drift
l = 0.1 *rb/2 *sqrt(gamma^3 *const.IA /I0);
%minimum kick distance for acceleration
l_gamma = 0.1 *gamma /A;

% N_kicks for element length being L
% N_kicks1 = ceil(Length/l);
% N_kicks2 = ceil(Length/l_gamma);

% Nkicks per meter
N_kicks1 = 1/l;
N_kicks2 = 1/l_gamma; 

N_kicks = max([N_kicks1 N_kicks2]);

end