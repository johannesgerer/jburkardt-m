function r = hex_grid_angle ( box, center, angle, h, n )

%*****************************************************************************80
%
%% HEX_GRID_ANGLE sets the points in an angled hex grid in a box.
%
%  Discussion:
%
%    DIM_NUM = 2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real BOX(DIM_NUM,2), the lower left and upper right
%    corners of the box.
%
%    Input, real CENTER(DIM_NUM), the center of the grid.
%    This point must be inside the unit square.
%
%    Input, real ANGLE, the angle, in degrees, of the grid.
%    Normally, 0 <= ANGLE <= 180, but any value is allowed.
%
%    Input, real H, the spacing between neighboring
%    points on a grid line.
%
%    Input, integer N, the number of points of the angled hex grid
%    that are within the unit square.  This value may have been computed
%    by calling HEX_GRID_ANGLE_01_SIZE.
%
%    Output, real R(DIM_NUM,N), the grid points.
%
  dim_num = 2;
%
%  Ninny checks.
%
  if ( ~box_contains_point_2d ( box, center ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEX_GRID_ANGLE - Fatal error!\n' );
    fprintf ( 1, '  The center point of the grid is not\n' );
    fprintf ( 1, '  inside the box.\n' );
    fprintf ( 1, '  CENTER = ( %f, %f)\n', center(1:dim_num) );
    error ( 'HEX_GRID_ANGLE - Fatal error!' );
  end

  if ( h == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HEX_GRID_ANGLE - Fatal error!\n' );
    fprintf ( 1, '  The grid spacing must be nonzero.\n' );
    fprintf ( 1, '  H = %f\n', h );
    error ( 'HEX_GRID_ANGLE - Fatal error!' );
  end

  layer = 0;
  point(1:dim_num) = center(1:dim_num);

  k = 1;
  if ( k <= n )
    r(1:dim_num,k) = center(1:dim_num)';
  end

  while ( 1 )

    layer = layer + 1;

    layer_size = 0;

    angle2 = angle;
%
%  Compute the first point on the new layer.
%
    point(1) = point(1) + h * cos_deg ( angle2 );
    point(2) = point(2) + h * sin_deg ( angle2 );

    angle2 = r8_modp ( angle2 + 60.0, 360.0 );

    for i = 1 : 6

      angle2 = r8_modp ( angle2 + 60.0, 360.0 );

      for j = 1 : layer

        point(1) = point(1) + h * cos_deg ( angle2 );
        point(2) = point(2) + h * sin_deg ( angle2 );

        if ( box_contains_point_2d ( box, point ) )

          layer_size = layer_size + 1;
          k = k + 1;

          if ( k <= n )
            r(1:dim_num,k) = point(1:dim_num)';
          end

        end

      end

    end

    if ( layer_size == 0 )
      break;
    end

  end

  return
end
