function circle_segment_test07 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST07 tests the ANGLE and HEIGHT functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST07\n' );
  fprintf ( 1, '  For circle segment with a given radius R,\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_ANGLE_FROM_HEIGHT computes the angle THETA, given the height.\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_HEIGHT_FROM_ANGLE computes height H, given the angle.\n' );
  fprintf ( 1, '  Check that these functions are inverses of each other\n' );
  fprintf ( 1, '  using random values of R, T, and H.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        R             H      =>     T    =>       H2\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 5
    [ r, seed ] = r8_uniform_01 ( seed );
    r = 5.0 * r;
    [ h, seed ] = r8_uniform_01 ( seed );
    h = 2.0 * r * h;
    t = circle_segment_angle_from_height ( r, h );
    h2 = circle_segment_height_from_angle ( r, t );
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', r, h, t, h2 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '        R             T      =>     H    =>       T2\n' );
  fprintf ( 1, '\n' );
  for test = 1 : 5
    [ r, seed ] = r8_uniform_01 ( seed );
    r = 5.0 * r;
    [ t, seed ] = r8_uniform_01 ( seed );
    t = 2.0 * pi * t;
    h = circle_segment_height_from_angle ( r, t );
    t2 = circle_segment_angle_from_height ( r, h );
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', r, t, h, t2 );
  end

  return
end
