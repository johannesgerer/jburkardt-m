function geometry_test030 ( )

%*****************************************************************************80
%
%% TEST030 tests HALFSPACE_NORMAL_TRIANGLE_INT_3D.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST030\n' );
  fprintf ( 1, '  HALFSPACE_NORMAL_TRIANGLE_INT_3D finds\n' );
  fprintf ( 1, '    intersection points of a normal form\n' );
  fprintf ( 1, '    halfspace and a triangle.\n' );

  normal(1:dim_num) =   [ 2.0, -4.0, -6.0 ];
  p(1:dim_num) = [ -6.0,  0.0, 0.0 ];

  r8vec_print ( dim_num, p, '  Plane point P:' );
  r8vec_print ( dim_num, normal, '  Plane normal:' );

  ntest = 6;

  for i = 1 : ntest

    if ( i == 1 )
      t(1:dim_num,1:3) = [ ...
        0.0,  0.0,  0.0; ...
        0.0, -1.0,  0.0; ...
        0.0,  0.0, -2.0 ]';
    elseif ( i == 2 )
      t(1:dim_num,1:3) = [ ...
       -6.0,  0.0,  0.0; ...
        0.0, -1.0,  0.0; ...
        0.0,  0.0, -2.0 ]';
    elseif ( i == 3 )
      t(1:dim_num,1:3) = [ ...
        0.0,  0.0,  0.0; ...
        0.0,  3.0,  0.0; ...
        0.0,  0.0,  2.0 ]';
    elseif ( i == 4 )
      t(1:dim_num,1:3) = [ ...
       -6.0,  0.0,  0.0; ...
        0.0,  4.0,  0.0; ...
        0.0,  0.0,  3.0 ]';
    elseif ( i == 5 )
      t(1:dim_num,1:3) = [ ...
       -8.0,  0.0,  0.0; ...
        0.0, -1.0,  0.0; ...
        0.0,  0.0, -2.0 ]';
    elseif ( i == 6 )
      t(1:dim_num,1:3) = [ ...
        0.0,  0.0,  0.0; ...
        0.0,  4.0,  0.0; ...
        0.0,  0.0,  4.0 ]';
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Case %d\n', i );

    r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

    [ num_int, pint ] = halfspace_normal_triangle_int_3d ( p, normal, t );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of intersection points is %d\n', num_int );

    r8mat_transpose_print ( dim_num, num_int, pint, '  Intersections:' );

  end

  return
end
