function subpak_test045 ( )

%*****************************************************************************80
%
%% TEST045 tests R8COL_VARIANCE.
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
  fprintf ( 1, 'TEST045\n' );
  fprintf ( 1, '  For an R8COL, an array of column vectors;\n' );
  fprintf ( 1, '  R8COL_VARIANCE computes variances;\n' );

  k = 0;
  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  r8mat_print ( m, n, a, '  The array:' );

  variance = r8col_variance ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Column  variance:\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    fprintf ( 1, '  %3d  %10f\n', j, variance(j) );
  end

  return
end
