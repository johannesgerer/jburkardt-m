function i4lib_test37 ( )

%*****************************************************************************80
%
%% TEST37 tests I4ROW_MEAN and I4ROW_SUM;
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
  m = 3;
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST37\n' );
  fprintf ( 1, '  I4ROW_MEAN computes row means;\n' );
  fprintf ( 1, '  I4ROW_SUM computes row sums;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  i4mat_print ( m, n, a, '  The matrix:' );

  rowsum(1:m) = i4row_sum ( m, n, a );

  mean(1:m) = i4row_mean ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum, mean:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %6d  %6d  %9f\n', i, rowsum(i), mean(i) );
  end

  return
end
