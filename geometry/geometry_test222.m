function geometry_test222 ( )

%*****************************************************************************80
%
%% TEST222 tests VECTOR_ROTATE_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  ntest = 3;

  atest = [ 30.0, -45.0, 270.0 ];
  vtest = [ ...
    1.0, 0.0; ...
    0.0, 2.0; ...
    1.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST222\n' );
  fprintf ( 1, '  VECTOR_ROTATE_2D rotates a vector through\n' );
  fprintf ( 1, '  a given angle around the origin.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X1      Y1   Angle      X2      Y2\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    v(1:dim_num) = vtest(1:dim_num,i);

    angle = degrees_to_radians ( atest(i) );

    w = vector_rotate_2d ( v, angle );

    fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f\n', ...
      v(1:dim_num), atest(i), w(1:dim_num) );
 
  end
 
  return
end
