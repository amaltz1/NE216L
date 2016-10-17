for i=1:7
    if i==1 
        n_mat(i) = 11;
    else
        n_mat(i) =(n_mat(i-1)-1)*2 + 1;
    end
    [tvals, yvals] = heun(@f3c, [0,1], 1, n_mat(i));
    
    soln_mat_heun(i) = yvals(end);
    error_mat_heun(i) = abs(soln_mat_heun(i) - 2.604215099096980);
    

end
disp(error_mat_heun(5)/error_mat_heun(4))