%find the value of tf such that the normal is less than 0.001
norm_error = inf;
tf = 6.8;
while norm_error>0.001
    [t5a, y5a] = dp45( @f5a, [0, tf], [3/10 1/2]', 0.001, 1e-10 );
    norm_error = norm( y5a(:, end) - y5a(:, 1) );
    tf = tf + 1e-3;
    %disp(norm_error>0.001)
end
disp(norm_error)
disp(norm_error>0.001)
disp(tf)