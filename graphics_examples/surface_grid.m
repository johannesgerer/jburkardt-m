function surface_grid ( )

%*****************************************************************************80
%
%% SURFACE_GRID uses MATLAB to draw a surface from a table Z(X,Y).
%
%  Discussion:
%
%    Here, the grid is a 41x41 array of equally spaced points in [-2,2]x[-2,2].
%
%      x = linspace ( -2.0, +2.0, 41 );
%      y = linspace ( -2.0, +2.0, 41 );
%      [ X, Y ] = meshgrid ( x, y );
%
%    and Z(X,Y) is a function which can be evaluated in MATLAB by:
%
%      Z = exp ( - ( X.^2 + Y.^2 ) ) ...
%       .* cos ( 0.25 * X ) ...
%       .* sin ( Y ) ...
%       .* cos ( 2 * (X.^2 + Y.^2 ) );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SURFACE_GRID:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Make a surface plot Z(X,Y) for a 41x41 table.\n' );

  xyz = load ( 'surface_grid.txt' );

  x = reshape ( xyz(:,1), 41, 41 );
  y = reshape ( xyz(:,2), 41, 41 );
  z = reshape ( xyz(:,3), 41, 41 );

  surf ( x, y, z, ...
    'EdgeColor', 'none', ...
    'FaceColor', 'interp' );

  title ( 'Surface plot of 41x41 table Z(X,Y)' )
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<--- Z --->' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SURFACE_GRID:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
