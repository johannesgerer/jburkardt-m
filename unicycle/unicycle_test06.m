function unicycle_test06 ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST06 tests UNICYCLE_RANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  u = [ 1, 5, 2, 3, 4 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST06\n' );
  fprintf ( 1, '  UNICYCLE_RANK ranks a unicycle.\n' );

  unicycle_print ( n, u, '  The unicycle:' );
 
  rank = unicycle_rank ( n, u );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The rank is: %d\n', rank );
 
  return
end