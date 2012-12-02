function subpak_test02 ( )

%*****************************************************************************80
%
%% SUBPAK_TEST02 tests ANGLE_SHIFT_DEG.
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
  fprintf ( 1, 'SUBPAK_TEST02\n' );
  fprintf ( 1, '  ANGLE_SHIFT_DEG shifts an angle by multiples of\n' );
  fprintf ( 1, '  360 until it lies between BETA and BETA+360.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      BETA     GAMMA   BETA+360\n' );
  fprintf ( 1, '\n' );

  angle_lo = -720.0;
  angle_hi = +720.0;

  seed = 123456789;

  for test = 1 : test_num

    [ alpha, seed ] = r8_uniform ( angle_lo, angle_hi, seed );

    [ beta, seed ] = r8_uniform ( angle_lo, angle_hi, seed );

    gamma = angle_shift_deg ( alpha, beta );

    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', ...
      alpha, beta, gamma, beta + 360 );

  end 

  return
end
