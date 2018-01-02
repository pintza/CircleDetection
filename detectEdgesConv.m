function [newmap e1] = detectEdgesConv(Img)
    if size(Img, 3) == 3        % check if the input is color, if so make grayscale.
        Img = rgb2gray(Img);
    end
    
    s1 = [-1 -2 -1 ; 0 0 0 ; 1 2 1];    % sobel kernel
    s2 = [-1 0 1 ; -2 0 2 ; -1 0 1];    % sobel kernel
    h1 = conv2(Img, s1, 'same');        % convolution for first kernel
    h2 = conv2(Img, s2, 'same');        % convolution for second kernel
    figure;                             % figure for presenting the result 
    e1 = sqrt(h1.^2+h2.^2);             % create gardient map
    newmap = ((e1 > 380));              % mark 1 for pixels with strong gardiend, 0 otherwise.
    imshow(newmap)                      % show the result
