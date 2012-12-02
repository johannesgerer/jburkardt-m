function unicycle_test07 ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST07 tests UNICYCLE_UNRANK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 June 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST07\n' );
  fprintf ( 1, '  UNICYCLE_UNRANK, given a rank, computes the\n' );
  fprintf ( 1, '  corresponding unicycle.\n' );
  fprintf ( 1, '\n' );
  rank = 6;
  fprintf ( 1, '  The requested rank is %d\n', rank );
 
  u = unicycle_unrank ( n, rank );
 
  unicycle_print ( n, u, '  The unicycle:' );
 
  return
end