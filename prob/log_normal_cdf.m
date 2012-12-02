function cdf = log_normal_cdf ( x, a, b )

%*****************************************************************************80
%
%% LOG_NORMAL_CDF evaluates the Lognormal CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    0.0 < X.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0.0 )

    cdf = 0.0;

  else

    logx = log ( x );

    cdf = normal_cdf ( logx, a, b );

  end

  return
end
