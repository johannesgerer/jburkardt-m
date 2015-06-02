function polygon_grid_count_test ( )

%*****************************************************************************80
%
%% POLYGON_GRID_COUNT_TEST tests POLYGON_GRID_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_GRID_COUNT_TEST:\n' );
  fprintf ( 1, '  POLYGON_GRID_COUNT counts NG, the number of points in\n' );
  fprintf ( 1, '  a grid defined with N+1 points on each side of a\n' );
  fprintf ( 1, '  polygon of NV vertices.\n' );

  for nv = 3 : 5
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Polygonal vertex count NV = %d\n', nv );
    fprintf ( 1, '\n' );
    fprintf ( 1, '   N     NG\n' );
    fprintf ( 1, '\n' );
    for n = 0 : 5
      ng = polygon_grid_count ( n, nv );
      fprintf ( 1, '  %2d  %5d\n', n, ng );
    end
  end

  return
end

