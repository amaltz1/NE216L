function [dy] = Db(u,x,h)
dy = (3*u(x) -4*u(x-h) + u(x- 2*h))/ (2*h);
end