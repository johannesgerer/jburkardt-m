function subpak_test01 ( )

%*****************************************************************************80
%
%% SUBPAK_TEST01 tests ANGLE_SHIFT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2011
%
%  Author:
%
%    John Burkardt
%
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBPAK_TEST01\n' );
  fprintf ( 1, '  ANGLE_SHIFT shifts an angle by multiples of\n' );
  fprintf ( 1, '  2 Pi until it lies between BETA and BETA+2Pi.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      BETA     GAMMA   BETA+2Pi\n' );
  fprintf ( 1, '\n' );

  angle_lo = -4.0 * pi;
  angle_hi = +4.0 * pi;

  seed = 123456789;

  for test = 1 : test_num

    [ alpha, seed ] = r8_uniform ( angle_lo, angle_hi, seed );

    [ beta, seed ] = r8_uniform ( angle_lo, angle_hi, seed );

    gamma = angle_shift ( alpha, beta );

    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', ...
      alpha, beta, gamma, beta + 2.0 * pi );

  end 

  return
end
