function subset_test052 ( )

%*****************************************************************************80
%
%% TEST052 tests INDEX_RANK1.
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
  n = 3;
  a = [ 4, 1, 2 ];
  hi = [ 4, 2, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST052\n' );
  fprintf ( 1, '  INDEX_RANK1 ranks an index with\n' );
  fprintf ( 1, '  lower limit 1 and given upper limits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of index entries = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Coordinate, Maximum Index\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  %8d\n', i, hi(i) );
  end
 
  i4vec_print ( n, a, '  The index array:' );

  rank = index_rank1 ( n, hi, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rank of this object is %d\n', rank );

  return
end
