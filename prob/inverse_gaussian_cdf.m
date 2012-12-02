function cdf = inverse_gaussian_cdf ( x, a, b )

%*****************************************************************************80
%
%% INVERSE_GAUSSIAN_CDF evaluates the Inverse Gaussian CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%    0.0 < X.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < A,
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0.0 )

    cdf = 0.0;

  else

    x1 = sqrt ( b / x ) * ( x - a ) / a;
    cdf1 = normal_01_cdf ( x1 );

    x2 = - sqrt ( b / x ) * ( x + a ) / a;
    cdf2 = normal_01_cdf ( x2 );

    cdf = cdf1 + exp ( 2.0 * b / a ) * cdf2;

  end

  return
end
