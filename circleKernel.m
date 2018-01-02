function [A, C] = circleKernel(r)
    c = r+1;                    % save center point
    s = r.*2+1;                 % save the kernel size
    A = zeros(s, s);            % create zero matrix of size s
    C = 0;
    
    for i=1:s   
        for j=1:s  
            % check that the pixel is in the range of the ring
            if((i-c)^2+(j-c)^2 < r^2+1.5*r && (i-c)^2+(j-c)^2 > r^2-1.5*r) 
                A(i,j) = 1;     % mark the good pixels in 1 for circle kernel.
                C = C+1;        % sum the ones for normalizing.
            end
        end
    end  