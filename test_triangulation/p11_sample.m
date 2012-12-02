function [ point, seed ] = p11_sample ( m, n, seed )

%*****************************************************************************80
%
%% P11_SAMPLE samples points from the region in problem 11.
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
  x1 = 0.0;
  x2 = 0.5;
  x3 = 1.0;

  y1 = 0.0;
  y2 = 0.5;
  y3 = 1.0;

  area = ( x3 - x1 ) * ( y3 - y1 ) - ( x3 - x2 ) * ( y3 - y2 );
%
%  Generate a batch of points in [0,1]x[0,1].
%
  [ point, seed ] = r8mat_uniform_01 ( m, n, seed );
%
%  Generate a batch of N probabilities.
%
  [ prob, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Map some points into [X1,X2] x [Y1,Y3].
%
  i1 = find ( prob(1:n) < ( x2 - x1 ) * ( y3 - y1 ) / area );

  point(1,i1) = x1 + point(1,i1) * ( x2 - x1 );
  point(2,i1) = y1 + point(2,i1) * ( y3 - y1 );

  i2 = find ( prob(1:n) >= ( x2 - x1 ) * ( y3 - y1 ) / area );

  point(1,i2) = x2 + point(1,i2) * ( x3 - x2 );
  point(2,i2) = y1 + point(2,i2) * ( y2 - y1 );

  return
end
