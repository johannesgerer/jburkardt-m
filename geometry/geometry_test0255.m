function geometry_test0255 ( )

%*****************************************************************************80
%
%% TEST0255 tests ELLIPSE_POINT_NEAR_2D.
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

  a = 3.0;
  b = 2.0;
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0255:\n' );
  fprintf ( 1, '  ELLIPSE_POINT_NEAR_2D is given a point P, and\n' );
  fprintf ( 1, '  finds the nearest point PN on an ellipse in 2D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The ellipse is (X/A)^2 + (Y/B)^2 = 1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A = %f\n', a );
  fprintf ( 1, '  B = %f\n', b );
  fprintf ( 1, '\n' );
  fprintf ( 1, '           P                PN\n' );
  fprintf ( 1, '\n' );

  for i = -3 : n + 3

    p(1) = ( ( n - i ) * 0.0 + i * 4.0 ) / n;

    p(2) = ( ( n - i ) * 3.0 + i * 0.0 )  / n;

    pn = ellipse_point_near_2d ( a, b, p );

    fprintf ( 1, '  %10f  %10f    %10f  %10f\n', p(1:dim_num), pn(1:dim_num) );

  end

  return
end
