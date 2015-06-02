function r8col_swap_test ( )

%*****************************************************************************80
%
%% R8COL_SWAP_TEST tests R8COL_SWAP;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 3;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8COL_SWAP_TEST\n' );
  fprintf ( 1, '  For an R8COL, an array of column vectors;\n' );
  fprintf ( 1, '  R8COL_SWAP swaps two columns;\n' );

  a = r8mat_indicator ( m, n );

  r8mat_print ( m, n, a, '  The array:' );

  icol1 = 1;
  icol2 = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Swap columns %d and %d\n', icol1, icol2 );

  a = r8col_swap ( m, n, a, icol1, icol2 );

  r8mat_print ( m, n, a, '  The updated matrix:' );

  return
end
