clc;
%x(1)=Velocity(fpm)
%x(2)=Wm=Weight of the material per Ft 
%x(3)=(Si)=Idler Spacing in Ft
%x(4)=Wb= Weight of the belt per Ft
%x(5)=Capacity in (tph)
%x(6)=Kx
%x(7)=Ky
%x(8)=Length of the belt in Ft
%x(9)=Te=Equivalent Tension in (Lbs)
%x(10)= Width of the belt in inches
%x(11)=Ai

sf1=100;
sf2=98639;

objective=@(x) -x(5)/sf1+(0.1*0.765*((x(9)*x(1)/(33000)))+3.15*(3000*(x(8)+10)/x(8))+ 0.5*(3000/x(3)+3000/(2*x(3)))*490*(pi*(1.5^2/144)*(1.1*x(10)/12)))/sf2;
x0=[250,150,3,20,75,1,0.02,500,500,31,1.6
    200,0,2,4, 50,0.2,0.01, 250,500,18,1.5
    300,300,4,35,100,2,0.04,3000,100,96,2.8
    100,100,3.2,19,75,1.2,0.02,2500,400,36,2.0
    200,20,2,35,100,2,0.03,1000,500,24,2.2
    200,20,2,35,100,2,0.03,100,500,48,5
    300,20,2,35,100,2,0.03,1500,500,24,2.3
    200,20,2,35,100,2,0.03,300,500,24,2.4
    200,20,2,20,100,2,0.03,300,500,24,2.5
    200,20,2,5,100,2,0.03,300,500,24,2.7
    200,20,2,35,100,2,0.03,2250,500,24,1.9];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[200,  0,2,4,  50,0.2,0.01, 250,500,18,1.5];%% Checked with velocity bounds
ub=[250,300,4,35,100,  2,0.04,3000,Inf,96,2.8];
nonlcon=@nonlcon;
options = optimoptions(@fmincon,'Algorithm','sqp','MaxIterations',150000,'ConstraintTolerance',1e-3);
for i=1:1:length(x0(:,11))
  [x(i,:),fval]=fmincon(objective,x0(i,:),A,b,Aeq,beq,lb,ub,nonlcon,options);
end


