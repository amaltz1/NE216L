function [t_out, y_out] = dp45( f, t_rng, y0, h, eps_abs )
%% Function Explanation

%Approximates solution of a system of IVPs using a dynamic step size to reduce
%calculations while maintaining accuracy. The Dormant-Prince method uses a
%linear combination of seven slope values of the function to deliver an
%output with an O(h^4) error term.

%% Input and Output Variable Explanation
% f : IVP or system of IVPs to be solved. F can represent a higher order
% ODE by a change of variables.

% t_rng: range of t values that the IVP will be solved at

% y0: initial value or initial values of the function at t_rng(1). Must be
% a column vector, and all of its values must be scalars.

% h: initial step size, will be dynamically scaled

% eps_abs: minimum absolute error in approximation

% t_out: output of t values spaced by dynamic step size (h)

%y_out: output of y values found using dp45 algorithm. If the input is a
%system of N ODEs, y_out will be an Nxlength(t_out) matrix


%% Error checking
    
    [N, y0_cols] = size(y0); %y0 must be a column matrix
    if ~(y0_cols==1)
        throw( MException( 'MATLAB:invalid_argument', ...
        'y0 is not a column vector' ) );
    end
    if ~isa( f, 'function_handle' )
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument f is not a function handle' ) );
    end
    if ~all( size( t_rng ) == [1, 2] ) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument t_rng is not a 2-dimensional row vector' ) );
    end
    for i=1:length(y0) %all values within y0 must be scalar
        
        if ~isscalar( y0(i) ) 
            throw( MException( 'MATLAB:invalid_argument', ...
            'the argument  is not a scalar' ) );
        end
    end
    if ~isscalar( h ) || ~(h > 0)  
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument h is not a positive scalar' ) );
    end
    if ~isscalar( eps_abs ) || ~(eps_abs > 0)  
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument h is not a positive scalar' ) );
    end

%% Constant Integers and Matrices for Dormant-Prince Method

%Butcher tableau for Dormand-Prince method taken from slideshow page 83
A = [ 0          0         0        0         0        0   0; 
      1          0         0        0         0        0   0;
     1/4        3/4        0        0         0        0   0;
    11/9      -14/3      40/9       0         0        0   0;
  4843/1458 -3170/243  8056/729  -53/162      0        0   0;
  9017/3168  -355/33  46732/5247  49/176 -5103/18656   0   0;
    35/384       0      500/1113 125/192 -2187/6784  11/84 0]';

by = [5179/57600 0 7571/16695 393/640 -92097/339200 187/2100 1/40]';
bz = [  35/384   0  500/1113  125/192  -2187/6784    11/84    0]';

c = [0 1/5 3/10 4/5 8/9 1 1]';

n_K = 7; %Seven terms in Dormand-Prince method
%% Initialize Variables

% Initialize t_out and y_out as integers due to dynamic scaling
t_out = t_rng(1);
tf = t_rng(end);
y_out = y0;
% Initialize initial index to k = 1
k = 1;

K = zeros(N,n_K);%not (1,n_K) as we are solving N coupled ODEs


while t_out(k) < tf
    for m = 1:n_K
        K(:, m) = f(t_out(k) + h*c(m), y_out(:, k) + h*c(m)*K*A(:,m));
        %initialize  K matrix that is used to calculate y and z
    end

    %calculate y and z to see if h is an adequate value. For higher order ODEs,
    %we need to access the entire k'th column, rather than just one scalar 
    y = y_out(:, k) + h * K * by;
    z = y_out(:, k) + h * K * bz;
    
    
    s = ( (h * eps_abs) /(2*(t_rng(end) -t_rng(1)) * norm(y-z)))^(1/4); 
    %use norm instead to compare y and z, as they are vectors
    
    if s>=1 %if s>=1, continue on to next iteration
        y_out(:, k+1) = y; 
        t_out(k+1) = t_out(k) + h;
        k = k +1;
        if s>= 2 %if s>=2, still procede to next iteration but increase step size
            h = 2*h;
        end
    else
        h = h/2; %reduce h by half if size s is too small and repeat iteration with same k value
    end
    if t_out(k) + h > tf
        h = tf -t_out(k); %reduce h is its beyond the desired range
    end
        
 
end
end