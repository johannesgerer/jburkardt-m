function subpak_test0415 ( )

%*****************************************************************************80
%
%% TEST0415 tests R8COL_PERMUTE.
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
  n = 5;

  perm = [ 2, 4, 5, 1, 3 ];
  a = [ ...
    11.0, 21.0, 31.0;
    12.0, 22.0, 32.0;
    13.0, 23.0, 33.0;
    14.0, 24.0, 34.0;
    15.0, 25.0, 35.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0415\n' );
  fprintf ( 1, '  R8COL_PERMUTE permutes an R8COL in place.\n' );

  r8mat_print ( m, n, a, '  A (Unpermuted):' );

  i4vec_print ( n, perm, '  The (column) permutation vector:' );

  a = r8col_permute ( m, n, a, perm );

  r8mat_print ( m, n, a, '  A (Permuted):' );

  return
end
