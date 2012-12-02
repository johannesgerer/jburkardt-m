function cdf = exponential_01_cdf ( x )

%*****************************************************************************80
%
%% EXPONENTIAL_01_CDF evaluates the Exponential 01 CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= 0.0 )
    cdf = 0.0;
  else
    cdf = 1.0 - exp ( - x );
  end

  return
end
