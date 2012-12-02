function cdf = uniform_01_cdf ( x )

%*****************************************************************************80
%
%% UNIFORM_01_CDF evaluates the Uniform 01 CDF.
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
%    Output, real CDF, the value of the CDF.
%
  if ( x < 0.0 )
    cdf = 0.0;
  elseif ( 1.0 < x )
    cdf = 1.0;
  else
    cdf = x;
  end

  return
end
