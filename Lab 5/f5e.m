function [dx] = f5e( t, x )              
    dx = [x(2)
         25*cos(4*t) - 6*x(2) - 10*x(1)];
end

% 1/5 x'' + 1.2 x' + 2x = 5cos(4t)
% let x(2) = x'
% 1/5 x(2)' + 1.2x(2) + 2x(1) = 5cos(4t)
% x(2)' = 25 cos(4t) - 6x(2) - 10x(1) by isolating for x(2)'
% x(1)' = x(2)                        by change of variable