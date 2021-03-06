data=xlsread('doe varaibles for matlab');
Kt=1; H=0;
L=data(:,1); V=data(:,3);  Q=data(:,2);  b=data(:,4); 
hs=0.1*b; Cs=0.1378 ; Tp=1000; Lb=15;
Ai=data(:,6); Si=data(:,5); 
Wm=33.33*Q./V; Wb=data(:,7) ;
Kx=0.00068*(Wm+Wb)+(Ai./Si); Ky=data(:,8) ;
Tx=Kt.*Kx.*L; 
Tyb=Kt.*L.*(Ky.*Wb + 0.015.*Wb); 
Tym=Wm.*L.*Ky; 
Ts=Lb*(2*Cs*hs.^2 + 6);
Te= Tx + Tyb + Tym + Tp + Ts;
P=(Te.*V./33000).*(3000./L);
