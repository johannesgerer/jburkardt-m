function geometry_test207 ( )

%*****************************************************************************80
%
%% TEST207 tests TRIANGLE_CONTAINS_POINT_2D_1, TRIANGLE_CONTAINS_POINT_2D_2, TRIANGLE_CONTAINS_POINT_2D_3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 June 2006
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  test_num = 7;

  p_test = [ ...
     0.25,   0.25; ...
     0.75,   0.25; ...
     1.00,   1.00; ...
    11.00,   0.50; ...
     0.00,   1.00; ...
     0.50, -10.00; ...
     0.60,   0.60 ]';
  t = [ ...
    0.0, 1.0; ...
    0.0, 0.0; ...
    1.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST207\n' );
  fprintf ( 1, '  For a triangle in 2D,\n' );
  fprintf ( 1, '  TRIANGLE_CONTAINS_POINT_2D_1 reports if a point \n' );
  fprintf ( 1, '    is inside a triangle (and doesn''t care about\n' );
  fprintf ( 1, '    the ordering of the vertices)\n' );
  fprintf ( 1, '  TRIANGLE_CONTAINS_POINT_2D_2 reports if a point \n' );
  fprintf ( 1, '    is inside a triangle (and DOES care about\n' );
  fprintf ( 1, '    the ordering of the vertices)\n' );
  fprintf ( 1, '  TRIANGLE_CONTAINS_POINT_2D_3 reports if a point \n' );
  fprintf ( 1, '    is inside a triangle (and doesn''t care about\n' );
  fprintf ( 1, '    the ordering of the vertices)\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     X       Y     In1  In2  In3\n' );
  fprintf ( 1, '\n' );

  for j = 1 : test_num

    p(1:dim_num) = p_test(1:dim_num,j);

    inside1 = triangle_contains_point_2d_1 ( t, p );
    inside2 = triangle_contains_point_2d_2 ( t, p );
    inside3 = triangle_contains_point_2d_3 ( t, p );

    fprintf ( 1, '  %10f  %10f  %1d  %1d  %1d\n', ...
      p(1:dim_num), inside1, inside2, inside3 );

  end
%
%  Make a copy of the triangle with vertices in reverse order.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat the test, but reverse the triangle vertex\n' );
  fprintf ( 1, '  ordering.\n' );
 
  for j = 1 : 3
    t2(1:2,j) = t(1:2,4-j);
  end

  r8mat_transpose_print ( dim_num, 3, t2, '  Triangle vertices (reversed):' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     X       Y     In1  In2  In3\n' );
  fprintf ( 1, '\n' );

  for j = 1 : test_num

    p(1:dim_num) = p_test(1:dim_num,j);

    inside1 = triangle_contains_point_2d_1 ( t2, p );
    inside2 = triangle_contains_point_2d_2 ( t2, p );
    inside3 = triangle_contains_point_2d_3 ( t2, p );

    fprintf ( 1, '  %10f  %10f  %1d  %1d  %1d\n', ...
      p(1:dim_num), inside1, inside2, inside3 );

  end
 
  return
end
