function subset_test053 ( )

%*****************************************************************************80
%
%% TEST053 tests INDEX_RANK2.
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

  a = [ 1, 11, 5 ];
  hi = [ 2, 11, 6 ];
  lo = [ 1, 10, 4 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST053\n' );
  fprintf ( 1, '  INDEX_RANK2 ranks an index with given\n' );
  fprintf ( 1, '  lower and upper limits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of index entries = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Coordinate, Minimum index, Maximum Index\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %8d  %8d  %8d\n', i, lo, hi(i) );
  end
 
  i4vec_print ( n, a, '  The index array:' );

  rank = index_rank2 ( n, lo, hi, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rank of this object is %d\n', rank );

  return
end
