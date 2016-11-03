function [t_out, y_out] = dp45( f, t_rng, y0, h, eps_abs )
%% Function Explanation

%Approximates solution of an IVP using a dynamic step size to reduce
%calculations while maintaining accuracy. The Dormant-Prince method uses a
%linear combination of seven slope values of the function to deliver an
%output with an O(h^4) error term.

%% Input and Output Variable Explanation



%% Error caching



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
t_out = t_rng(0);
tf = t_rng(end);
y_out = y0;
% Initialize initial index to k = 1
k = 1;

K = zeros(1,n_K);


while t_out(k) < tf
    for m = 1:n_K
        K(m) = f(t_out(k) + h*c(m), y_out(k) + h*c(m)*K*A(m,:));
        %initialize 1 x 7 K matrix that is used to calculate y and z
    end
    %calculate y and z to see if h is an adequate value
    y = y_out(k) + h * K * by;
    z = z_out(k) + h * K * bz;
    %calculate s to see if h needs to be rescaled based on slideshow pg79
    s = ( (h * eps_abs) /(2*(t_rng(end) -t_rng(1)) * abs(y-z)))^(1/4);
    if s>=1 %if s>=1, continue on to next iteration
        y_out(k+1) = y; 
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
