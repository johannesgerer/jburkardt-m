function line_grid_test03 ( )

%*****************************************************************************80
%
%% LINE_GRID_TEST03 tries all the centering options.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    31 August 2014
%
%  Author:
%
%    John Burkardt
%
  n = 11;
  a =    0.0;
  b = +100.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_GRID_TEST03\n' );
  fprintf ( 1, '  Try the different centering options.\n' );
  fprintf ( 1, '  Number of grid points N = %d\n', n );

  for c = 1 : 5

    fprintf ( 1, '\n' );
    fprintf ( 1, '     N     C      A         B\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  %4d  %4d  %8.4f  %8.4f\n', n, c, a, b );

    x = line_grid ( n, a, b, c );
    r8vec_print ( n, x, '  Grid points:' );

  end

  return
end
