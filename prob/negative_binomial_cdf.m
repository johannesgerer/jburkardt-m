function cdf = negative_binomial_cdf ( x, a, b )

%*****************************************************************************80
%
%% NEGATIVE_BINOMIAL_CDF evaluates the Negative Binomial CDF.
%
%  Discussion:
%
%    A simple summing approach is used.
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
%    Input, integer X, the argument of the CDF.
%
%    Input, integer A, a parameter of the PDF.
%    0 <= A.
%
%    Input, real B, a parameter of the PDF.
%    0 < B <= 1.
%
%    Output, real CDF, the value of the CDF.
%
  cdf = 0.0;

  for y = a : x

    cnk = binomial_coef ( y-1, a-1 );

    pdf = cnk * b^a * ( 1.0 - b )^( y - a );

    cdf = cdf + pdf;

  end

  return
end
