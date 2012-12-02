function yi = chebyshev_value_1d ( nd, c, xmin, xmax, ni, xi )

%*****************************************************************************80
%
%% CHEBYSHEV_VALUE_1D evaluates a Chebyshev interpolant, given its coefficients.
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
%    Input, real C(ND,1), the Chebyshev coefficients.
%
%    Output, real XMIN, XMAX, the interpolation interval.
%
%    Input, integer NI, the number of interpolation points.
%
%    Input, real XI(NI,1), the interpolation points, which
%    must be each be in the interval [XMIN,XMAX].
%
%    Output, real YI(NI,1), the interpolated values.
%
  if ( nd == 1 )
    yi = c;
    return;
  end
%
%  Map XI to [-1,+1].
%
  x = ( 2.0 * xi - xmin - xmax ) / ( xmax - xmin );

  a = cos ( acos ( x ) * ( 0 : nd - 1 ) );

  yi = a * c;

  return
end
