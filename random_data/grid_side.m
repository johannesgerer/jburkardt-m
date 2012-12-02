function n_side = grid_side ( dim_num, n )

%*****************************************************************************80
%
%% GRID_SIDE finds the smallest grid containing at least N points.
%
%  Discussion:
%
%    Each coordinate of the grid will have N_SIDE distinct values.
%    Thus the total number of points in the grid is N_SIDE**DIM_NUM.
%    This routine seeks the smallest N_SIDE such that N <= N_SIDE**M.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Output, integer N_SIDE, the length of one side of the smallest
%    grid in M dimensions that contains at least N points.
%
  if ( n <= 0 )
    n_side = 0;
    return
  end

  if ( dim_num <= 0 )
    n_side = -1;
    return
  end

  exponent = 1.0 / real ( dim_num );

  n_side = floor ( n^exponent );

  if ( n_side^dim_num < n )
    n_side = n_side + 1;
  end

  return
end
