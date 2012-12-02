function subpak_test107 ( )

%*****************************************************************************80
%
%% TEST107 tests R8ROW_SWAP;
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
  fprintf ( 1, 'TEST107\n' );
  fprintf ( 1, '  For a R8ROW (a matrix regarded as rows):\n' );
  fprintf ( 1, '  R8ROW_SWAP swaps two rows;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  r8mat_print ( m, n, a, '  The original matrix:' );

  row1 = 1;
  row2 = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Swap rows %d and %d\n', row1, row2 );

  a = r8row_swap ( m, n, a, row1, row2 );

  r8mat_print ( m, n, a, '  The modified matrix:' );

  return
end
