function subset_test055 ( )

%*****************************************************************************80
%
%% TEST055 tests INDEX_UNRANK1.
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
  hi = [ 4, 2, 3 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST055\n' );
  fprintf ( 1, '  INDEX_UNRANK1 unranks a multi-index.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The multi-index has dimension %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The upper limits are:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %8d  %8d\n', i, hi(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank, Multi-Index:\n' );
  fprintf ( 1, '\n' );
 
  maxrank = prod ( hi(1:n) );

  for rank = 1 : maxrank
    a = index_unrank1 ( n, hi, rank );
    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end
