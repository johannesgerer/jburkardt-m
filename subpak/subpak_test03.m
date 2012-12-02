function subpak_test03 ( )

%*****************************************************************************80
%
%% SUBPAK_TEST03 tests ANGLE_TO_RGB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2005
%
%  Author:
%
%    John Burkardt
%
  angle_hi = 360.0;
  angle_lo =   0.0;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBPAK_TEST03\n' );
  fprintf ( 1, '  ANGLE_TO_RGB converts an angle into an RGB color.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ANGLE        R         G         B\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ angle, seed ] = r8_uniform ( angle_lo, angle_hi, seed );

    [ r, g, b ] = angle_to_rgb ( angle );

    fprintf ( 1, '  %10f  %10f  %10f  %10f\n', angle, r, g, b );

  end

  return
end
