function [ point, seed ] = p12_sample ( m, n, seed )

%*****************************************************************************80
%
%% P12_SAMPLE samples points from the region in problem 12.
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
  x1 = 0.000;
  x2 = 0.500;
  x3 = 0.625;
  x4 = 1.000;
  y1 = 0.000;
  y2 = 0.250;
  y3 = 0.375;
  y4 = 1.000;

  area1 = ( x2 - x1 ) * ( y4 - y1 );
  area2 = ( x3 - x2 ) * ( y3 - y2 );
  area3 = ( x4 - x3 ) * ( y4 - y1 );

  area = area1 + area2 + area3;

  p1 =   area1                   / area;
  p2 = ( area1 + area2 )         / area;
%
%  Generate a batch of points in [0,1]x[0,1].
%
  [ point, seed ] = r8mat_uniform_01 ( m, n, seed );
%
%  Generate a batch of N probabilities.
%
  [ prob, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Map some points into [X1,X2] x [Y1,Y4].
%
  i1 = find ( prob(1:n) <= p1 );

  point(1,i1) = x1 + point(1,i1) * ( x2 - x1 );
  point(2,i1) = y1 + point(2,i1) * ( y4 - y1 );
%
%  Map points into [X2,X3] x [Y2,Y3].
%
   i2 = find ( p1 <= prob(1:n) & prob(1:n) <= p2 );

  point(1,i2) = x2 + point(1,i2) * ( x3 - x2 );
  point(2,i2) = y2 + point(2,i2) * ( y3 - y2 );
%
%  Map points into [X3,X4] x [Y1,Y4].
%
  i3 = find ( p2 <= prob(1:n) );

  point(1,i3) = x3 + point(1,i3) * ( x4 - x3 );
  point(2,i3) = y1 + point(2,i3) * ( y4 - y1 );

  return
end
