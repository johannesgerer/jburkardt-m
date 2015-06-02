function f = fx4 ( n, x )

%*****************************************************************************80
%
%% FX4 is the fourth 1D example.
%
%  Discussion:
%
%    The function should be plotted over [0.0,+1.0].
%
%    The function is continuous, but the derivative has a discontinuity at 0.5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2013
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
%  Convert from -1 <= x <= 1 to 0 <= x <= 1:
%
  x = ( x + 1.0 ) / 2.0;

  f = zeros ( n, 1 );

  i = find ( x <= 0.5 );
  f(i) = - ( x(i) - 0.5 ) + sin ( 4.0 * pi * x(i) ) / 6.0;

  j = find ( 0.5 < x );
  f(j) =   ( x(j) - 0.5 ) + sin ( 4.0 * pi * x(j) ) / 6.0;

  return
end

