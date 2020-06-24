clear;
optimize=@GA_Cost;
[x,fval]=optimize(6,[200,2,4,250,0.01,18],[250,4,35,3000,0.04,96],[4,6],200,10,3,[200,2,4,250,0.01,18;250,4,35,3000,0.04,96],100)
function [x,fval,exitflag,output,population,score] = GA_Cost(nvars,lb,ub,intcon,PopulationSize_Data,EliteCount_Data,MaxStallGenerations_Data,InitialPopulationMatrix_Data,InitialPenalty_Data)
%% This is an auto generated MATLAB file from Optimization Tool.

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'MaxGenerations',50);
options = optimoptions(options,'PlotFcn','gaplotbestf');
options = optimoptions(options,'PopulationSize', PopulationSize_Data);
options = optimoptions(options,'EliteCount', EliteCount_Data);
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'InitialPopulationMatrix', InitialPopulationMatrix_Data);
options = optimoptions(options,'InitialPenalty', InitialPenalty_Data);
options = optimoptions(options,'CreationFcn', @gacreationnonlinearfeasible);
options = optimoptions(options,'MutationFcn', @mutationadaptfeasible);
options = optimoptions(options,'Display', 'iter');
[x,fval,exitflag,output,population,score] = ...
ga(@(y)(0.1*0.765*((y(4)*((0.00068*((33.33*(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371)/y(1))+y(3))-1.5/y(2))+y(5)*y(3)+0.015*y(3))+(33.33*(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371)/y(1))*y(5)*y(4)+1000+0.1*y(4)*(0.002756*y(6)^2))*y(1)/33000)+3.15*(3000*(y(4)+10)/y(4))+0.225*(3000/y(2)+3000/(2*y(2)))*490*(pi*(1.5^2/144)*(1.1*y(6)/12))),nvars,[],[],[],[],lb,ub,@(y)nonlconPareto(y),intcon,options);
end