function zi = lagrange_interp_2d ( mx, my, xd_1d, yd_1d, zd, ni, xi, yi )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_2D evaluates the Lagrange interpolant for a product grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MX, MY, the polynomial degree in X and Y.
%
%    Input, real XD_1D(MX+1,1), YD_1D(MY+1,1), the 1D data locations.
%
%    Input, real ZD((MX+1)*(MY+1)), the 2D array of data values,
%    stored as a vector.
%
%    Input, integer NI, the number of 2D interpolation points.
%
%    Input, real XI(NI,1), YI(NI,1), the 2D interpolation points.
%
%    Output, real ZI(NI,1), the interpolated values.
%
  zi = zeros ( ni, 1 );
  for k = 1 : ni
    l = 0;
    for i = 1 : mx + 1
      for j = 1 : my + 1
        l = l + 1;
        zi(k) = zi(k) + zd(l) ...
          * lagrange_basis_function_1d ( mx, xd_1d, i, xi(k) ) ...
          * lagrange_basis_function_1d ( my, yd_1d, j, yi(k) );
      end
    end
  end

  return
end
