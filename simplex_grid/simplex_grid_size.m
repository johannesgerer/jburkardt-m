function ng = simplex_grid_size ( m, n )

%*****************************************************************************80
%
%% SIMPLEX_GRID_SIZE counts the grid points inside a simplex.
%
%  Discussion:
%
%    The size of a grid with parameters M, N is C(M+N,N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of subintervals.
%
%    Output, integer NG, the number of grid points.
%
  ng = 1;
  for i = 1 : m
    ng = ( ng * ( n + i ) ) / i;
  end

  return
end
