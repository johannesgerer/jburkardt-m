function i4col_sorted_unique_count_test ( )

%*****************************************************************************80
%
%% I4COL_SORTED_UNIQUE_COUNT_TEST tests I4COL_SORTED_UNIQUE_COUNT;
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
  n = 10;
  test_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4COL_SORTED_UNIQUE_COUNT_TEST\n' );
  fprintf ( 1, '  I4COL_SORTED_UNIQUE_COUNT counts the unique entries\n' );
  fprintf ( 1, '  of a sorted I4COL;\n' );

  seed = 123456789;

  for test = 1 : test_num

    b = 0;
    c = 3;

    [ a, seed ] = i4mat_uniform_ab ( m, n, b, c, seed );

    a = i4col_sort_a ( m, n, a );

    i4mat_print ( m, n, a, '  Ascending sorted I4COL:' );

    unique_num = i4col_sorted_unique_count ( m, n, a );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of unique entries = %d\n', unique_num );

  end

  return
end
