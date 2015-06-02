function f = fx3 ( n, x )

%*****************************************************************************80
%
%% FX3 is the third 1D example.
%
%  Discussion:
%
%    The function should be plotted over [-1.0,+1.0].
%
%    Internally, this range is mapped to [-3.0,+3.0].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Polynomial fitting for edge detection in irregularly sampled signals 
%    and images,
%    SIAM Journal on Numerical Analysis,
%    Volume 43, Number 1, 2006, pages 259-279.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the arguments.
%
%    Output, real F(N,1), the function values.
%

%
%  Destroy all row vectors!
%
  x = x ( : );
%
%  Map from the convenient range [-1,+1] to the physical range [-3,+3].
%
  x = ( ( 1.0 - x ) * ( -3.0 )   ...
      + ( 1.0 + x ) * ( +3.0 ) ) ...
      /   2.0;

  f = zeros ( n, 1 );

  i = find ( -2.0 <= x & x <= -1.0 );
  f(i) = 1.0;

  j = find ( -0.5 <= x & x <= 0.5 );
  f(j) = 0.5 + 4.0 * ( x(j) + 0.5 ).^2;

  k = find ( 1.25 <= x & 3.0 * x <= 7.0 );
  f(k) = 3.0 * ( 2.0 - x(k) );

  return
end

