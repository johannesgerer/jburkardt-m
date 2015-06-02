function simplex_grid_test02 ( )

%*****************************************************************************80
%
%% SIMPLEX_GRID_TEST02 tests SIMPLEX_GRID_INDEX_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_GRID_TEST02:\n' );
  fprintf ( 1, '  SIMPLEX_GRID_INDEX_NEXT lists, one by one, the indices\n' );
  fprintf ( 1, '  of a simplex grid that uses N+1 points on a side, \n' );
  fprintf ( 1, '  in an M-dimensional simplex.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #:  1  2  3  (*)\n' );
  fprintf ( 1, '\n' );

  m = 3;
  n = 3;

  j = 0;
  g = zeros ( m + 1, 1 );
  g(m+1) = n;
  
  while ( 1 )

    fprintf ( 1, '  %2d:', j );
    for i = 1 : m
      fprintf ( 1, ' %2d', g(i) );
    end
    fprintf ( 1, ' (%2d)\n', g(m+1) );

    if ( g(1) == n )
      break
    end

    g = simplex_grid_index_next ( m, n, g );

    j = j + 1;

  end

  return
end
