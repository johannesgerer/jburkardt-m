function point_num = onn_l_size ( dim_num, level_max )

%*****************************************************************************80
%
%% ONN_L_SIZE Open Non Nested Linear Growth.
%
%  Discussion:
%
%    This calculation assumes that a linear growth rule is being used,
%    that is, that the 1D rules have orders 1, 3, 5, 7, 9, and so on.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 January 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the maximum value of LEVEL.
%
%    Output, integer POINT_NUM, the total number of unique 
%    points in the grids.
%

%
%  Special case.
%
  if ( level_max < 0 )
    point_num = 0;
    return
  end

  if ( level_max == 0 )
    point_num = 1;
    return
  end
%
%  Construct the vector that counts the new points in the 1D rule.
%
  order_1d = zeros ( level_max+1, 1 );

  for l = 0 : level_max
    order_1d(l+1) = 2 * l + 1;
  end

  level_1d = zeros ( dim_num, 1 );

  point_num = 0;

  level_min = max ( 0, level_max + 1 - dim_num );

  for level = level_min : level_max

    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );

      point_num = point_num + prod ( order_1d(level_1d(1:dim_num)+1) );

      if ( ~more )
        break
      end

    end

  end

  return
end
