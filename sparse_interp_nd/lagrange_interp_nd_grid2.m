function xd = lagrange_interp_nd_grid2 ( m, ind, a, b, nd )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_GRID2 sets an M-dimensional Lagrange interpolant.
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
%    Input, integer IND(M), the index or level of the 1D rule to be used
%    in each dimension.
%
%    Input, real A(M), B(M), the lower and upper interval endpoints in 
%    each dimension.
%
%    Input, integer ND, the number of points in the product grid.
%
%    Output, real XD(M,ND), the points at which data was sampled.
%
    xd = zeros ( m, nd );
    for i = 1 : m
      n_1d = order_from_level_135 ( ind(i) );
      x_1d(1:n_1d) = cc_compute_points ( n_1d );
      x_1d(1:n_1d) = 0.5 * ( ( 1.0 - x_1d(1:n_1d) ) * a(i) ...
                           + ( 1.0 + x_1d(1:n_1d) ) * b(i) );
      xd = r8vec_direct_product ( i, n_1d, x_1d, m, nd, xd );
    end

  return
end
