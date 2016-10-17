function [t_out, y_out] = heun(f, t_rng, y0, n)

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

    
    for i = 1:n-1
        K1 = f(t_out(i),y_out(i));
        K2 = f(t_out(i) + h, y_out(i) + h*K1);
        y_out(i+1) = y_out(i) + h * (K1 + K2)/2;
        
    end
   

end