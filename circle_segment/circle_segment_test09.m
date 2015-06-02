function circle_segment_test09 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST09 looks at the area and centroid calculations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST09\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_AREA_FROM_CHORD and\n' )
  fprintf ( 1, '  CIRCLE_SEGMENT_CENTROID_FROM_CHORD evaluate the area\n' );
  fprintf ( 1, '  and centroid of a circle segment, given R, C and P1:P2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_AREA_FROM_SAMPLE and\n' );
  fprintf ( 1, '  CIRCLE_SEGMENT_CENTROID_FROM_SAMPLE give us Monte Carlo estimates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  GQCIRCSEGM can estimate these values by quadrature.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Start easy, with R = 1, C = (0,0), and Theta centered.\n' );

  seed = 123456789;
  r = 1.0;
  c = [ 0.0; 0.0 ];
  theta = pi / 4.0;
  h = circle_segment_height_from_angle ( r, theta );
  omega1 = - theta / 2.0;
  omega2 = + theta / 2.0;
  p1(1) = c(1) + r * cos ( omega1 );
  p1(2) = c(2) + r * sin ( omega1 );
  p2(1) = c(1) + r * cos ( omega2 );
  p2(2) = c(2) + r * sin ( omega2 );

  a1 = circle_segment_area_from_chord ( r, c, p1, p2 );
  d1 = circle_segment_centroid_from_chord ( r, c, p1, p2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '         Area          CentroidX    CentroidY\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '  %14g  %14g  %14g\n', a1, d1(1), d1(2) );
%
%  This only works because the centroid of the height-based circle segment 
%  is easily transformed to the centroid of the chord based circle segment.
%
  a2 = circle_segment_area_from_height ( r, h );
  d2 = circle_segment_centroid_from_height ( r, h );
  fprintf ( 1, '  %14g  %14g  %14g\n', a2, d2(2), -d2(1) );

  n = 10000;
  [ a3, seed ] = circle_segment_area_from_sample ( r, c, p1, p2, n, seed );
  [ d3, seed ] = circle_segment_centroid_from_sample ( r, c, p1, p2, n, seed );
  fprintf ( 1, '  %14g  %14g  %14g\n', a3, d3(1), d3(2) );

  return
end
