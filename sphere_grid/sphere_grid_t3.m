function triangle_node = sphere_grid_t3 ( lat_num, long_num )

%*****************************************************************************80
%
%% SPHERE_GRID_T3 produces a triangle grid on a sphere.
%
%  Discussion:
%
%    The point numbering system is the same used in SPHERE_GRIDPOINTS,
%    and that routine may be used to compute the coordinates of the points.
%
%    A sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - pc(1:DIM_NUM) )^2 ) = R^2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LAT_NUM, LONG_NUM, the number of latitude
%    and longitude lines to draw.  The latitudes do not include the North
%    and South poles, which will be included automatically, so LAT_NUM = 5,
%    for instance, will result in points along 7 lines of latitude.
%
%    Output, integer TRIANGLE_NODE(3,(LAT_NUM+1)*LONG_NUM*2), the
%    triangle vertices.
%
  triangle_node = zeros ( 3, ( lat_num + 1 ) * long_num * 2 );

  triangle_num = 0;
%
%  The first row.
%
  n = 1;

  sw = 2;
  se = sw + 1;

  s_min = 2;
  s_max = long_num + 1;

  for j = 0 : long_num - 1

    triangle_num = triangle_num + 1;
    triangle_node(1:3,triangle_num) = [ sw, se, n ]';

    sw = se;

    if ( se == s_max )
      se = s_min;
    else
      se = se + 1;
    end

  end
%
%  The intermediate rows.
%
  for i = 1 : lat_num

    n_max = s_max;
    n_min = s_min;

    s_max = s_max + long_num;
    s_min = s_min + long_num;

    nw = n_min;
    ne = nw + 1;
    sw = s_min;
    se = sw + 1;

    for j = 0 : long_num - 1

      triangle_num = triangle_num + 1;
      triangle_node(1:3,triangle_num) = [ sw, se, nw ]';
 
      triangle_num = triangle_num + 1;
      triangle_node(1:3,triangle_num) = [ ne, nw, se ]';

      sw = se;
      nw = ne;

      if ( se == s_max )
        se = s_min;
      else
        se = se + 1;
      end

      if ( ne == n_max )
        ne = n_min;
      else
        ne = ne + 1;
      end

    end

  end
%
%  The last row.
%
  n_max = s_max;
  n_min = s_min;

  s = n_max + 1;

  nw = n_min;
  ne = nw + 1;

  for j = 0 : long_num - 1

    triangle_num = triangle_num + 1;
    triangle_node(1:3,triangle_num) = [ ne, nw, s ]';

    nw = ne;

    if ( ne == n_max )
      ne = n_min;
    else
      ne = ne + 1;
    end

  end

  return
end
