function point_num = sparse_grid_ccs_size ( dim_num, level_max )

%*****************************************************************************80
%
%% SPARSE_GRID_CCS_SIZE sizes a sparse grid using Clenshaw Curtis Slow rules.
%
%  Discussion:
%
%    The grid is defined as the sum of the product rules whose LEVEL
%    satisfies:
%
%      0 <= LEVEL <= LEVEL_MAX.
%
%    This calculation is much faster than a previous method.  It simply
%    computes the number of new points that are added at each level in the
%    1D rule, and then counts the new points at a given DIM_NUM dimensional
%    level vector as the product of the new points added in each dimension.
%
%    This approach will work for nested families, and may be extensible
%    to other families, and to mixed rules.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 December 2009
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
  new_1d = zeros ( level_max+1, 1 );

  new_1d(0+1) = 1;
  new_1d(1+1) = 2;

  p = 3;
  o = 3;

  for l = 2 : level_max
    p = 2 * l + 1;
    if ( o < p )
      new_1d(l+1) = o - 1;
      o = 2 * o - 1;
    else
      new_1d(l+1) = 0;
    end
  end
%
%  Count the number of points by counting the number of new points 
%  associated with each level vector.
%
  level_1d = zeros ( dim_num, 1 );

  point_num = 0;

  for level = 0 : level_max

    more = 0;
    h = 0;
    t = 0;

    while ( 1 )

      [ level_1d, more, h, t ] = comp_next ( level, dim_num, level_1d, more, h, t );

      point_num = point_num + prod ( new_1d(level_1d(1:dim_num)+1) );

      if ( ~more )
        break
      end

    end

  end

  return
end
