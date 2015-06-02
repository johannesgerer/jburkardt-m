function circle_segment_test11 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST11 demonstrates CIRCLE_SEGMENT_ROTATION_FROM_CHORD.
%
%  Discussion:
%
%    We make a table of all pairs of angles that are multiples of pi/12.
%
%    For each pair, we compute the rotation, that is, the angle of the
%    central radius of the circle segment.  We print out the result in
%    terms of multiples of pi/12.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST11:\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_ROTATION_FROM_CHORD is given the endpoints\n' );
  fprintf ( 1, '  of a chord, and is asked to determine the angle of the\n' );
  fprintf ( 1, '  central radius vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We make a table of all pairs of angles that are multiples\n' );
  fprintf ( 1, '  of pi/12, determine the corresponding chord endpoints, and\n' );
  fprintf ( 1, '  compute the rotation angle, also printed as a multiple of pi/12.\n' );

  r = 2.0;
  c = [ 3.0; 5.0 ];
  fprintf ( 1, '\n' );
  fprintf ( 1, '            0.0   1.0   2.0   3.0   4.0   5.0   6.0   7.0   8.0   9.0  10.0  11.0  12.0\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 12
    rho1 = i * pi / 6;
    p1 = c + r * [ cos(rho1); sin(rho1) ];
    fprintf ( 1, '  %2d.0:  ', i );
    for j = 0 : 12
      rho2 = j * pi / 6;
      p2 = c + r * [ cos(rho2); sin(rho2) ];
      alpha = circle_segment_rotation_from_chord ( r, c, p1, p2 );
      fprintf ( 1, '  %4.1f', round ( 10 * 6 * alpha / pi ) / 10 );
    end
    fprintf ( 1, '\n' );
  end

  return
end
