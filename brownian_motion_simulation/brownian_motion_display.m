function brownian_motion_display ( m, n, x )

%*****************************************************************************80
%
%% BROWNIAN_MOTION_DISPLAY displays successive Brownian motion positions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%    M should be 1, 2 or 3.
%
%    Input, integer N, the number of time steps. 
%
%    Input, real X(M,N), the particle positions.
%
  if ( m == 1 )
    y(1,1:n) = ( 0 : n - 1 ) / ( n - 1 );
    clf
    hold on
    plot ( x(1,:), y(1,:), 'Color', 'b', 'LineWidth', 2 )
    plot ( x(1,1), y(1,1), 'g.', 'MarkerSize', 35 );
    plot ( x(1,n), y(1,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Time-->' )
    title ( 'Brownian motion simulation in 1D' )
%   axis equal
    hold off
  elseif ( m == 2 )
    clf
    hold on
    plot ( x(1,:), x(2,:), 'Color', 'b', 'LineWidth', 2 )
    plot ( x(1,1), x(2,1), 'g.', 'MarkerSize', 35 );
    plot ( x(1,n), x(2,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Y-->' )
    title ( 'Brownian motion simulation in 2D' )
    axis equal
    hold off
  elseif ( m == 3 )
    clf
    hold on
    plot3 ( x(1,:), x(2,:), x(3,:), 'Color', 'b', 'LineWidth', 2 )
    plot3 ( x(1,1), x(2,1), x(3,1), 'g.', 'MarkerSize', 35 );
    plot3 ( x(1,n), x(2,n), x(3,n), 'r.', 'MarkerSize', 35 );
    grid on
    xlabel ( '<--X-->' )
    ylabel ( '<--Y-->' )
    zlabel ( '<--Z-->' )
    title ( 'Brownian motion simulation in 3D' )
    axis equal
    view ( 3 )
    hold off
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BROWNIAN_MOTION_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  Cannot display data except for M = 1, 2, 3.\n' );
    return
  end

  filename = sprintf ( 'motion_%dd.png', m );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end

