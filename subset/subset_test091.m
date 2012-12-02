function subset_test091 ( )

%*****************************************************************************80
%
%% TEST091 tests PERM_DISTANCE
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST091\n' );
  fprintf ( 1, '  PERM_DISTANCE computes the Ulam metric distance\n' );
  fprintf ( 1, '  between two permutations.\n' );

  seed = 123456789;

  [ p1, seed ] = perm_random3 ( n, seed );
  perm_print ( n, p1, '  Permutation P1' );
  [ p2, seed ] = perm_random3 ( n, seed );
  perm_print ( n, p2, '  Permutation P2' );
  [ p3, seed ] = perm_random3 ( n, seed );
  perm_print ( n, p3, '  Permutation P3' );

  k11 = perm_distance ( n, p1, p1 );
  k12 = perm_distance ( n, p1, p2 );
  k21 = perm_distance ( n, p2, p1 );
  k13 = perm_distance ( n, p1, p3 );
  k23 = perm_distance ( n, p2, p3 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  K(P1,P1) should be 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  K(P1,P1) = %d\n', k11 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  K(P1,P2) should equal K(P2,P1).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  K(P1,P2) = %d\n', k12 );
  fprintf ( 1, '  K(P2,P1) = %d\n', k21 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  K(P1,P3) <= K(P1,P2) + K(P2,P3).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  K(P1,P3) = %d\n', k13 );
  fprintf ( 1, '  K(P1,P2) = %d\n', k12 );
  fprintf ( 1, '  K(P2,P3) = %d\n', k23 );
  fprintf ( 1, '  K(P1,P2) + K(P2,P3) = %d\n', k12 + k23 );

  return
end
