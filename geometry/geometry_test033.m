function geometry_test033 ( )

%*****************************************************************************80
%
%% TEST033 tests LINE_EXP_PERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  ntest = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST033\n' );
  fprintf ( 1, '  LINE_EXP_PERP_2D is given an explicit line (P1,P2),\n' );
  fprintf ( 1, '  and another point P3.  It then finds a point\n' );
  fprintf ( 1, '  P4 on (P1,P2) so that (P1,P2) is perpendicular\n' );
  fprintf ( 1, '  to (P3,P4).\n' );

  p1(1:dim_num) = [ 1.0, 3.0 ];
  p2(1:dim_num) = [ 4.0, 0.0 ];

  p3test(1:dim_num,1:ntest) = [ ...
    0.0,  0.0; ...
    5.0, -1.0; ...
    5.0,  3.0 ]';

  r8vec_print ( dim_num, p1, '  Point P1:' );
  r8vec_print ( dim_num, p2, '  Point P2:' );

  for j = 1 : ntest

    p3(1:dim_num) = p3test(1:dim_num,j);

    r8vec_print ( dim_num, p3, '  Point P3:' );

    [ p4, flag ] = line_exp_perp_2d ( p1, p2, p3 );

    r8vec_print ( dim_num, p4, '  Point P4:' );

  end

  return
end
