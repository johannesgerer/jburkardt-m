function r8lib_test037 ( )

%*****************************************************************************80
%
%% R8LIB_TEST037 tests R8COL_FIND.
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
  n = 4;
  m = 3;

  k = 1;
  for i = 1 : m
    for j = 1 : n

      dtab(i,j) = k;

      if ( j == 3 )
        dvec(i) = k;
      end

      k = k + 1;

    end
  end

  icol = r8col_find ( m, n, dtab, dvec );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST037\n' );
  fprintf ( 1, '  R8COL_FIND finds a column in a table matching\n' );
  fprintf ( 1, '  a given set of data.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8COL_FIND returns ICOL = %d\n', icol );

  return
end
