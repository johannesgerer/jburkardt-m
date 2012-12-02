function subpak_test014 ( )

%*****************************************************************************80
%
%% TEST014 tests R8_MODP.
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
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST014\n' );
  fprintf ( 1, '  R8_MODP returns the remainder after division.\n' );
  fprintf ( 1, '  Unlike the MATLAB MOD, R8_MODP ( X, Y ) is positive.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X       Y      MOD(X,Y)  R8_MODP(X,Y)\n' );
  fprintf ( 1, '\n' );

  x_lo = -10.0;
  x_hi = +10.0;

  seed = 123456789;

  for test = 1 : test_num

    [ x, seed ] = r8_uniform_ab ( x_lo, x_hi, seed );
    [ y, seed ] = r8_uniform_ab ( x_lo, x_hi, seed );

    z1 =    mod  ( x, y );
    z2 = r8_modp ( x, y );

    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', x, y, z1, z2 );

  end

  return
end
