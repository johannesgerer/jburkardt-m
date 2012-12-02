function subpak_test106 ( )

%*****************************************************************************80
%
%% TEST106 tests R8ROW_MEAN and R8ROW_SUM;
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
  fprintf ( 1, 'TEST106\n' );
  fprintf ( 1, '  For a R8ROW (a matrix regarded as rows):\n' );
  fprintf ( 1, '  R8ROW_MEAN computes means;\n' );
  fprintf ( 1, '  R8ROW_SUM computes sums;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  r8mat_print ( m, n, a, '  The original matrix:' );

  rowsum = r8row_sum ( m, n, a );

  mean = r8row_mean ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Row sum, mean:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf( 1, '  %3d  %10f  %10f\n', i, rowsum(i), mean(i) );
  end

  return
end
