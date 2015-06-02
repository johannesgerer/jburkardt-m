function f = fxy2 ( n, x, y )

%*****************************************************************************80
%
%% FXY2 is the second 2D example.
%
%  Discussion:
%
%    This is example 4.2 in the reference.
%
%    It is known as the Shepp-Logan phantom.
%
%    It should be plotted on [-1,+1] x [-1,+1].
%
%    Note that the Archibald reference incorrectly describes the divisor
%    of x in the second ellipse as 0.06624, when it should be 0.6624.
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
%    Larry Shepp, Ben Logan,
%    The Fourier reconstruction of a head section,
%    IEEE Transactions on Nuclear Science,
%    Volume  NS-21, June 1974, pages 21-43.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), Y(N), the arguments.
%
%    Output, real F(N,1), the function values.
%
%  Local parameters:
%
%    Local, integer CHOICE:
%    1, use Archibald's (and Shepp and Logan's) level values;
%    2, use Matlab's level values;
%    3, use Matlab's enhanced contrast level values.
%

%
%  Destroy all row vectors!
%
  x = x ( : );
  y = y ( : );

  choice = 3;

  if ( choice == 1 )
    c = [ 2.0, -0.98, -0.02, +0.01 ];
  elseif ( choice == 2 )
    c = [ 1.0, -0.98, -0.02, +0.01 ];
  else
    c = [ 1.0, -0.8, -0.2, +0.1 ];
  end

  f = zeros ( n, 1 );

  xi1  =   ( x - 0.22 ) * cos ( 0.4 * pi ) + y * sin ( 0.4 * pi );
  eta1 = - ( x - 0.22 ) * sin ( 0.4 * pi ) + y * cos ( 0.4 * pi );

  xi2  =   ( x + 0.22 ) * cos ( 0.6 * pi ) + y * sin ( 0.6 * pi );
  eta2 = - ( x + 0.22 ) * sin ( 0.6 * pi ) + y * cos ( 0.6 * pi );

  i = find ( ( x / 0.69 ).^2 + ( y / 0.92 ).^2 <= 1.0 );
  f(i) = f(i) + c(1);

  i = find ( ( x / 0.6624 ).^2 + ( ( y + 0.0184 ) / 0.874 ).^2 <= 1.0 );
  f(i) = f(i) + c(2);

  i = find ( ( ( xi1 / 0.31 ).^2 + ( eta1 / 0.11 ).^2 <= 1.0 ) | ...
             ( ( xi2 / 0.41 ).^2 + ( eta2 / 0.16 ).^2 <= 1.0 ) );
  f(i) = f(i) + c(3);

  i = find ( ( ( ( x - 0.35 ) / 0.3   ).^2 + (   y           / 0.6   ).^2 <= 1.0 ) | ...
             ( (   x          / 0.21  ).^2 + ( ( y - 0.35  ) / 0.25  ).^2 <= 1.0 ) | ...
             ( (   x          / 0.046 ).^2 + ( ( y - 0.1   ) / 0.046 ).^2 <= 1.0 ) | ...
             ( (   x          / 0.046 ).^2 + ( ( y + 0.1   ) / 0.046 ).^2 <= 1.0 ) | ...
             ( ( ( x + 0.08 ) / 0.046 ).^2 + ( ( y + 0.605 ) / 0.023 ).^2 <= 1.0 ) | ...
             ( (   x          / 0.023 ).^2 + ( ( y + 0.605 ) / 0.023 ).^2 <= 1.0 ) | ...
             ( ( ( x - 0.06 ) / 0.023 ).^2 + ( ( y + 0.605 ) / 0.023 ).^2 <= 1.0 ) );
  f(i) = f(i) + c(4);

  return
end

