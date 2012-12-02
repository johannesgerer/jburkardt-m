function geometry_test0005 ( )

%*****************************************************************************80
%
%% TEST0005 tests ANGLE_BOX_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0005\n' );
  fprintf ( 1, '  ANGLE_BOX_2D\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute P4 and P5, normal to\n' );
  fprintf ( 1, '  line through P1 and P2, and\n' );
  fprintf ( 1, '  line through P2 and P3,\n' );
  fprintf ( 1, '  and DIST units from P2.\n' );
  fprintf ( 1, '\n' );
%
%  These points define the lines
%    y = 0
%  and
%    y = 2x-6
%
  p1(1:dim_num) = [ 0.0, 0.0 ];
  p2(1:dim_num) = [ 3.0, 0.0 ];
  p3(1:dim_num) = [ 4.0, 2.0 ];
  dist = 1.0;
 
  fprintf ( 1, '  P1:  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  P2:  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  P3:  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '  DIST =  %12f\n', dist );
 
  [ p4, p5 ] = angle_box_2d ( dist, p1, p2, p3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P4:  %12f  %12f\n', p4(1:dim_num) );
  fprintf ( 1, '  P5:  %12f  %12f\n', p5(1:dim_num) );
%
%  These points define the lines
%    y = 0
%  and
%    y = 2x-6
%
  p1(1:dim_num) = [ 0.0,  0.0 ];
  p2(1:dim_num) = [ 3.0,  0.0 ];
  p3(1:dim_num) = [ 2.0, -2.0 ];
  dist = 1.0;
 
  fprintf ( 1, '  P1:  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  P2:  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  P3:  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '  DIST =  %12f\n', dist );
 
  [ p4, p5 ] = angle_box_2d ( dist, p1, p2, p3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P4:  %12f  %12f\n', p4(1:dim_num) );
  fprintf ( 1, '  P5:  %12f  %12f\n', p5(1:dim_num) );
%
%  By setting P1 = P2, we are asking to extend the line
%    y = 2x-6
%  from P3 to P2 through to the other side.
%
  p1(1:dim_num) = [ 3.0,  0.0 ];
  p2(1:dim_num) = [ 3.0,  0.0 ];
  p3(1:dim_num) = [ 2.0, -2.0 ];
  dist = 1.0;
 
  fprintf ( 1, '  P1:  %12f  %12f\n', p1(1:dim_num) );
  fprintf ( 1, '  P2:  %12f  %12f\n', p2(1:dim_num) );
  fprintf ( 1, '  P3:  %12f  %12f\n', p3(1:dim_num) );
  fprintf ( 1, '  DIST =  %12f\n', dist );
 
  [ p4, p5 ] = angle_box_2d ( dist, p1, p2, p3 );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P4:  %12f  %12f\n', p4(1:dim_num) );
  fprintf ( 1, '  P5:  %12f  %12f\n', p5(1:dim_num) );

  return
end
