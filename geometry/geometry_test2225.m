function geometry_test2225 ( )

%*****************************************************************************80
%
%% TEST2225 tests VECTOR_ROTATE_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  ntest = 5;

  axis = [ 1.0, 1.0, 1.0 ];
  atest(1:ntest) = [ 30.0, -45.0, 90.0, 270.0, 30.0 ];
  v1_test = [ ...
    1.0,  0.0,  0.0; ...
    0.0,  2.0,  0.0; ...
    0.0,  0.0,  3.0; ...
    1.0,  1.0,  1.0; ...
    1.0,  1.0, -2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2225\n' );
  fprintf ( 1, '  VECTOR_ROTATE_3D rotates a vector through\n' );
  fprintf ( 1, '  a given angle around the origin.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rotations will be about the following axis:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %6f  %6f  %6f\n', axis(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '            V1          Angle              V2\n' );
  fprintf ( 1,'    ----------------------  ------  ----------------------\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    v1(1:dim_num) = v1_test(1:dim_num,i);

    angle = degrees_to_radians ( atest(i) );

    v2 = vector_rotate_3d ( v1, axis, angle );

    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      v1(1:dim_num), atest(i), v2(1:dim_num) );
 
  end
%
%  Test using an axis that is not of unit length!
%
  axis = [ 0.0, 0.0, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rotations will be about the following axis:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %6f  %6f  %6f\n', axis(1:dim_num) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '            V1          Angle              V2\n' );
  fprintf ( 1,'    ----------------------  ------  ----------------------\n' );
  fprintf ( 1, '\n' );

  v1(1:dim_num) = [ 1.0, 1.0, 1.0 ];

  angle = 90.0;
  angle = degrees_to_radians ( angle );

  v2 = vector_rotate_3d ( v1, axis, angle );

  fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
    v1(1:dim_num), 90.0, v2(1:dim_num) );
 
  return
end
