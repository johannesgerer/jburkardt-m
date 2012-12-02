function subpak_test040 ( )

%*****************************************************************************80
%
%% TEST040 tests R8COL_MAX and R8COL_MIN;
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
  fprintf ( 1, 'TEST040\n' );
  fprintf ( 1, '  For an R8COL, an array of column vectors;\n' );
  fprintf ( 1, '  R8COL_MAX computes maximums;\n' );
  fprintf ( 1, '  R8COL_MIN computes minimums;\n' );

  k = 0;

  for i = 1 : m
    for j = 1 : n
      k = k + 1;
      a(i,j) = k;
    end
  end

  r8mat_print ( m, n, a, '  The array:' );

  amax = r8col_max ( m, n, a );

  amin = r8col_min ( m, n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Column, maximum, minimum:\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    fprintf ( 1, '  %3d  %10f  %10f\n', j, amax(j), amin(j) );
  end

  return
end
