function subpak_test043 ( )

%*****************************************************************************80
%
%% TEST043 tests R8COL_SWAP;
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
  fprintf ( 1, 'TEST043\n' );
  fprintf ( 1, '  For an R8COL, an array of column vectors;\n' );
  fprintf ( 1, '  R8COL_SWAP swaps two columns;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  r8mat_print ( m, n, a, '  The array:' );

  icol1 = 1;
  icol2 = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Swap columns %d and %d\n', icol1, icol2 );

  a = r8col_swap ( m, n, a, icol1, icol2 );

  r8mat_print ( m, n, a, '  The updated matrix:' );

  return
end
