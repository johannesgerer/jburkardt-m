function cdf = uniform_cdf ( x, a, b )

%*****************************************************************************80
%
%% UNIFORM_CDF evaluates the Uniform CDF.
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
%    Input, real X, the argument of the CDF.
%
%    Input, real A, B, the parameters of the PDF.
%    A < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x < a )
    cdf = 0.0;
  elseif ( b < x )
    cdf = 1.0;
  else
    cdf = ( x - a ) / ( b - a );
  end

  return
end
