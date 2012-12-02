function geometry_test059 ( )

%*****************************************************************************80
%
%% TEST059 tests PLANE_IMP_TRIANGLE_NEAR_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST059\n' );
  fprintf ( 1, '  PLANE_IMP_TRIANGLE_NEAR_3D finds the nearest\n' );
  fprintf ( 1, '    points on an implicit plane and a triangle.\n' );
 
  a = 1.0;
  b = -2.0;
  c = -3.0;
  d = 6.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Implicit plane: A*X + B*Y + C*Z + D = 0.\n' );
  fprintf ( 1, '  A,B,C,D = \n' );
  fprintf ( 1, '  %f  %f  %f  %f\n', a, b, c, d );

  t(1:dim_num,1:3) = [ ...
     3.0,  0.0, -7.0; ...
    13.0, -4.0, -1.0; ...
     0.0,  0.0,  0.0 ]';
 
  for i = 1 : 2
 
    if ( i == 1 )
      t(1:dim_num,3) = [ 5.0, 1.0, -2.0 ]';
    elseif ( i == 2 )
      t(1:dim_num,3) = [ 9.0, 3.0, 8.0 ]';
    end
 
    r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

    [ dist, num_near, pn ] = plane_imp_triangle_near_3d ( t, a, b, c, d );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Triangle to plane distance is %f\n', dist );

    r8mat_transpose_print ( dim_num, num_near, pn, '  Nearest points:' );
 
  end

  return
end
