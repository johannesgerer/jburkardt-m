function grid_level = index_level_herm ( level, level_max, dim_num, ...
  point_num, grid_index, grid_base )

%*****************************************************************************80
%
%% INDEX_LEVEL_HERM: determine first level at which given index is generated.
%
%  Discussion:
%
%    We are constructing a sparse grid of Gauss-Hermite points.  The grid
%    is built up of product grids, with a characteristic LEVEL.  
%
%    We are concerned with identifying points in this product grid which
%    have actually been generated previously, on a lower value of LEVEL.
%
%    This routine determines the lowest value of LEVEL at which each of
%    the input points would be generated.
%
%    In 1D, given LEVEL, the number of points is ORDER = 2**(LEVEL+1) + 1,
%    (except that LEVEL = 0 implies ORDER = 1), the BASE is (ORDER-1)/2, 
%    and the point INDEX values range from -BASE to +BASE.
%
%    The values of INDEX and BASE allow us to determine the abstract
%    properties of the point.  In particular, if INDEX is 0, the corresponding
%    Gauss-Hermite abscissa is 0, the special "nested" value we need
%    to take care of.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 October 2007
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
%    Input, integer LEVEL, the level at which these points were 
%    generated.  LEVEL_MIN <= LEVEL <= LEVEL_MAX.
%
%    Input, integer LEVEL_MAX, the maximum level.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer POINT_NUM, the number of points to be tested.
%
%    Input, integer GRID_INDEX(DIM_NUM,POINT_NUM), the indices of the 
%    points to be tested.
%
%    Input, integer GRID_BASE(DIM_NUM), the "base", which is essentially
%    the denominator of the index.
%
%    Output, integer GRID_LEVEL(POINT_NUM), the value of LEVEL at 
%    which the point would first be generated.  This will be the same as
%    the input value of LEVEL, unless the point has an INDEX of 0 and
%    a corresponding BASE that is NOT zero.
%
  level_min = max ( 0, level_max + 1 - dim_num );
%
%  If a point has a DIM-th component whose INDEX is 0, then the 
%  value of LEVEL at which this point would first be generated is
%  less than LEVEL, unless the DIM-th component of GRID_BASE is 0.
%
  for point = 1 : point_num

    grid_level(point) = max ( level, level_min );

    for dim = 1 : dim_num
      if ( grid_index(dim,point) == 0 )
        grid_level(point) = max ( grid_level(point) - grid_base(dim), level_min );
      end
    end

  end

  return
end
