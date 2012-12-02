function cdf = deranged_cdf ( x, a )

%*****************************************************************************80
%
%% DERANGED_CDF evaluates the Deranged CDF.
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
%    Input, integer X, the maximum number of items in their correct places.
%    0 <= X <= A.
%
%    Input, integer A, the number of items.
%    1 <= A.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < 0 | a < x )
    cdf = 0.0;
  else
    sum2 = 0;
    for x2 = 0 : x
      cnk = binomial_coef ( a, x2 );
      dnmk = deranged_enum ( a-x2 );
      sum2 = sum2 + cnk * dnmk;
    end
    nfact = i4_factorial ( a );
    cdf = sum2 / nfact;
  end

  return
end
