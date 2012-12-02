function convex_hull ( prefix )

%*****************************************************************************80
%
%% CONVEX_HULL: an algorithm for the convex hull of a set of 2D points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONVEX_HULL:\n' );
  fprintf ( 1, '  MATLAB version.\n' );

  if ( nargin < 1 )
    prefix = 'random points'
    n = 25;
    xy = rand ( n, 2 );
  else
    node_filename = strcat ( prefix, '_nodes.txt' );
    xy = load ( node_filename );
  end
%
%  Plot the initial data.
%
  figure ( 1 )
  clf
  plot ( xy(:,1), xy(:,2), 'b.', 'MarkerSize', 20 );
  grid on
  axis tight
  axis equal
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( prefix );
%
%  Plot the convex hull as computed by MATLAB.
%
  figure ( 2 )
  clf
  k = convhull ( xy(:,1), xy(:,2) );
  plot ( xy(:,1), xy(:,2), 'b.', 'MarkerSize', 20 );
  hold on
  plot( xy(k,1), xy(k,2), 'r-', 'LineWidth', 2 );
  grid on
  axis tight
  axis equal
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( sprintf ( '%s by MATLAB convhull', prefix ) );
  hold off
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONVEX_HULL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
