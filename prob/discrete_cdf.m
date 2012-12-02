function cdf = discrete_cdf ( x, a, b )

%*****************************************************************************80
%
%% DISCRETE_CDF evaluates the Discrete CDF.
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
%    Input, integer X, the item whose probability is desired.
%
%    Input, integer A, the number of probabilities assigned.
%
%    Input, real B(A), the relative probabilities of outcomes
%    1 through A.  Each entry must be nonnegative.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 1 )
    cdf = 0.0;
  elseif ( x < a )
    cdf = sum ( b(1:x) ) / sum ( b(1:a) );
  elseif ( a <= x )
    cdf = 1.0;
  end

  return
end
