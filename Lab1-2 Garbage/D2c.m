function [dy]= D2c(u,x,h)
dy = (u(x+h) -2*u(x) + u(x-h))/h^2;
end

