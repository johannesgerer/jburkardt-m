function geometry_test03323 ( )

%*****************************************************************************80
%
%% TEST0323 tests I4COL_FIND_PAIR_WRAP.
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
  test_num = 5;

  item1_test = [ 22, 32, 22, 54, 54 ];
  item2_test = [ 32, 22, 23, 14, 11 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0323\n' );
  fprintf ( 1, '  I4COL_FIND_PAIR_WRAP finds the first occurrence of\n' );
  fprintf ( 1, '  a pair of item in an I4COL.\n' );
  fprintf ( 1, '  Items in the array are ordered by column, and\n' );
  fprintf ( 1, '  wraparound is allowed.\n' );
 
  for i = 1 : m
    for j = 1 : n
      a(i,j) = 10 * i + j;
    end
  end

  i4mat_print ( m, n, a, '  The matrix of columns:' );

  for test = 1 : test_num
 
    item1 = item1_test(test);
    item2 = item2_test(test);

    [ row, col ] = i4col_find_pair_wrap ( m, n, a, item1, item2 );

    fprintf ( 1, ...
      '  Item %d followed by item %d occurs in row %d and column %d\n', ...
      item1, item2, row, col );

  end

  return
end
