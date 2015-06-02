function r8_swap3_test ( )

%*****************************************************************************80
%
%% R8_SWAP3_TEST tests R8_SWAP3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_SWAP3_TEST\n' );
  fprintf ( 1, '  R8_SWAP3 swaps three reals.\n' );

  x = 1.0;
  y = 3.14159;
  z = 1952.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Before  %g  %g  %g:\n', x, y, z );
  fprintf ( 1, '\n' );

  for i = 1 : 3
    [ x, y, z ] = r8_swap3 ( x, y, z );
    fprintf ( 1, '  Swap %d:  %g  %g  %g\n', i, x, y, z );
  end

  return
end
