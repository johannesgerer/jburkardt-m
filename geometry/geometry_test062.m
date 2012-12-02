function geometry_test062 ( )

%*****************************************************************************80
%
%% TEST062 tests PLANE_NORMAL_TRIANGLE_INT_3D.
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
  ntest = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST062\n' );
  fprintf ( 1, '  PLANE_NORMAL_TRIANGLE_INT_3D finds the\n' );
  fprintf ( 1, '    intersection points of a normal form plane\n' );
  fprintf ( 1, '    and a triangle.\n' );
 
  normal(1:dim_num) =  [ 1.0, -2.0, -3.0 ];

  pp(1:dim_num) = [ 0.0, 0.0, 2.0 ];
 
  r8vec_print ( dim_num, pp, '  The point PP:' );

  r8vec_print ( dim_num, normal, '  The normal vector N:' );

  for i = 1 : ntest
 
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

    [ num_int, pint ] = plane_normal_triangle_int_3d ( pp, normal, t );
 
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of intersection points is %d\n', num_int );

    r8mat_transpose_print ( dim_num, num_int, pint, '  Intersection points:' );
 
  end

  return
end
