function geometry_test0322 ( )

%*****************************************************************************80
%
%% TEST0322 tests I4COL_FIND_ITEM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;
  test_num = 3;

  item_test = [ 34, 12, 90 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0322\n' );
  fprintf ( 1, '  I4COL_FIND_ITEM finds the first occurrence of\n' );
  fprintf ( 1, '  an item in an I4COL.\n' );

  for i = 1 : m
    for j = 1 : n
      a(i,j) = 10 * i + j;
    end
  end

  i4mat_print ( m, n, a, '  The matrix of columns:' );

  for test = 1 : test_num

    item = item_test(test);

    [ row, col ] = i4col_find_item ( m, n, a, item );

    fprintf ( 1, '  Item %d  occurs in row %d and column %d.\n', ...
      item, row, col );

  end

  return
end
