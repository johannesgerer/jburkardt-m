function zi = lagrange_interp_nd_value2 ( m, ind, a, b, nd, zd, ni, xi )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_VALUE2 evaluates an ND Lagrange interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2012
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
%    Input, real ZD(ND), the function evaluated at the points XD.
%
%    Input, integer NI, the number of points at which the interpolant
%    is to be evaluated.
%
%    Input, real XI(M,NI), the points at which the interpolant is to be
%    evaluated.
%
%    Output, real ZI(NI), the interpolant evaluated at the points XI.
%
  zi = zeros(ni,1);

  for j = 1 : ni

    w = ones ( nd, 1 );

    for i = 1 : m
      n_1d = order_from_level_135 ( ind(i) );
      x_1d(1:n_1d) = cc_compute_points ( n_1d );
      x_1d(1:n_1d) = 0.5 * ( ( 1.0 - x_1d(1:n_1d) ) * a(i) ...
                           + ( 1.0 + x_1d(1:n_1d) ) * b(i) );
      value = lagrange_basis_1d ( n_1d, x_1d, 1, xi(i,j) );
      w = r8vec_direct_product2 ( i, n_1d, value, m, nd, w );
    end

    zi(j) = zd' * w;

  end

  return
end
