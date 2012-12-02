function subset_test104 ( )

%*****************************************************************************80
%
%% TEST104 tests PERM_RANDOM3.
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
  n = 4;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST104\n' );
  fprintf ( 1, '  PERM_RANDOM3 produces a random permutation.\n' );
  fprintf ( 1, '  For this test, N = %d\n', n );
  fprintf ( 1, '\n' );
 
  seed = 123456789;

  for i = 1 : 5
    [ p, seed ] = perm_random3 ( n, seed );
    perm_print ( n, p, ' ' );
  end

  return
end
