function i4_swap_test ( )

%*****************************************************************************80
%
%% I4_SWAP_TEST tests I4_SWAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_SWAP_TEST\n' );
  fprintf ( 1, '  I4_SWAP swaps two integers.\n' );

  i = 1;
  j = 202;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Before swapping:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I = %d\n', i );
  fprintf ( 1, '  J = %d\n', j );

  [ i, j ] = i4_swap ( i, j );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After swapping:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I = %d\n', i );
  fprintf ( 1, '  J = %d\n', j );

  return
end
