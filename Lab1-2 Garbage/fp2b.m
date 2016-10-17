function[y] = fp2b(x)
    y= (1/2) .* exp(-2.*x).*(8-exp(3.*x/2)-16.*x+8.*exp(x).*(-2+x).*x);
end