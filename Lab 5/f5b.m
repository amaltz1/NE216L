function [dy] = f5b( t, y )
        sigma = 10;
        rho = 28;
        beta = 8/3;
        dy = [sigma*(y(2) - y(1))
              y(1)*(rho - y(3)) - y(2)
              y(1)*y(2) - beta*y(3)];
    end
