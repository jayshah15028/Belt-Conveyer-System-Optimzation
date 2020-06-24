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

%objective=@(y)
%-(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371);
objective=@(y) (0.1*0.765*((y(4)*((0.00068*((33.33*(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371)/y(1))+y(3))-1.5/y(2))+y(5)*y(3)+0.015*y(3))+(33.33*(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371)/y(1))*y(5)*y(4)+1000+0.1*y(4)*(0.002756*y(6)^2))*y(1)/33000)+3.15*(3000*(y(4)+10)/y(4))+0.225*(3000/y(2) + 3000/(2*y(2)))*490*(pi*(1.5^2/144)*(1.1*y(6)/12)));
y0=[250,3,20,500,0.02,31
    200,2,4,250,0.01,18
    300,4,35,3000,0.04,96
    100,3.2,15,2500,0.02,36
    200,2,35,1000,0.03,24
    235,3.5,35,100,0.03,48
    300,3,15,1500,0.03,24
    225,2.5,35,300,0.03,24
    210,2.8,20,300,0.03,64
    240,3,5,400,0.03,24
    ];
%%xo1=[242.24,15.05,4,24.83,50.34,0.223,0.0207,3000,6018.95,24,2.61];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[200,2,4,250,0.01,18];%% Checked with velocity bounds
ub=[250,4,35,3000,0.04,96];
nonlcon=@nonlconPareto;
options = optimoptions(@fmincon,'Algorithm','sqp','Display','iter','MaxFunctionEvaluations',10000,'ConstraintTolerance',1e-03,'FiniteDifferenceStepSize',1e-10);
%%[x,fval,exitflag,output,lambda,grad,hessian]=fmincon(objective,xo1,A,b,Aeq,beq,lb,ub,nonlcon,options);
for i=1:1:length(y0(:,6))
  [y(i,:),fval(i,:)]=fmincon(objective,y0(i,:),A,b,Aeq,beq,lb,ub,nonlcon,options);
end
 
points=1:1:10;
plot(points,fval(:,:),'*');
[in1,in2]=find(min(fval));
