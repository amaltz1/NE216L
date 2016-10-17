% richardson22
% You are trying to achieve a better approximation using linear combinations of %different divided formulas (center, forward, backward) which yield a very small error

%
% Parameters
% ==========
%    D: The function D takes a function u and two real-values, x and h, and it at the 
%    point x with the step size h and approximates the derivative of the function u
%    u: The function u is a real-valued function of a real variable x
%
%    x: Point of interest where derivative is being calculated
%    h: Small incremental step or step size
%
%    N_max: Max number of iterations, stopping criteria.
%    eps_abs: Smallest absolute difference in subsequent iterations, stopping
%        criteria
% Return Value
% ============
%    du: The scalar du is returned if abs(R(i-1,j-1) - R(i,j)) < eps_abs

function [du] = richardson22( D, u, x, h, N_max, eps_abs)
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
            R(i+1, j+1) = (4^j * R(i+1,j) - R(i,j))/(4^j-1);
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


            
    
    