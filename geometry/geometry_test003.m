function geometry_test003 ( )

%*****************************************************************************80
%
%% TEST003 tests ANGLE_RAD_3D;
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
  dim_num = 3;
  ntest = 3;

  p1_test = [ ...
    1.0, 0.0, 0.0; ...
    1.0, 2.0, 3.0; ...
    0.0, 0.0, 1.0 ]';
  p2 = [ 0.0, 0.0, 0.0 ];
  p3 = [ 0.0, 0.0, 1.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST003\n' );
  fprintf ( 1, '  ANGLE_RAD_3D computes an angle;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P, ANGLE_RAD_3D, (Degrees)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p1(1:dim_num) = p1_test(1:dim_num,i);

    temp1 = angle_rad_3d ( p1, p2, p3 );
    temp2 = radians_to_degrees ( temp1 );

    fprintf ( 1, '  %10f  %10f  %10f    %10f    %10f\n', p1(1:dim_num), temp1, temp2 );
 
  end
 
  return
end
