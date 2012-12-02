function r8lib_test013 ( )

%*****************************************************************************80
%
%% TEST013 tests R8_MODP.
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
  fprintf ( 1, 'TEST013\n' );
  fprintf ( 1, '  R8_MOD returns the remainder after division.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X       Y      MOD(X,Y)  R8_MOD(X,Y)\n' );
  fprintf ( 1, '\n' );

  x_lo = -10.0;
  x_hi = +10.0;

  seed = 123456789;

  for test = 1 : test_num

    [ x, seed ] = r8_uniform_ab ( x_lo, x_hi, seed );
    [ y, seed ] = r8_uniform_ab ( x_lo, x_hi, seed );

    z1 =    mod ( x, y );
    z2 = r8_mod ( x, y );

    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', x, y, z1, z2 );

  end

  return
end
