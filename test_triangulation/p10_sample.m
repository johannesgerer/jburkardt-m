function [ point, seed ] = p10_sample ( m, n, seed )

%*****************************************************************************80
%
%% P10_SAMPLE samples points from the region in problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real POINT(M,N), the coordinates of the points.
%
%    Output, integer SEED, a seed for the random number generator.
%
  x1 =  0.0;
  x2 = +1.0;
  y1 =  0.0;
  y2 = +1.0;
%
%  Generate a batch of points in [0,1]x[0,1].
%
  [ point, seed ] = r8mat_uniform_01 ( m, n, seed );
%
%  Remap the points to the box [X1,X2] x [Y1,Y2].
%
  point(1,1:n) = x1 + point(1,1:n) * ( x2 - x1 );
  point(2,1:n) = y1 + point(2,1:n) * ( y2 - y1 );

  return
end
