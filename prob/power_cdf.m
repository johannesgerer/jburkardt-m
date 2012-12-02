function cdf = power_cdf ( x, a, b )

%*****************************************************************************80
%
%% POWER_CDF evaluates the Power CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
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
%    0.0 < A, 0.0 < B,
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0.0 )
    cdf = 0.0;
  elseif ( x <= b )
    cdf = ( x / b )^a;
  else
    cdf = 1.0;
  end

  return
end
