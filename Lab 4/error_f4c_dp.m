function [abs_error,tvals_len] = error_f4c_dp(error_param)
    [tvals, yvals] = dp45( @f4c, [0, 1], 1, 0.1, error_param);
     abs_error = abs(yvals(end) - 2.604215099096980); %difference from analytical value
    tvals_len = length(tvals);
end