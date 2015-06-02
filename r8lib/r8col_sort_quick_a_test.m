function r8col_sort_quick_a_test ( )

%*****************************************************************************80
%
%% R8COL_SORT_QUICK_A_TEST tests R8COL_SORT_QUICK_A.
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
  n = 10;

  b = 0.0;
  c = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8COL_SORT_QUICK_A_TEST\n' );
  fprintf ( 1, '  R8COL_SORT_QUICK_A sorts a table of columns.\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( m, n, b, c, seed );

  r8mat_print ( m, n, a, '  The unsorted matrix:' );

  a = r8col_sort_quick_a ( m, n, a );

  r8mat_print ( m, n, a, '  The sorted matrix:' );

  return
end
