function [dy]= Dc(u,x,h)
dy = (u(x+h) - u(x-h))/(2*h);
end