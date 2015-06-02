function f = fx2 ( n, x )

%*****************************************************************************80
%
%% FX2 is the second 1D example.
%
%  Discussion:
%
%    The function should be plotted over [-1,+1].
%
%    The "internal" coordinate range will be [-2.0,6.0*pi].
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

  f = zeros ( n, 1 );
%
%  Map from the convenient range [-1,+1] to the physical range [-2,6pi].
%
  x = ( ( 1.0 - x ) * ( - 2.0 )   ...
      + ( 1.0 + x ) * 6.0 * pi ) ...
      /   2.0;

  i = find ( x < 0.0 );
  f(i) = exp ( x(i) );

  j = find (     0.0 <= x & x < 3.0 * pi / 2.0 );
  f(j) = - exp ( - x(j) );

  k = find (                    3.0 * pi / 2.0 <= x );
  f(k) = -1.5 * sin ( x(k) );

  return
end

