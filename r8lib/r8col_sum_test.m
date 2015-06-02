function r8col_sum_test ( )

%*****************************************************************************80
%
%% R8COL_SUM_TEST tests R8COL_SUM;
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
  fprintf ( 1, 'R8COL_SUM_TEST\n' );
  fprintf ( 1, '  For an R8COL, an array of column vectors;\n' );
  fprintf ( 1, '  R8COL_SUM computes sums;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  r8mat_print ( m, n, a, '  The array:' );

  colsum = r8col_sum ( m, n, a );

  r8vec_print ( n, colsum, '  The column sums:' );

  return
end
