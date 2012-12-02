function triangle_grid_display ( ng, xy )

%*****************************************************************************80
%
%% TRIANGLE_GRID_DISPLAY displays grid points inside a triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NG, the number of grid points inside the triangle.
%
%    Input, real XY(2,NG), the grid points.
%
  scatter ( xy(1,:), xy(2,:), 'b.' );
  axis equal
  title ( sprintf ( '%d grid points inside a triangle', ng ) )
  grid on

  return
end
