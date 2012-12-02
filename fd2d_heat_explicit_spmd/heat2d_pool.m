%% HEAT2D_POOL runs the HEAT2D example interactively with MATLABPOOL.
%

%
%  Read a black and white image which will be our "initial condition".
%
  x = imread ( 'surfsup.tif' );
%
%  Display the image.
%
  figure ( 1 )
  imshow ( x )
%
%  Get 4 "labs" to work on the job.
%
  matlabpool open local 4
  y = heat2d_fun ( x );
  matlabpool close
