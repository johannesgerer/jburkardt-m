function subpak_test041 ( )

%*****************************************************************************80
%
%% TEST041 tests R8COL_MEAN and R8COL_SUM;
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
  fprintf ( 1, 'TEST041\n' );
  fprintf ( 1, '  For an R8COL, an array of column vectors;\n' );
  fprintf ( 1, '  R8COL_MEAN computes means;\n' );
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

  mean = r8col_mean ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Column  sum, mean:\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    fprintf ( 1, '  %3d  %10f  %10f\n', j, colsum(j), mean(j) );
  end

  return
end
