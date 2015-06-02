function wedge_grid_test01 ( )

%*****************************************************************************80
%
%% WEDGE_GRID_TEST01 tests WEDGE_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2014
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDGE_GRID_TEST01\n' );
  fprintf ( 1, '  WEDGE_GRID can define a grid of points\n' );
  fprintf ( 1, '  with N+1 points on a side\n' );
  fprintf ( 1, '  over the interior of the unit wedge in 3D.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Grid order N = %d\n', n );

  ng = wedge_grid_size ( n );

  fprintf ( 1, '  Grid count NG = %d\n', ng );

  g = wedge_grid ( n, ng );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     J      X                Y               Z\n' );
  fprintf ( 1, '\n' );
  for j = 1 : ng
    fprintf ( 1, '  %4d  %14.6g  %14.6g  %14.6g\n', j, g(1:3,j) );
  end

  output_filename = 'wedge_grid.xy';

  output_unit = fopen ( output_filename, 'wt' );
  for j = 1 : ng
    fprintf ( output_unit, '%g  %g  %g\n', g(1:3,j) );
  end
  fclose ( output_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data written to "%s"\n', output_filename );

  return
end

