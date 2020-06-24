clear all; 
% x = [V Mro Mru Mb T b L Fh Fn Fs Mg ]
%      1 2   3   4  5 6 7 8  9  10 11      V-belt speed(m/s) , 
% Mro-Mass of carrying idler(kg/m), Mru-Mass of returning idler(kg/m)
% Mb=mass of belt(kg/m), T= feed rate(tph), b=belt width(m),  length of belt (m)

% objective=@(x) ((x(8)+x(9)+x(10))*x(1)/1000)*(914.4/x(7))/x(5) +... 
%     0.1*(((x(8)+x(9)+x(10))*x(1)/1000)*(914.4/x(7))/x(5)) + 0.5*914.4*(x(2)+x(3)) +...
%     12*914.4*(x(7)+3.33)/x(7);
objective=@(x) 0.1*((((0.0256*x(7)*9.8*(x(2)+x(3)+2*x(4)+(x(5)/(x(1)*3.6))))+(x(5)*x(1)/3.6 + ((x(5)/x(6))^2)/(6.48*3200))+(0.024*(x(5)/x(1))^2 + 0.824*(x(5)/x(1)) + 96.7942))*x(1)/1000)*(914.4/x(7))) + 0.5*914.4*(x(2)+x(3)) +...
    12*914.4*(x(7)+3.33)/x(7) + 1/x(5);
lb=[1.016, 9.36, 12.8,   5.92,  50,  0.45, 152.4 ];
ub=[1.524, 25.7  , 25.67, 51.81, 100, 2.44,  914.4];

x0=[1.016	38.5 12.8	5.92	50	0.4572	152.4	   ;
    1.143	45	 14	    10	    60	0.5	    200	       ;
    1.27	50	 17.5	46.43	75	1.65	467	      ;
    1.397	70	 20.4	23.5	85	1.89	573.36	   ;
    1.524	56	 24	    38.42	90	2.44	914.4	   ;
    1.016	62	 21.67	51.81	55	2.36	783.66	 ;
    1.143	49	 25.67	40.65	95	0.69	263.67	  ;
    1.27	59	 12.8	32.47	57	0.91	914.4	    ;
    1.397	68	 25.67	5.92	100	0.4572	152.4	   ;
    1.524	77	 18.64	28.73	100	2.44	842.5	 ];
A=[];
b=[];
Aeq=[];
beq=[];

nonlcon=@nonlcon1;
options = optimoptions(@fmincon,'Algorithm','sqp','MaxIterations',15000);
options.MaxFunctionEvaluations=100000;
x=zeros(length(x0(1,:)),length(x0(1,:))); fval=zeros(length(x0(1,:)),1);
for i=1:length(x0(:,1))
[x(i,:),fval(i,1)]=fmincon(objective,x0(i,:),A,b,Aeq,beq,lb,ub,nonlcon,options);
end
