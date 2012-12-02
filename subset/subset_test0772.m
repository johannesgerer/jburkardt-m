function subset_test0772 ( )

%*****************************************************************************80
%
%% TEST0772 tests KSUB_RANK.
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
  n = 5;
  k = 3;
  a = [ 1, 3, 5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0772\n' );
  fprintf ( 1, '  KSUB_RANK: rank of a K subset of an N set.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  and K = %d\n', k );
  fprintf ( 1, '  the subset is:\n' );
  for i = 1 : k
    fprintf ( 1, '  %4d', a(i) )
  end
  fprintf ( 1, '\n' );
 
  rank = ksub_rank ( k, a );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rank is %d\n', rank );

  return
end
