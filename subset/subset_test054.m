function subset_test054 ( )

%*****************************************************************************80
%
%% TEST054 tests INDEX_UNRANK0.
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
  hi = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST054\n' );
  fprintf ( 1, '  INDEX_UNRANK0 unranks a multi-index.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The multi-index has dimension %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The upper limit is HI = %d\n', hi );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank, Multi-Index:\n' );
  fprintf ( 1, '\n' );
 
  maxrank = hi^n;

  for rank = 1 : maxrank
    a = index_unrank0 ( n, hi, rank );
    fprintf ( 1, '  %2d  ', rank );
    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end
