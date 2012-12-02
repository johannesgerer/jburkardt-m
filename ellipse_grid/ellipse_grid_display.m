function ellipse_grid_display ( ng, xy )

%*****************************************************************************80
%
%% ELLIPSE_GRID_DISPLAY displays grid points inside an ellipse.
%
%  Discussion:
%
%    The ellipse is specified as
%
%      ( ( X - C1 ) / R1 )^2 + ( ( Y - C2 ) / R2 )^2 = 1
%
%    The user supplies a number N.  There will be N+1 grid points along
%    the shorter axis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NG, the number of grid points inside the ellipse.
%
%    Input, real XY(2,NG), the grid points.
%
  scatter ( xy(1,:), xy(2,:), 'b.' );
  axis equal
  title ( sprintf ( '%d grid points inside an ellipse', ng ) )
  grid on

  return
end
