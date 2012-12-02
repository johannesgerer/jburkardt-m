function geometry_test034 ( )

%*****************************************************************************80
%
%% TEST034 tests LINE_EXP_POINT_NEAR_2D.
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
  ntest = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST034\n' );
  fprintf ( 1, '  LINE_EXP_POINT_NEAR_2D finds the point on\n' );
  fprintf ( 1, '    a line nearest in point in 2D.\n' );

  p1(1:dim_num) = [ 1.0, 3.0 ];
  p2(1:dim_num) = [ 4.0, 0.0 ];

  ptest(1:dim_num,1:ntest) = [ ...
    0.0,  0.0; ...
    5.0, -1.0; ...
    5.0,  3.0 ]';

  r8vec_print ( dim_num, p1, '  The point P1:' );
  r8vec_print ( dim_num, p2, '  The point P2:' );

  for i = 1 : ntest

    p(1:dim_num) = ptest(1:dim_num,i);

    r8vec_print ( dim_num, p, '  The point P:' );

    [ pn, dist, t ] = line_exp_point_near_2d ( p1, p2, p );

    r8vec_print ( dim_num, pn, '  Nearest point PN:' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Distance = %f\n', dist );
    fprintf ( 1, '  Relative line position T = %f\n', t );

  end

  return
end
