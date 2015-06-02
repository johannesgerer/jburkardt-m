function voronoi_mountains_test ( )

%*****************************************************************************80
%
%% VORONOI_MOUNTAINS_TEST tests the VORONOI_MOUNTAINS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VORONOI_MOUNTAINS_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the VORONOI_MOUNTAINS library.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given a set of points P,\n' );
  fprintf ( 1, '  create the Voronoi diagram for P,\n');
  fprintf ( 1, '  Then for each point (X,Y) in the plane,\n' );
  fprintf ( 1, '  define Z(X,Y) to be the distance to the nearest P.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This defines a 3D surface, which, viewed upside down,\n' );
  fprintf ( 1, '  is a series of mountains.\n' );
  fprintf ( 1, '  Each point P is a peak.\n' );
  fprintf ( 1, '  The edges of the Voronoi diagram are valleys.\n' );
  fprintf ( 1, '  They are straight in the XY direction, but parabolic in Z.\n' );
  fprintf ( 1, '  Three valleys meet at each Voronoi vertex.\n' );

  fprintf ( 1, '\n' );
  n = input ( 'Enter the number of generators (10 or 20 is plenty)' );

  if ( n == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VORONOI_MOUNTAINS_TEST:\n' );
    fprintf ( 1, '  The input value N = 0 is interpreted as a request.\n' );
    fprintf ( 1, '  to use the dataset "diamond.txt".\n' );
    p = load ( 'diamond.txt' );
  elseif ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VORONOI_MOUNTAINS_TEST:\n' );
    fprintf ( 1, '  The input value N = %d is interpreted as a request to stop.\n', n );
    return
  else
    p = rand ( n, 2 );
  end

  voronoi_mountains ( p );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VORONOI_MOUNTAINS_TEST:\n' );
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
