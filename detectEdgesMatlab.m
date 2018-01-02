function e = detectEdgesMatlab(Img)
    if size(Img, 3) == 3        % check if the input is color, if so make grayscale.
        Img = rgb2gray(Img);
    end
    
    figure;
    e1 = edge(Img, 'sobel', 0.15, 'both');      % get edge map with sobel algorithm
    imshow(e1);                                 % show the result
    %figure;
    e2 = edge(Img, 'log', 0.01, 2.15);             % get edge map with log algorithm
    %imshow(e2);
    e = e1;                                     % return the preferred result, sobel.
end
