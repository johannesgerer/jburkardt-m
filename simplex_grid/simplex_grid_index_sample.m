function [ g, seed ] = simplex_grid_index_sample ( m, n, seed )

%*****************************************************************************80
%
%% SIMPLEX_GRID_INDEX_SAMPLE returns a random simplex grid index.
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
%    Input, integer N, the number of subintervals in each dimension.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer G(M+1), a randomly selected index in the simplex grid.
%
%    Output, integer SEED, the updated random number seed.
%
  [ g, seed ] = comp_random ( n, m + 1, seed );
  g = g(:);

  return
end
