function [du] = richardson23( D, u, x, h, N_max, eps_abs )
    % validates all parameters
    if ~isscalar( x ) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument x is not a scalar' ) );
    end
    
    if ~isscalar( h ) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument h is not a scalar' ) );
    end

    if ~isscalar( eps_abs ) || (eps_abs <= 0) 
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument eps_abs is not a positive scalar' ) );
    end

    if ~isscalar( N_max ) || (N_max ~= round( N_max )) ||(N_max <= 0)  
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument N_max is not an integer' ) );
    end

    if ~isa( u, 'function_handle' )
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument u is not a function handle' ) );
    end
    
    if ~isa( D, 'function_handle' )
        throw( MException( 'MATLAB:invalid_argument', ...
        'the argument D is not a function handle' ) );
    end
    
    % computes richardson extrapolation
    
    %Creates a N by N matrix of all zeros (the max amount of 
    %space needed to store till max iterations).
    matrix_R = zeros(N_max+1);
    
    %compute nested loop for rows and columns
    for i=1:(N_max+1)
        for j=1:i
            %Computes the first row first column 
            %differential using parameters given.
            if j==1
                matrix_R(i,j)= D(u,x,h/(2^(i-1)));
            %Compute the using formula of row i, and column j, row  
            %by row until row = column before moving to next row.
            else
                matrix_R(i,j)= ((4^(j-1)*matrix_R(i,j-1)-matrix_R(i-1,j-1))/(4^(j-1)-1));
            end
        end
        %In each iteration before moving to next row, compare row 
        %with N_max, if N_max is row number, return the value (notifying 
        %max iterations reached), and compare value in matrix (i,j) with 
        %value in matrix (i-1, j-1) and if the absolute difference is less 
        %than eps_abs than stop and return last value in matrix (notifying 
        %the script has converged).
        if i==(N_max+1) && abs(matrix_R(i,i)-matrix_R(i-1,i-1))>eps_abs
            throw( MException( 'MATLAB:invalid_argument', ...
        'Max iterations reached, did not converge.' ) );
        elseif i>1 && abs(matrix_R(i,i)-matrix_R(i-1,i-1))<eps_abs
            du=matrix_R(i,i);
            return;
        end
    end
end