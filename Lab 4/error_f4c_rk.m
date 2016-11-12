function [abs_error] = error_f4c_rk(n)
    [tvals, yvals] = rk4( @f4c, [0, 1], 1, n );
     abs_error = abs(yvals(end) - 2.604215099096980); %difference from analytical value
end