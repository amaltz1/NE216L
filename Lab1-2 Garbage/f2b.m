function[y] = f2b(x)
    y= 4.*x.*exp(-2.*x) - 4.*exp(-x).*x.^2 + exp(-x/2);
end
