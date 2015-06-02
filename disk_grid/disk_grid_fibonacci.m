function g = disk_grid_fibonacci ( n, r, c )

%*****************************************************************************80
%
%% DISK_GRID_FIBONACCI computes Fibonacci grid points inside a disk.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Swinbank, James Purser,
%    Fibonacci grids: A novel approach to global modelling,
%    Quarterly Journal of the Royal Meteorological Society,
%    Volume 132, Number 619, July 2006 Part B, pages 1769-1793.
%
%  Parameters:
%
%    Input, integer N, the number of points desired.
%
%    Input, real R, the radius of the disk.
%
%    Input, real C(2), the coordinates of the center of the disk.
%
%    Output, real G(2,N), the grid points.
%
  r0 = r / sqrt ( n - 0.5 );
  phi = ( 1.0 + sqrt ( 5.0 ) ) / 2.0;

  i = 1 : n;

  gr = r0 * sqrt ( i - 0.5 );
  gt = 2.0 * pi * i / phi;

  g = zeros ( 2, n );

  g(1,1:n) = c(1);
  g(1,1:n) = g(1,1:n) + gr .* cos ( gt );
  g(2,1:n) = c(2);
  g(2,1:n) = g(2,1:n) + gr .* sin ( gt );

  return
end
