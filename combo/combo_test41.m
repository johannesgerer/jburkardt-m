function combo_test41 ( )

%*****************************************************************************80
%
%% COMBO_TEST41 tests SUBSETSUM_SWAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 7;

  sum_desired = 17;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST41\n' );
  fprintf ( 1, '  SUBSETSUM_SWAP seeks a solution of the subset\n' );
  fprintf ( 1, '  sum problem using pair swapping.\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The desired sum is %d\n', sum_desired );

  a(1:7) = [ 12, 8, 11, 30, 8, 3, 7 ]';

  [ a, index, sum_achieved ] = subsetsum_swap ( n, a, sum_desired );

  fprintf ( 1, ' \n' );
  fprintf ( 1, '    A(I), INDEX(I)\n' );
  fprintf ( 1, ' \n' );

  for i = 1 : n
    fprintf ( 1, '  %5d  %5d\n', a(i), index(i) );
  end

  fprintf ( 1, ' \n' );
  fprintf ( 1, '  The achieved sum is %d\n', sum_achieved );

  return
end
