function cdf = dipole_cdf ( x, a, b )

%*****************************************************************************80
%
%% DIPOLE_CDF evaluates the Dipole CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    A is arbitrary, but represents an angle, so only 0 <= A <= 2 * PI
%    is interesting, and -1.0 <= B <= 1.0.
%
%    Output, real CDF, the value of the CDF.
%
  cdf = 0.5 + ( 1.0 / pi ) * atan ( x ) + b * b * ( x * cos ( 2.0 * a ) ...
    - sin ( 2.0 * a ) ) / ( pi * ( 1.0 + x * x ) );

  return
end
