function cdf = weibull_discrete_cdf ( x, a, b )

%*****************************************************************************80
%
%% WEIBULL_DISCRETE_CDF evaluates the Discrete Weibull CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the argument of the CDF.
%    0 <= X.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= A <= 1.0,
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 0 )
    cdf = 0.0
  else
    cdf = 1.0 - ( 1.0 - a )^( ( x + 1 )^b );
  end

  return
end
