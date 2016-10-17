for i = 64
    
    
    richardson_out = richardson22(@Dc, @f28, i, 0.007, 5, 10e-10);
    deriv_out = fp28(i);
    disp(strcat('x=', num2str(i)))
    disp('Richardson output:')
    disp(richardson_out)
    disp('Derivative output:')
    disp(deriv_out)
    disp('Absolute error:')
    disp(abs(richardson_out - deriv_out))
    %disp('Relative error:')
    %disp(abs((richardson_out-deriv_out)/deriv_out) * 100)
end
