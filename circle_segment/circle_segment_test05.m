function circle_segment_test05 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST05 tests the AREA and HEIGHT_FROM_AREA functions.
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
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST05\n' );
  fprintf ( 1, '  For circle segment with a given radius R,\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_AREA_FROM_HEIGHT computes the area A, given the height.\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_HEIGHT_FROM_AREA computes height H, given the area.\n' );
  fprintf ( 1, '  Check that these functions are inverses of each other\n' );
  fprintf ( 1, '  using random values of R, A, and H.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        R             H      =>     A    =>       H2\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : 5
    [ r, seed ] = r8_uniform_01 ( seed );
    r = 5.0 * r;
    [ h, seed ] = r8_uniform_01 ( seed );
    h = 2.0 * r * h;
    a = circle_segment_area_from_height ( r, h );
    h2 = circle_segment_height_from_area ( r, a );
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', r, h, a, h2 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '        R             A      =>     H    =>       A2\n' );
  fprintf ( 1, '\n' );
  for test = 1 : 5
    [ r, seed ] = r8_uniform_01 ( seed );
    r = 5.0 * r;
    [ a, seed ] = r8_uniform_01 ( seed );
    a = pi * r * r * a;
    h = circle_segment_height_from_area ( r, a );
    a2 = circle_segment_area_from_height ( r, h );
    fprintf ( 1, '  %12f  %12f  %12f  %12f\n', r, a, h, a2 );
  end

  return
end
