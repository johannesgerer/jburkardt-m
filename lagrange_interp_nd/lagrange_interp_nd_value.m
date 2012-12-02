function zi = lagrange_interp_nd_value ( m, n_1d, a, b, nd, zd, ni, xi )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_VALUE evaluates an ND Lagrange interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2012
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
      n = n_1d(i);
      x_1d(1:n) = cc_compute_points ( n );
      x_1d(1:n) = 0.5 * ( ( 1.0 - x_1d(1:n) ) * a(i) ...
                        + ( 1.0 + x_1d(1:n) ) * b(i) );
      value = lagrange_basis_1d ( n, x_1d, 1, xi(i,j) );
      w = r8vec_direct_product2 ( i, n, value, m, nd, w );
    end

    zi(j) = zd' * w;

  end

  return
end
