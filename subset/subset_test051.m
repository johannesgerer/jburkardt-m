function subset_test051 ( )

%*****************************************************************************80
%
%% TEST051 tests INDEX_RANK0.
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
  a = [ 3, 1, 2 ];
  hi = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST051\n' );
  fprintf ( 1, '  INDEX_RANK0 ranks an index with\n' );
  fprintf ( 1, '  lower limit 1 and given upper limit.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of index entries = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Coordinate maximum Index = %d\n', hi );
  fprintf ( 1, '\n' );

  i4vec_print ( n, a, '  The index array:' );

  rank = index_rank0 ( n, hi, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rank of this object is %d\n', rank );

  return
end
