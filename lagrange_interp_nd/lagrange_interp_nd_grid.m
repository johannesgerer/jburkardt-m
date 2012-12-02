function xd = lagrange_interp_nd_grid ( m, n_1d, a, b, nd )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_GRID sets an M-dimensional Lagrange interpolant.
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
%    Input, real A(M), B(M), the lower and upper interval endpoints in 
%    each dimension.
%
%    Input, integer ND, the number of points in the product grid.
%
%    Output, real XD(M,ND), the points at which data was sampled.
%
    xd = zeros ( m, nd );
    for i = 1 : m
      n = n_1d(i);
      x_1d(1:n) = cc_compute_points ( n );
      x_1d(1:n) = 0.5 * ( ( 1.0 - x_1d(1:n) ) * a(i) ...
                        + ( 1.0 + x_1d(1:n) ) * b(i) );
      xd = r8vec_direct_product ( i, n, x_1d, m, nd, xd );
    end

  return
end
