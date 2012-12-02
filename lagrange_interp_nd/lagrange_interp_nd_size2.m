function nd = lagrange_interp_nd_size2 ( m, ind )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_ND_SIZE2 sizes an M-dimensional Lagrange interpolant.
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
%    Input, integer IND(M), the index or level of the 1D rule 
%    to be used in each dimension.
%
%    Output, integer ND, the number of points in the product grid.
%
  nd = 1;
  for i = 1 : m
    n = order_from_level_135 ( ind(i) );
    nd = nd * n;
  end

  return
end
