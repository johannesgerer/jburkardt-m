function cdf = gumbel_cdf ( x )

%*****************************************************************************80
%
%% GUMBEL_CDF evaluates the Gumbel CDF.
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
%
%    Output, real CDF, the value of the CDF.
%
  cdf = exp ( - exp ( - x ) );

  return
end
