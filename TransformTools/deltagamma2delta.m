function delta=deltagamma2delta(dgamma,E0)
%biaobin,2018-11-15, change deltagamma to delta, same as ImpactZ's method
%                    I still think it is not right for big dgamma

beta0 = e2beta(E0); %E0 [MeV]

gammabeta0 = e2p(E0);  %E0 [MeV]


delta = dgamma/beta0/gammabeta0;

end
