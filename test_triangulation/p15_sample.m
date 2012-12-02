function [ point, seed ] = p15_sample ( m, n, seed )

%*****************************************************************************80
%
%% P15_SAMPLE samples points from the region in problem 15.
%
%  Discussion:
%
%    With a little bit of work, we can guarantee that we don't have to
%    use a rejection method.
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
  x1 = -8.0;
  x2 =  2.0;
  x3 = -2.0;
  x4 =  8.0;

  y1 = -1.0;
  y2 =  0.0;
  y3 =  0.0;
  y4 =  1.0;
%
%  Generate a batch of points in [0,1]x[0,1].
%
  [ point, seed ] = r8mat_uniform_01 ( m, n, seed );
%
%  Generate a batch of N probabilities.
%
  [ prob, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Map half the points into [X1,X2] x [Y1,Y2].
%
  i1 = find ( prob(1:n) < 0.5 );

  point(1,i1) = x1 + point(1,i1) * ( x2 - x1 );
  point(2,i1) = y1 + point(2,i1) * ( y2 - y1 );
%
%  Map the other points into [X3,X4] x [Y3,Y4].
%
  i2 = find ( 0.5 <= prob(1:n) );

  point(1,i2) = x3 + point(1,i2) * ( x4 - x3 );
  point(2,i2) = y3 + point(2,i2) * ( y4 - y3 );

  return
end
