function i4row_variance_test ( )

%*****************************************************************************80
%
%% I4ROW_VARIANCE_TEST tests I4ROW_VARIANCE.
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
  fprintf ( 1, 'I4ROW_VARIANCE_TEST\n' );
  fprintf ( 1, '  I4ROW_VARIANCE computes row variances;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  i4mat_print ( m, n, a, '  The matrix:' );

  variance(1:m) = i4row_variance ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Row variances:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : m
    fprintf ( 1, '  %6d  %9f\n', i, variance(i) );
  end

  return
end
