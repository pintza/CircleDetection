I = imread('coins.png'); % Built in Matlab image
EdgeMap1 = detectEdgesMatlab(I);
EdgeMap2 = detectEdgesConv(I);
HoughFindCircles(EdgeMap1);