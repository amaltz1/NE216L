f4c_actual = 2.604215099096980;

k = 8; %number of iterations
length_t_out_matrix = zeros(1,k+1);
abs_error_matrix = zeros(1,k+1);
for i =0:k
    [tvals,yvals] = dp45( @f4c, [0, 1], 1, 0.1, (1e-4)/16^i );
  
    length_t_out_matrix(i+1) = length(tvals);
    abs_error_matrix(i+1) = abs(yvals(end)-f4c_actual);

end

disp(abs_error_matrix)
disp(length_t_out_matrix)
