function i4lib_test28 ( )

%*****************************************************************************80
%
%% TEST28 tests I4COL_SORT2_A;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 6;
  n = 4;

  b = 0;
  c = 20;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST28\n' );
  fprintf ( 1, '  For a rectangular integer matrix:\n' );
  fprintf ( 1, '  I4COL_SORT2_D sorts the elements of the columns.\n' );

  [ a, seed ] = i4mat_uniform_ab ( m, n, b, c, seed );

  i4mat_print ( m, n, a, '  The matrix:' );

  a = i4col_sort2_a ( m, n, a );

  i4mat_print ( m, n, a, '  The element-sorted column matrix:' );

  return
end
