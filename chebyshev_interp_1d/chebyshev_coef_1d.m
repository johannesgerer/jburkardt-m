function [ c, xmin, xmax ] = chebyshev_coef_1d ( nd, xd, yd )

%*****************************************************************************80
%
%% CHEBYSHEV_COEF_1D determines the Chebyshev interpolant coefficients.
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
%    Output, real C(ND,1), the Chebyshev coefficients.
%
%    Output, real XMIN, XMAX, the interpolation interval.
%
  if ( nd == 1 )
    xmin = xd(1);
    xmax = xd(1);
    c = 1.0;
    return
  end

  xmin = min ( xd );
  xmax = max ( xd );
%
%  Map XD to [-1,+1].
%
  x = ( 2.0 * xd - xmin - xmax ) / ( xmax - xmin );
%
%  Form the Chebyshev Vandermonde matrix.
%
  a = cos ( acos ( x ) * ( 0 : nd - 1 ) );
%
%  Solve for the expansion coefficients.
%
  c = a \ yd;

  return
end
