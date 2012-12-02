function n_side = grid_side ( m, n )

%*****************************************************************************80
%
%% GRID_SIDE finds the smallest M-D grid containing at least N points.
%
%  Discussion:
%
%    Each coordinate of the grid will have N_SIDE distinct values.
%    Thus the total number of points in the grid is N_SIDE**M.
%    This routine seeks the smallest N_SIDE such that N <= N_SIDE**M.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points to generate.
%
%    Output, integer N_SIDE, the length of one side of the smallest
%    grid in M dimensions that contains at least N points.
%
  if ( n <= 0 )
    n_side = 0;
    return;
  end

  if ( m <= 0 )
    n_side = -1;
    return;
  end

  exponent = 1.0 / m;

  n_side = floor ( ( real ( n ) ) .^ exponent );

  if ( ( n_side .^ m ) < n )
    n_side = n_side + 1;
  end

  return
end
