function subset_test147 ( )

%*****************************************************************************80
%
%% TEST147 tests SUBSET_GRAY_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST147\n' );
  fprintf ( 1, '  SUBSET_GRAY_UNRANK finds the subset of an N set\n' );
  fprintf ( 1, '  of a given rank under the Gray code ordering.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N is %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank   Subset\n' );
  fprintf ( 1, '\n' );

  for rank = 1 : 10
 
    a = subset_gray_unrank ( rank, n );

    fprintf ( 1, '  %4d', rank );
    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
