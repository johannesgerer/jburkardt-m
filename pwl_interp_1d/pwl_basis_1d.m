function bk = pwl_basis_1d ( nd, xd, k, ni, xi )

%*****************************************************************************80
%
%% PWL_BASIS_1D evaluates a 1D piecewise linear basis function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%
%    Input, real XD(ND,1), the data points.
%
%    Input, integer K, the index of the desired basis function,
%    1 <= K <= ND.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points.
%
%    Output, real BK(NI,1), the basis function at the interpolation points.
%
  yd = zeros ( nd, 1 );
  yd(k) = 1.0;
 
  [ k, k ] = histc ( xi, xd );
%
%  Use extrapolation, if necessary.
%
  k ( k == 0 ) = 1;
  k ( k == nd ) = nd - 1;

  t = ( xi - xd(k,1) ) ./ ( xd(k+1,1) - xd(k,1) );
  bk = ( 1 - t ) .* yd(k) + t .* yd(k+1);
  
  return
end
