function subset_test078 ( )

%*****************************************************************************80
%
%% TEST078 tests MATRIX_PRODUCT_OPT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 6;
  rank = [ 4, 2, 3, 1, 2, 2, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST078\n' );
  fprintf ( 1, '  MATRIX_PRODUCT_OPT seeks the optimal order\n' );
  fprintf ( 1, '  for a chain of matrix products.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix ranks:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I    R    C\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %3d  %3d  %3d\n', i, rank(i), rank(i+1) );
  end

  [ cost, order ] = matrix_product_opt ( n, rank );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Optimal cost is %d\n', cost );

  i4vec_print ( n-1, order, '  Ordering:' );

  return
end
