function cdf = uniform_discrete_cdf ( x, a, b )

%*****************************************************************************80
%
%% UNIFORM_DISCRETE_CDF evaluates the Uniform Discrete CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer X, the argument of the CDF.
%
%    Input, integer A, B, the parameters of the PDF.
%    A <= B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < a )
    cdf = 0.0;
  elseif ( b < x )
    cdf = 1.0;
  else
    cdf = ( x + 1 - a ) / ( b + 1 - a );
  end

  return
end
