function twiss=geophase2twiss(X0)
x  = X0(:,1);
xp = X0(:,2);
y  = X0(:,3);
yp = X0(:,4);
z  = X0(:,5);
delta = X0(:,6);

sig_11 = mean(  (x-mean(x)).*(x-mean(x))   );
sig_12 = mean(  (x-mean(x)).*(xp-mean(xp))  );
sig_21 = sig_12;
sig_22 = mean(  (xp-mean(xp)).*(xp-mean(xp)) );

sig_33 = mean(  (y-mean(y)).*(y-mean(y))   );
sig_34 = mean(  (y-mean(y)).*(yp-mean(yp)) );
sig_43 = sig_34;
sig_44 = mean(  (yp-mean(yp)).*(yp-mean(yp))   );

sig_15 = mean(  (x-mean(x)).*(z-mean(z))   );
sig_51 = sig_15;
sig_25 = mean(  (xp-mean(xp)).*(z-mean(z))   );
sig_52 = sig_25;

sig_16 = mean(  (x-mean(x)).*(delta-mean(delta))   );
sig_61 = sig_16;
sig_36 = mean(  (y-mean(y)).*(delta-mean(delta))   );
sig_63 = sig_36;

sig_26 = mean(  (xp-mean(xp)).*(delta-mean(delta))   );
sig_62 = sig_26;
sig_46 = mean(  (yp-mean(yp)).*(delta-mean(delta))   );
sig_64 = sig_46;

sig_55 = mean(  (z-mean(z)).*(z-mean(z))   );
sig_66 = mean(  (delta-mean(delta)).*(delta-mean(delta))   );
sig_56 = mean(  (z-mean(z)).*(delta-mean(delta))   );
sig_65 = sig_56;
  
SIG    =   [sig_11 sig_12   0       0     sig_15 sig_16;
            0      sig_22   0       0     sig_25 sig_26;
            0       0       sig_33 sig_34 0      sig_36;
            0       0       0      sig_44 0      sig_46;
            sig_51 sig_52   0       0     sig_55 sig_56;
            sig_61 sig_62 sig_63 sig_64 sig_65 sig_66];
        
twiss = sig2twiss(SIG);

end
      
 
