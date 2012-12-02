function geometry_test060 ( )

%*****************************************************************************80
%
%% TEST060 tests PLANE_IMP_TRIANGLE_INT_3D.
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
  fprintf ( 1, 'TEST060\n' );
  fprintf ( 1, '  PLANE_IMP_TRIANGLE_INT_3D finds the\n' );
  fprintf ( 1, '    intersection points of an implicit plane\n' );
  fprintf ( 1, '    and a triangle.\n' );
 
  a = 1.0;
  b = -2.0;
  c = -3.0;
  d = 6.0;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The implicit plane: A*X + B*Y + C*Z + D = 0.\n' );
  fprintf ( 1, '  A,B,C,D = %f  %f  %f  %f\n', a, b, c, d );

  for i = 1 : 4
 
    if ( i == 1 )
      t(1:dim_num,1:3) = [ ...
         3.0,  0.0, -7.0; ...
        13.0, -4.0, -1.0; ...
         5.0,  1.0, -2.0 ]';
    elseif ( i == 2 )
      t(1:dim_num,1:3) = [ ...
         3.0,  0.0, -7.0; ...
        13.0, -4.0, -1.0; ...
         9.0,  3.0,  8.0 ]';
    elseif ( i == 3 )
      t(1:dim_num,1:3) = [ ...
        -6.0,  0.0,  0.0; ...
         0.0,  3.0,  0.0; ...
         0.0,  0.0,  2.0 ]';
    elseif ( i == 4 )
      t(1:dim_num,1:3) = [ ...
        -4.0,  1.0,  0.0; ...
         0.0,  6.0, -2.0; ...
         0.0,  0.0,  1.0 ]';
    end
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Case %d\n', i );

    r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

    [ num_int, pint ] = plane_imp_triangle_int_3d ( a, b, c, d, t );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of intersection points is %d\n', num_int );

    r8mat_transpose_print ( dim_num, num_int, pint, '  Intersection points:' );
 
  end
 
  return
end
