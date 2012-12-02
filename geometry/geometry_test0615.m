function geometry_test0615 ( )

%*****************************************************************************80
%
%% TEST0615 tests PLANE_NORMAL_LINE_EXP_INT_3D.
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
  fprintf ( 1, 'TEST0615\n' );
  fprintf ( 1, '  PLANE_NORMAL_LINE_EXP_INT_3D finds the\n' );
  fprintf ( 1, '    intersection of a normal plane and\n' );
  fprintf ( 1, '    an explicit line, in 3D.\n' );

  pp(1:dim_num) = [ -1.0, +1.0, +1.0 ];

  normal(1:dim_num) = [ 1.0, -2.0, -3.0 ];
  temp = sqrt ( sum ( normal(1:dim_num).^2 ) );
  normal(1:dim_num) = normal(1:dim_num) / temp;

  r8vec_print ( dim_num, pp, '  Plane point PP:' );
  r8vec_print ( dim_num, normal, '  Plane Normal:' );

  p1(1:dim_num) = [ 3.0, 0.0, -7.0 ];
  p2(1:dim_num) = [ 5.0, 1.0, -2.0 ];

  r8vec_print ( dim_num, p1, '  Line point P1:' );
  r8vec_print ( dim_num, p2, '  Line point P2:' );

  [ ival, pint ] = plane_normal_line_exp_int_3d ( pp, normal, p1, p2 );

  if ( ival == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The plane and line do not intersect.\n' );
  elseif ( ival == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The plane and line intersect at\n' );
    fprintf ( 1, '  %12f  %12f  %12f\n', pint(1:dim_num) );
  elseif ( ival == 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The plane and line are coincident.\n' );
    fprintf ( 1, '  One of the infinitely many points of intersection:\n' );
    fprintf ( 1, '  %12f  %12f  %12f\n', pint(1:dim_num) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The plane and the line do not intersect.\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected answer:\n' );
  fprintf ( 1, '    The plane and line intersect at\n' );
  fprintf ( 1, '    7, 2, 3.\n' );

  return
end
