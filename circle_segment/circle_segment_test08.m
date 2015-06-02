function circle_segment_test08 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST08 tests CIRCLE_SEGMENT_CONTAINS_POINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2013
%
%  Author:
%
%    John Burkardt
%
  n = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST08\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_CONTAINS_POINT reports whether\n' );
  fprintf ( 1, '  a circle segment contains a point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Pick a circle segment at random.\n' );
  fprintf ( 1, '  Compute %d sample points in the surrounding box.\n', n );
  fprintf ( 1, '  Compare the area of the segment to the percentage of points\n' );
  fprintf ( 1, '  contained in the circle segment.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N          Omega1          Omega2           Area         Estimate\n' );
  fprintf ( 1, '\n' );

  r = 1.0;
  c = [ 0.0; 0.0 ];

  for test = 1 : 5

    [ u1, seed ] = r8_uniform_01 ( seed );
    [ u2, seed ] = r8_uniform_01 ( seed );
    omega1 = 2.0 * pi * u1;
    omega2 = 2.0 * pi * u2;
  
    if ( omega2 < omega1 )
      omega2 = omega2 + 2.0 * pi;
    end

    [ xy, seed ] = r8mat_uniform_01 ( 2, n, seed );
    xy = 2.0 * xy - 1.0;

    inout = zeros ( n, 1 );
    for j = 1 : n
      inout(j) = circle_segment_contains_point ( r, c, omega1, omega2, xy(1:2,j) );
    end

    theta = circle_segment_angle_from_chord_angles ( omega1, omega2 );
    area = circle_segment_area_from_angle ( r, theta );
    area_est = 4.0 * sum ( inout(1:n) ) / n;

    fprintf ( 1, '  %6d  %14g  %14g  %14g  %14g\n', n, omega1, omega2, area, area_est );

  end

  return
end
