function subset_test146 ( )

%*****************************************************************************80
%
%% TEST146 tests SUBSET_GRAY_RANK.
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
  a = [ 1, 0, 1, 1, 0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST146\n' );
  fprintf ( 1, '  SUBSET_GRAY_RANK returns rank of a subset of an N set\n' );
  fprintf ( 1, '  using the Gray code ordering.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For N = %d\n', n );
  fprintf ( 1, '  the subset is:\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d', a(i) );
  end
  fprintf ( 1, '\n' );
 
  rank = subset_gray_rank ( n, a );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rank is %d\n', rank );

  return
end
