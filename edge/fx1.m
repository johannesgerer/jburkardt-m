function f = fx1 ( n, x )

%*****************************************************************************80
%
%% FX1 is the first 1D example.
%
%  Discussion:
%
%    This is example 3.1 in the reference.
%
%    The function should be plotted over [-1.0,+1.0].
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
%  Local parameters:
%
%    Local, real STEEP, controls the steepness of the slope.
%    The default value is a moderate 5.  For a sharp rise, use 25 instead.  
%

%
%  Destroy all row vectors!
%
  x = x ( : );

  steep = 5.0;

  f = zeros ( n, 1 );

  i = find ( x < 0.0 );
  f(i) = cos ( 3.0 * pi * x(i) );

  j = find (     0.0 <= x );
  f(j) = -1.0 + 2.0 ./ ( 1.0 + 3.0 * exp ( - steep * ( 2.0 * x(j) - 1.0 ) ) );

  return
end

