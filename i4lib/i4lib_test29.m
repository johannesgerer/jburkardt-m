function i4lib_test29 ( )

%*****************************************************************************80
%
%% TEST29 tests I4COL_SORTED_SINGLETON_COUNT;
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
  fprintf ( 1, 'TEST29\n' );
  fprintf ( 1, '  I4COL_SORTED_SINGLETON_COUNT counts singletons\n' );
  fprintf ( 1,'    in a sorted I4COL;\n' );

  seed = 123456789;

  for test = 1 : test_num

    b = 0;
    c = 3;

    [ a, seed ] = i4mat_uniform_ab ( m, n, b, c, seed );

    a = i4col_sort_a ( m, n, a );

    i4mat_print ( m, n, a, '  Ascending sorted I4COL:' );

    singleton_num = i4col_sorted_singleton_count ( m, n, a );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of singletons = %d\n', singleton_num );

  end

  return
end
