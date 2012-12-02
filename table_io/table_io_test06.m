function table_io_test06 ( )

%*****************************************************************************80
%
%% TABLE_IO_TEST06 tests I4MAT_BORDER_ADD and I4MAT_BORDER_CUT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2006
%
%  Author:
%
%    John Burkardt
%
  m = 6;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  I4MAT_BORDER_CUT cuts off the border;\n' );
  fprintf ( 1, '  I4MAT_BORDER_ADD adds a zero border;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M = %d\n', m );
  fprintf ( 1, '  Number of points N  = %d\n', n );

  table = i4mat_indicator ( m, n );

  i4mat_print ( m, n, table, '  Initial dataset:' );

  table2 = i4mat_border_cut ( m, n, table );

  i4mat_print ( m-2, n-2, table2, '  "Cut" dataset:' );

  table3 = i4mat_border_add ( m-2, n-2, table2 );

  i4mat_print ( m, n, table3, '  "Added" dataset:' );

  return
end
