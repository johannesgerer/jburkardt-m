function cdf = half_normal_cdf ( x, a, b )

%*****************************************************************************80
%
%% HALF_NORMAL_CDF evaluates the Half Normal CDF.
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
%    Input, real A, B, the parameters of the PDF.
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  if ( x <= a )
    cdf = 0.0;
  else
    cdf2 = normal_cdf ( x, a, b );
    cdf = 2.0 * cdf2 - 1.0;
  end 

  return
end
