function hypercube_grid_test01 ( )

%*****************************************************************************80
%
%% HYPERCUBE_GRID_TEST01 tests HYPERCUBE_GRID on a two dimensional example.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    28 August 2014
%
%  Author:
%
%    John Burkardt
%
  m = 2;

  a = [ 0.0, 0.0 ];
  b = [ 1.0, 10.0 ];
  c = [ 2, 4 ];
  ns = [ 4, 5 ];

  n = prod ( ns(1:m) );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERCUBE_GRID_TEST01\n' );
  fprintf ( 1, '  Create a grid using HYPERCUBE_GRID.\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of grid points N = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    NS     C      A         B\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %4d  %4d  %4d  %8.4f  %8.4f\n', i, ns(i), c(i), a(i), b(i) );
  end

  x = hypercube_grid ( m, n, ns, a, b, c );
  r8mat_transpose_print ( m, n, x, '  Grid points:' );

  return
end

