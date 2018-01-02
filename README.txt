This is a MATLAB piece of code that can find circles in a given image and returm them marked and their locations in the picture.
The process is being done with convolution on the picture with circular kernel for higher efficiency.

circleKernel - a function that creates a circular kernel for the r (radius) that is given as parameter.

detectEdgesMatlab - a function that gets an image and creates an edge map using built in MATLAB edge function.

detectEdgesConv - a function that gets an image and creates an edge map using convolution with Sobel kernel (no MATLAB functions).

HoughFindCircles - a function that gets an edge map and find all circles in it. uses the previous function described.
		This function has a var named threshold that may be changed for better (or worse) results. you may play with it.

main is a piece of code that takes the MATLAB built in picture 'coins.png' and uses all the functions above for finding circles in it.
you may change the picture path to whatever you like and check it out!
