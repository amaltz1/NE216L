function [du] = richardson21( D, u, x, h, N_max, eps_abs)
    % Argument Checking

    if ~isa(u, 'function_handle')
        throw( MException( 'MATLAB:invalid_argument','the argument u is not a function handle' ) );
    end
    if ~isa(D, 'function_handle')
        throw( MException( 'MATLAB:invalid_argument','the argument D is not a function handle' ) );
    end
    if ~isscalar( N_max ) || (N_max ~= round( N_max ) || N_max<=0)  
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument N_max is not an integer' ) );
    end
    if ~isscalar( eps_abs ) || (x <= 0) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument eps_abs is not a positive scalar' ) );
    end
    if ~isscalar( x ) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument w is not a scalar' ) );
    end 
    if ~isscalar( h ) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument h is not a scalar' ) );
    end
    R = zeros(N_max, N_max);
    R(1,1) = D(u,x,h);
    for i = 1:N_max
        R(i+1,1) = D(u, x, h/2^i);
        for j = 1:i
            R(i+1, j+1) = (2^(j+1) * R(i+1,j) - R(i,j))/(2^(j+1)-1);
        end  
        if abs(R(i+1,i+1) - R(i,i)) < eps_abs
                
            du = R(i+1,i+1);
            return
        end
    end
    
    if exist('du')== false
        throw( MException( 'MATLAB:invalid_output', ...
        'convergence not reached with richardson method' ) )
    
    end
end