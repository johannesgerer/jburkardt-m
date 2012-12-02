function ellipsoid_grid_display ( ng, xy )

%*****************************************************************************80
%
%% ELLIPSOID_GRID_DISPLAY displays grid points inside an ellipsoid.
%
%  Discussion:
%
%    The ellipsoid is specified as
%
%      ( ( X - C1 ) / R1 )^2
%    + ( ( Y - C2 ) / R2 )^2 
%    + ( ( Z - C3 ) / R3 )^2 = 1
%
%    The user supplies a number N.  There will be N+1 grid points along
%    the shortest axis.
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
%    Input, integer NG, the number of grid points inside the ellipsoid.
%
%    Input, real XY(3,NG), the grid points.
%
  scatter3 ( xy(1,:), xy(2,:), xy(3,:), 'b.' );
  axis equal
  title ( sprintf ( '%d grid points inside an ellipsoid', ng ) )
  grid on

  return
end
