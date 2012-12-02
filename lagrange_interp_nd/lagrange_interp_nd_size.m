function nd = lagrange_interp_nd_size ( m, n_1d )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_SIZE sizes an M-dimensional Lagrange interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N_1D(M), the order of the 1D rule to be used
%    in each dimension.
%
%    Output, integer ND, the number of points in the product grid.
%
  nd = prod ( n_1d(1:m) );

  return
end
