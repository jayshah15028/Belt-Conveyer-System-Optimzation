function [x,fval,exitflag,output,lambda,grad,hessian] = optimizer(x0,lb,ub)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('fmincon');
%% Modify options setting
options = optimoptions(options,'Display', 'iter');
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(@objfun,x0,[],[],[],[],lb,ub,@confun,options);
