function f = fxy1 ( n, x, y )

%*****************************************************************************80
%
%% FXY1 is the first 2D example.
%
%  Discussion:
%
%    This is example 4.1 in the reference.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2013
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

  i = find ( 0.25 < x(:).^2 + y(:).^2 );

  f    = x(:) .* y(:) + cos ( 2.0 * pi * x(:).^2 ) - sin ( 2.0 * pi * x(:).^2 );
  f(i) = f(i) + 10.0 * x(i) - 5.0;

  return
end

