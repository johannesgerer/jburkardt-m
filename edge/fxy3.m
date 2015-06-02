function f = fxy3 ( n, x, y )

%*****************************************************************************80
%
%% FXY3 is the third 2D example.
%
%  Discussion:
%
%    This is example 3.2 in the reference.
%
%    It is known as the modified two-dimensional Harten function.
%
%    It should be plotted on [-1,+1] x [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Determining the locations and discontinuities in the derivatives
%    of functions,
%    Applied Numerical Mathematics,
%    Volume 58, 2008, pages 577-592.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), Y(N), the arguments.
%
%    Output, real F(N,1), the function values.
%


%
%  Destroy all row vectors!
%
  x = x ( : );
  y = y ( : );
  f = zeros ( n, 1 );

  r(1:n) = ( 4.0 * x(1:n) .^ 2 + 4.0 * y(1:n) .^ 2 - 1.0 ) / 6.0;

  i = find ( 3.0 * r <= -1.0 );
  j = find ( -1.0 < 3.0 * r & 3.0 * r < 1.0 );
  k = find ( 1.0 <= 3.0 * r );

  f(i) = - r(i) .* sin ( 0.5 * pi * r(i) .^ 2 );
  f(j) = abs ( sin ( 2.0 * pi * r(j) ) );
  f(k) = 2.0 * r(k) - 1.0 - sin ( 3.0 * pi * r(k) ) / 6.0;

  return
end

