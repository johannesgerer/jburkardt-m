function subset_test0773 ( )

%*****************************************************************************80
%
%% TEST0773 tests KSUB_UNRANK.
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
  k = 3;
  n = 5;
  rank = 8;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0773\n' );
  fprintf ( 1, '  KSUB_UNRANK: find the K-subset of an N set\n' );
  fprintf ( 1, '  of a given rank.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N is %d\n', n );
  fprintf ( 1, '  K is %d\n', k );
  fprintf ( 1, '  and the desired rank is %d\n', rank );
 
  a = ksub_unrank ( k, rank );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The subset of the given rank is:\n' );
  for i = 1 : k
    fprintf ( 1, '  %2d', a(i) );
  end
  fprintf ( 1, '\n' );

  return
end
