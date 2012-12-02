function cdf = quasigeometric_cdf ( x, a, b )

%*****************************************************************************80
%
%% QUASIGEOMETRIC_CDF evaluates the Quasigeometric CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the number of trials.
%
%    Input, real A, the probability of 0 successes.
%    0.0 <= A <= 1.0.
%
%    Input, real B, the depreciation constant.
%    0.0 <= B < 1.0.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 0 )
    cdf = 0.0;
  elseif ( x == 0 ) 
    cdf = a;
  elseif ( b == 0.0 )
    cdf = 1.0;
  else
    cdf = a + ( 1.0 - a ) * ( 1.0 - b^x );
  end

  return
end
