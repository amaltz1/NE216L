function [dy] = f5a( t, y )
    dy = [y(1)*(1 - 2*y(2))
          y(2)*(y(1) - 1)];
end
