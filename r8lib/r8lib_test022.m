function subpak_test022 ( )

%*****************************************************************************80
%
%% TEST022 tests R8_ROUNDX.
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
  seed = 123456789;
  x = pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST022\n' );
  fprintf ( 1, '  R8_ROUNDX rounds a number to a\n' );
  fprintf ( 1, '    specified number of decimal digits.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test effect on PI:\n' );
  fprintf ( 1, '  X = %f\n', x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NPLACE  XROUND\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 10
    nplace = i;
    xround = r8_roundx ( nplace, x );
    fprintf ( 1, '  %6d  %f\n', i, xround );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Test effect on random values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NPLACE  X     XROUND\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5

    [ x, seed ] = r8_uniform_01 ( seed );

    fprintf ( 1, '\n' );

    for nplace = 0 : 2 : 10
      xround = r8_roundx ( nplace, x );
      fprintf ( 1, '  %6d  %f  %f\n', nplace, x, xround );
    end

  end

  return
end
