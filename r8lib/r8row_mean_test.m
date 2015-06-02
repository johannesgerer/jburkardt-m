function r8row_mean_test ( )

%*****************************************************************************80
%
%% R8ROW_MEAN_TEST tests R8ROW_MEAN;
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
  fprintf ( 1, 'R8ROW_MEAN_TEST\n' );
  fprintf ( 1, '  For a R8ROW (a matrix regarded as rows):\n' );
  fprintf ( 1, '  R8ROW_MEAN computes means;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  r8mat_print ( m, n, a, '  The original matrix:' );

  mean = r8row_mean ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Row mean:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf( 1, '  %3d  %10f\n', i, mean(i) );
  end

  return
end
