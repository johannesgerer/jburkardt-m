function subpak_test0235 ( )

%*****************************************************************************80
%
%% TEST0235 tests R8_SWAP.
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
  fprintf ( 1, 'TEST0235\n' );
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
