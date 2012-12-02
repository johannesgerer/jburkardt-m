function cdf = beta_cdf ( x, a, b )

%*****************************************************************************80
%
%% BETA_CDF evaluates the Beta CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2004
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
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0.0 )
    cdf = 0.0;
  elseif ( x <= 1.0 )
    cdf = beta_inc ( a, b, x );
  else
    cdf = 1.0;
  end

  return
end
