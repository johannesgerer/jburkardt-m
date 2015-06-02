function lmax = lebesgue_constant ( n, x, xfun )

%*****************************************************************************80
%
%% LEBESGUE_CONSTANT estimates the Lebesgue constant for a set of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2014
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Jean-Paul Berrut, Lloyd Trefethen,
%    Barycentric Lagrange Interpolation,
%    SIAM Review,
%    Volume 46, Number 3, September 2004, pages 501-517.
%
%  Parameters:
%
%    Input, integer N, the number of interpolation points.
%
%    Input, real X(N), the interpolation points.
%
%    Input, real XFUN(*), the evaluation points.
%
%    Output, real LMAX, an estimate of the Lebesgue constant for the points.
%
  lfun = lebesgue_function ( n, x, xfun );

  lmax = max ( lfun );

  return
end
  
