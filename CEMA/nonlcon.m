function [c,ceq]=nonlcon(y)

c=-(((y(4)*((0.00068*((33.33*(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371)/y(1))+y(3))-1.5/y(2))+y(5)*y(3)+0.015*y(3))+(33.33*(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371)/y(1))*y(5)*y(4)+1000+0.1*y(4)*(0.002756*y(6)^2))))+4.2*y(3)*(((33.33*(((0.445*y(6)-0.9)/0.1736)^2*(2.45*10^(-5))*100*y(1)/36.74371)/y(1)))+y(2));
ceq=[];
end
