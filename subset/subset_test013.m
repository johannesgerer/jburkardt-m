function subset_test013 ( )

%*****************************************************************************80
%
%% TEST013 tests COMB_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  m = 10;
  cnk = i4_choose ( m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST013\n' );
  fprintf ( 1, '  COMB_UNRANK returns a combination of N things\n' );
  fprintf ( 1, '  out of M, given the lexicographic rank.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The total set size is M = %d\n', m );
  fprintf ( 1, '  The subset size is N =    %d\n', n );
  fprintf ( 1, '  The number of combinations of N out of M is %d\n', cnk );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Rank	  Combination\n' );
  fprintf ( 1, '\n' );
 
  for rank = 1 : 3
    a = comb_unrank ( m, n, rank );
    fprintf ( 1, '  %3d', rank );
    for i = 1 : n
      fprintf ( 1, '  %5d', a(i) );
    end
    fprintf ( 1, '\n' );
  end
 
  for rank = 6 : 8
    a = comb_unrank ( m, n, rank );
    fprintf ( 1, '  %3d', rank );
    for i = 1 : n
      fprintf ( 1, '  %5d', a(i) );
    end
    fprintf ( 1, '\n' );
  end
 
  for rank = 250 : 252
    a = comb_unrank ( m, n, rank );
    fprintf ( 1, '  %3d', rank );
    for i = 1 : n
      fprintf ( 1, '  %5d', a(i) );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end
