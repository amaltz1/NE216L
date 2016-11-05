function [t_out, y_out] = rk4(f, t_rng, y0, n)
    %relevant algorithm on slideshow page 44-45
    
    % Argument Checking
    if ~isa( f, 'function_handle' )
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument f is not a function handle' ) );
    end
    if ~all( size( t_rng ) == [1, 2] ) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument t_rng is not a 2-dimensional row vector' ) );
    end
    if ~isscalar( y0 ) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument y0 is not a scalar' ) );
    end
    if ~isscalar( n ) || (n ~= round( n )) || ~(n > 0)  
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument n is not a positive integer' ) );
    end
    % Determine h, the step size.
    h = (t_rng(end) - t_rng(1))/(n - 1);
    
    % Assign t_out to a vector of n equally spaced values that range from t_rng(1) to t_rng(n)
    t_out = linspace(t_rng(1), t_rng(end),n );
    
    % Assign y_out to a vector of n zeros where y_out(1) is assigned to y0
    y_out = zeros(1, n);
    
    y_out(1) = y0;
    %
    % Initialize a for loop with i ranging from 1 to n-1 where f is used  
    % to calculate the slope at (t_out(i), y_out(i))
    % Set y_out(i+1) as y_out(i) + K * h
    
    for i = 1:n-1
        K1 = f(t_out(i),y_out(i));
        K2 = f(t_out(i)+ 0.5*h,y_out(i)+0.5*h*K1);
        K3 = f(t_out(i)+ 0.5*h,y_out(i)+0.5*h*K2);
        K4 = f(t_out(i)+h,y_out(i)+h*K3);
        y_out(i+1) = y_out(i) + h*(1/6*K1+1/3*K2+1/3*K3+1/6*K4);
        
    end
   
end