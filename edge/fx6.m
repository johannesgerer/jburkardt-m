function f = fx6 ( n, x )

%*****************************************************************************80
%
%% FX6 is 1D example #6.
%
%  Discussion:
%
%    This is example 2.1 in the reference.
%
%    The function should be plotted over [0.0,+1.0].
%
%    The function has a discontinuous first derivative at 1/2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Rick Archibald, Anne Gelb, Jungho Yoon,
%    Determining the location of discontinuities in the derivatives
%    of functions,
%    Applied Numerical Mathematics,
%    Volume 58, 2008, pages 577-592.
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
  f = zeros ( n, 1 );

  f(1:n) = sin ( 2.0 * pi * x(1:n) ) / 6.0;
  i = find ( x < 0.5 );
  j = find ( 0.5 <= x );

  f(i) = f(i) - ( x(i) - 0.5 );
  f(j) = f(j) + ( x(j) - 0.5 );

  return
end

