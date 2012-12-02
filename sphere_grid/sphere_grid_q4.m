function rectangle_node = sphere_grid_q4 ( lat_num, long_num )

%*****************************************************************************80
%
%% SPHERE_GRID_Q4: rectangular grid on a sphere.
%
%  Discussion:
%
%    The point numbering system is the same used in SPHERE_GRIDPOINTS,
%    and that routine may be used to compute the coordinates of the points.
%
%    A sphere in 3D satisfies the equation:
%
%      sum ( ( P(1:DIM_NUM) - PC(1:DIM_NUM) )^2 ) = R * R
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
%    Input, integer LAT_NUM, the number of "rows" of rectangles to
%    be created.  LAT_NUM must be at least 2.
%
%    Input, integer LONG_NUM, the number of "columns" of
%    rectangles to be created.
%
%    Output, integer RECTANGLE_NODE(4,LAT_NUM*LONG_NUM),
%    the indices of the nodes that make up each rectangle.
%
  rectangle_node = zeros ( 4, lat_num * long_num );

  rectangle_num = 0;
%
%  The first row.
%
  n = 1;

  sw = 2;
  se = sw + 1;

  s_min = 2;
  s_max = long_num + 1;

  for j = 1 : long_num

    rectangle_num = rectangle_num + 1;
    rectangle_node(1:4,rectangle_num) = [ sw, se, n, n ]';

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
  for i = 2 : lat_num - 1

    n_max = s_max;
    n_min = s_min;

    s_max = s_max + long_num;
    s_min = s_min + long_num;

    nw = n_min;
    ne = nw + 1;
    sw = s_min;
    se = sw + 1;

    for j = 1 : long_num

      rectangle_num = rectangle_num + 1;
      rectangle_node(1:4,rectangle_num) = [ sw, se, ne, nw ]';

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

  for j = 1 : long_num

    rectangle_num = rectangle_num + 1;
    rectangle_node(1:4,rectangle_num) = [ ne, nw, s, s ]';

    nw = ne;

    if ( ne == n_max )
      ne = n_min;
    else
      ne = ne + 1;
    end

  end

  return
end
