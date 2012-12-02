function geometry_test206 ( )

%*****************************************************************************80
%
%% TEST206 tests TRIANGLE_ANGLES_2D;
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

  t = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST206\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_ANGLES_2D computes the angles;\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  angle = triangle_angles_2d ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      Radians      Degrees\n' );
  fprintf ( 1, '\n' );
  for i = 1 : 3
    fprintf ( 1, '  %12f  %12f\n', angle(i), radians_to_degrees ( angle(i) ) );
  end

  return
end
