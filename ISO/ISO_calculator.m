data=xlsread('doe sheet_iso');
f=0.0256; g=9.8; d=1600;
Mro=data(:,2) ; Mru=Mro/3; Mb=5.92 ; T=data(:,3) ; V=data(:,1) ; b=data(:,4) ; L=data(:,5) ;
Mg=T./(3.6.*V);
k=[0.024;0.824;96.7942];
Fs=(T./V).^2*k(1) + (T./V)*k(2) + k(3);
Fh=f*L*g.*[Mro + Mru + 2*Mb + Mg];
Fn=T.*V/3.6 + ((T./b).^2)./(6.48*d);
P=((Fh+Fn+Fs).*V/1000).*(914.4./L);
% 
% T=600; V=2.54
