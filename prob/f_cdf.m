function cdf = f_cdf ( x, m, n )

%*****************************************************************************80
%
%% F_CDF evaluates the F central CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Formula 26.5.28
%    Abramowitz and Stegun,
%    Handbook of Mathematical Functions.
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, integer M, N, the parameters of the PDF.
%    1 <= M,
%    1 <= N.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0.0 )

    cdf = 0.0;

  else

    arg1 = 0.5 * n;
    arg2 = 0.5 * m;
    arg3 = n / ( n + m * x );

    cdf = beta_inc ( arg1, arg2, arg3 );

  end

  return
end
