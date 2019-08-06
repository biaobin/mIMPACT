function M = Mchirp(h)

% Longitudinal energy chirp matrix

M = [
1 0 0 0 0 0;
0 1 0 0 0 0;
0 0 1 0 0 0;
0 0 0 1 0 0;
0 0 0 0 1 0;
0 0 0 0 h 1];

end