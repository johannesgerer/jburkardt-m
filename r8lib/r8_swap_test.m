function r8_swap_test ( )

%*****************************************************************************80
%
%% R8_SWAP_TEST tests R8_SWAP.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_SWAP_TEST\n' );
  fprintf ( 1, '  R8_SWAP swaps two reals.\n' );

  x = 1.0;
  y = 3.14159;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Before swapping:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X = %f\n', x );
  fprintf ( 1, '    Y = %f\n', y );

  [ x, y ] = r8_swap ( x, y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  After swapping:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X = %f\n', x );
  fprintf ( 1, '    Y = %f\n', y );

  return
end
