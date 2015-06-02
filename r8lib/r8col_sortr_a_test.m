function r8col_sortr_a_test ( )

%*****************************************************************************80
%
%% R8COL_SORTR_A_TEST tests R8COL_SORTR_A.
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
  m = 10;
  n = 3;

  b = 0.0;
  c = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8COL_SORTR_A_TEST\n' );
  fprintf ( 1, '  R8COL_SORTR_A is given an array, and reorders\n' );
  fprintf ( 1, '  it so that a particular column is sorted.\n' );
  fprintf ( 1, '\n' );
 
  key = 2;
  fprintf ( 1, '  Here, the special column is %d\n', key );
 
  seed = 123456789;

  [ a, seed ] = r8mat_uniform_ab ( m, n, b, c, seed );
 
  r8mat_print ( m, n, a, '  Unsorted array:' );
 
  a = r8col_sortr_a ( m, n, a, key );
 
  r8mat_print ( m, n, a, '  Sorted array:' );
 
  return
end
