for i = 1:4
    richardson_out = richardson22(@Dc, @f2a, i, 0.1, 5, 10e-5);
    deriv_out = fp2a(i);
    disp(strcat('x=', num2str(i)))
    disp('Richardson output:')
    disp(richardson_out)
    %disp('Derivative output:')
    %disp(deriv_out)
    disp('Absolute error:')
    disp(abs(richardson_out - deriv_out))
    disp('Relative error:')
    disp(abs((richardson_out-deriv_out)/deriv_out) * 100)
end