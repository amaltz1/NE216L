function [dy] = D1st(u,x,h)
dy = (u(x+h) - u(x))/h;
end