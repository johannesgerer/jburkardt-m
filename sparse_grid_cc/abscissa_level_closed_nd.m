function test_level = abscissa_level_closed_nd ( level_max, dim_num, test_num, ...
  test_val )

%*****************************************************************************80
%
%% ABSCISSA_LEVEL_CLOSED_ND: first level at which given abscissa is generated.
%
%  Discussion:
%
%    We assume an underlying product grid.  In each dimension, this product
%    grid has order 2**LEVEL_MAX + 1.
%
%    We will say a sparse grid has total level LEVEL if each point in the
%    grid has a total level of LEVEL or less.
%
%    The "level" of a point is determined as the sum of the levels of the
%    point in each spatial dimension.
%
%    The level of a point in a single spatial dimension I is determined as
%    the level, between 0 and LEVEL_MAX, at which the point's I'th index
%    would have been generated.
%
%
%    This description is terse and perhaps unenlightening.  Keep in mind
%    that the product grid is the product of 1D grids,
%    that the 1D grids are built up by levels, having
%    orders (total number of points ) 1, 3, 5, 9, 17, 33 and so on,
%    and that these 1D grids are nested, so that each point in a 1D grid
%    has a first level at which it appears.
%
%    Our procedure for generating the points of a sparse grid, then, is
%    to choose a value LEVEL_MAX, to generate the full product grid,
%    but then only to keep those points on the full product grid whose
%    LEVEL is less than or equal to LEVEL_MAX.  
%
%
%    Note that this routine is really just testing out the idea of
%    determining the level.  Our true desire is to be able to start
%    with a value LEVEL, and determine, in a straightforward manner,
%    all the points that are generated exactly at that level, or
%    all the points that are generated up to and including that level.
%
%    This allows us to generate the new points to be added to one sparse
%    grid to get the next, or to generate a particular sparse grid at once.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 November 2007
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
%    Input, integer LEVEL_MAX, controls the size of the final sparse grid.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer TEST_NUM, the number of points to be tested.
%
%    Input, integer TEST_VAL(DIM_NUM,TEST_NUM), the indices of the points 
%    to be tested.  Normally, each index would be between 0 and 2**LEVEL_MAX.
%
%    Output, integer TEST_LEVEL(TEST_NUM), the value of LEVEL at which the
%    point would first be generated, assuming that a standard sequence of
%    nested grids is used.
%
  if ( level_max == 0 )
    test_level(1:test_num) = 0;
    return
  end

  order = 2^level_max + 1;

  for j = 1 : test_num

    test_level(j) = index_to_level_closed ( dim_num, test_val(1:dim_num,j), ...
      order, level_max );

  end

  return
end
