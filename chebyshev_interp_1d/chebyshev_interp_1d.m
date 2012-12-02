function yi = chebyshev_interp_1d ( nd, xd, yd, ni, xi )

%*****************************************************************************80
%
%% CHEBYSHEV_INTERP_1D determines and evaluates the Chebyshev interpolant.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%    ND must be at least 1.
%
%    Input, real XD(ND,1), the data locations.
%
%    Input, real YD(ND,1), the data values.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points, which
%    must be each be in the interval [ min(XD), max(XD)].
%
%    Output, real YI(NI,1), the interpolated values.
%
  [ c, xmin, xmax ] = chebyshev_coef_1d ( nd, xd, yd );

  yi = chebyshev_value_1d ( nd, c, xmin, xmax, ni, xi );

  return
end
