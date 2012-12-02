function subset_test056 ( )

%*****************************************************************************80
%
%% TEST056 tests INDEX_UNRANK2.
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
  hi = [ 2, 11, 6 ];
  lo = [ 1, 10, 4 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST056\n' );
  fprintf ( 1, '  INDEX_UNRANK2 unranks a multi-index.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The multi-index has dimension %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The lower and upper limits are:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %8d  %8d  %8d\n', i, lo(i), hi(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank, Multi-Index:\n' );
  fprintf ( 1, '\n' );
 
  rank = 7;

  a = index_unrank2 ( n, lo, hi, rank );
  fprintf ( 1, '  %2d', rank );
  for i = 1 : n
    fprintf ( 1, '  %2d', a(i) );
  end
  fprintf ( 1, '\n' );

  return
end
