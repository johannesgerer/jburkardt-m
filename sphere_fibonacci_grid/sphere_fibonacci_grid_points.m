function xg = sphere_fibonacci_grid_points ( ng )

%*****************************************************************************80
%
%% SPHERE_FIBONACCI_GRID_POINTS: Fibonacci spiral gridpoints on a sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 April 2015
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
%    Input, odd integer NG, the number of points.
%
%    Output, real XG(N,3), the grid points.
%

  validateattributes(ng, {'numeric'}, {'odd', 'nonnegative'});

  phi = ( 1.0 + sqrt ( 5.0 ) ) / 2.0;
  
  N = round(ng/2)-1; % resolution, analogous to N in the paper
  i = ( -N : 1 : N )';
  
  theta = 2 * pi * i / phi;
  sphi = 2 * i / ( 2 * N + 1 );
  cphi = sqrt ( ( N + i ) .* ( N - i ) ) / N;

  xg = zeros ( ng, 3 );

  xg(1:ng,1) = cphi .* sin ( theta );
  xg(1:ng,2) = cphi .* cos ( theta );
  xg(1:ng,3) = sphi;

  return
end
