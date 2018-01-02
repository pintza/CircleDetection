function [houghMap, normMap, C] = HoughFindCircles(map)
    
    % circle detection threshold.
    % change it and check the results.
    threshold = 0.4;                        

    
    h = size(map, 1);       % save img height
    w = size(map, 2);       % save img width
    collection = [];        % create empty array for good pixels
    minR = 5;               % assign min radius for the loop
    maxR = 1/2*min(h,w);    % assign max radius for the loop
    circles = [];           % array for found circles locations.
    
    
    for r = minR:maxR
        [K, C] = circleKernel(r);               % K = circle kernel of current radius. C = sum of ones in K.
        houghMap = conv2(map, K, 'same');   
        normMap = houghMap./C;                  % normalize the result with C. normMap is [0,1].
        CenterMap = (normMap > threshold);      % save only pixels above threshold.
        
        for i=1:h                         
            for j=1:w
                if CenterMap(i, j) > 0          % if the value is not 0 (above threshold)
                    collection = [collection; [sqrt(i^2+j^2) i j r]];   % add a new center point to the collection.
                end
            end
        end
        
    end
    
    
    % here we will iterate sorted collection of pixels that are center of
    % circles. because the collection contains a few pixels for the same
    % circle, we will sort the dots by norm and make an average of the
    % pixels belongs to each circle.
    collection = sortrows(collection);      % sort the possible points by norm (first value in the vector)
    figure;
    imshow('coins.png');    % show original img
    aveX=collection(1, 2);  % take the first X
    aveY=collection(1, 3);  % take the first Y
    aveR=collection(1, 4);  % take the first R
    aveSum=1;               % set the average counter to 1
    
    for i=2:size(collection, 1)     % iterate all possible points.
        X = collection(i, 2);
        Y = collection(i, 3);
        R = collection(i, 4);
        if sqrt((X-aveX)^2 + (Y-aveY)^2) < aveR     % if current pixel is part of average circle
            aveSum = aveSum+1;                      % add values to average.
            aveX = ((aveSum-1)*aveX+X)/aveSum;
            aveY = ((aveSum-1)*aveY+Y)/aveSum;
            aveR = ((aveSum-1)*aveR+R)/aveSum;
        else                                        % else
            circles = [circles ; aveX aveY aveR];   % average circle is added to circles and move to the next circle.
            viscircles([aveY aveX], aveR, 'Color', 'b'); % draw the found circle on the picture
            aveY = Y;       % start a new average for next circle.
            aveX = X;
            aveR = R;
            aveSum=1; 
        end
    end
    viscircles([aveY aveX], aveR, 'Color', 'b');    % draw last circle in collections.



    
    