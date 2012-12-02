function ball_grid_display ( ng, xy )

%*****************************************************************************80
%
%% BALL_GRID_DISPLAY displays grid points inside a ball.
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
%    Input, integer NG, the number of grid points inside the ball.
%
%    Input, real XY(3,NG), the grid points.
%
  scatter3 ( xy(1,:), xy(2,:), xy(3,:), 'b.' );
  axis equal
  title ( sprintf ( '%d grid points inside a ball', ng ) )
  grid on

  return
end
