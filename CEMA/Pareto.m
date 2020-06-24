clc
fun=@multiobj;
nvars=6;

A=[];
b=[];
Aeq=[];
beq=[];
lb=[200,2,4, 250,0.01,18];%% Checked with velocity bounds
ub=[250,4,35,3000,0.04,96];
nonlcon=[];
options = optimoptions(@paretosearch,'PlotFcn','psplotparetof','ConstraintTolerance',1e-04,'MaxFunctionEvaluations',50000);

[y,fval]=paretosearch(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options);
