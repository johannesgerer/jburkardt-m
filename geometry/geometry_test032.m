function geometry_test032 ( )

%*****************************************************************************80
%
%% TEST032 tests HEXAGON_SHAPE_2D.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST032\n' );
  fprintf ( 1, '  HEXAGON_SHAPE_2D: points on a unit hexagon.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Angle    X    Y\n' );
  fprintf ( 1, '\n' );

  for i = -10 : 10 : 370
    angle = i;
    p = hexagon_shape_2d ( angle );
    fprintf ( 1, '  %8f    %12f  %12f\n', angle, p(1:dim_num) );
  end

  return
end
