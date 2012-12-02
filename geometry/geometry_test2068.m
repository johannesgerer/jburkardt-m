function geometry_test2068 ( )

%*****************************************************************************80
%
%% TEST2068 tests TRIANGLE_CONTAINS_LINE_EXP_3D.
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
  fprintf ( 1, 'TEST2068\n' );
  fprintf ( 1, '  TRIANGLE_CONTAINS_LINE_EXP_3D determines whether\n' );
  fprintf ( 1, '    a triangle "contains" an explicit line in 3D.\n' );

  t(1:dim_num,1:3) = [ ...
    8.0, 4.0, 2.0; ...
    9.0, 0.0, 5.0; ...
    2.0, 1.0, 2.0 ]';

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  p1(1:dim_num) = [ 3.0, 0.0, -7.0 ];
  p2(1:dim_num) = [ 5.0, 1.0, -2.0 ];

  r8vec_print ( dim_num, p1, '  Line point P1:' );
  r8vec_print ( dim_num, p2, '  Line point P2:' );

  [ inside, pint ] = triangle_contains_line_exp_3d ( t, p1, p2 );

  if ( inside )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The triangle contains the line.\n' );
    r8vec_print ( dim_num, pint, '  Intersection point:' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The triangle does not contain the line.\n' );
    r8vec_print ( dim_num, pint, '  The intersection point:' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected answer:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    The triangle contains the line, and\n' );
  fprintf ( 1, '    the intersection point is at:\n' );
  fprintf ( 1, '      7, 2, 3.\n' );

  return
end
