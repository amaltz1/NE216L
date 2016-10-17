% Euler's method

% heres an edit

% We are trying to numerically evaluate the solution of a
% first order ODE at some point x using an iterative method given 
% the first order ODE and some initial approximation of the function (x0, y0) . 
%
% Parameters
% ==========
%    f : A bivariate function handle of a first order ODE.

%    t_rng : The range of values at which Euler's/Heune's method would be evaluated at.
%    y0 : The initial value of the function at t0.

%    n : Number of points we will break the interval (t, t0) into.

% Return Values
% =============
%    t_out : The vector tout is a row vector of n equally spaced values ranging from t to t0.
%    y_out : The vector yout is row vector of n values that approximate 
%    the solution to the ODE at points t_out(2) to t_out of (n).
%    (Note: the first value is an approximation).

function [t_out, y_out] = euler(f, t_rng, y0, n)
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
        K = f(t_out(i),y_out(i));
        y_out(i+1) = y_out(i) + h*K;
        
    end
   
end