function cdf = lorentz_cdf ( x )

%*****************************************************************************80
%
%% LORENTZ_CDF evaluates the Lorentz CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Output, real CDF, the value of the CDF.
%
  cdf = 0.5 + atan ( x ) / pi;

  return
end
