function cdf = cardioid_cdf ( x, a, b )

%*****************************************************************************80
%
%% CARDIOID_CDF evaluates the Cardioid CDF.
%
%  Discussion:
%
%    The angle X is assumed to lie between A - PI and A + PI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameters of the PDF.
%    0.0 <= B <= 0.5.
%
%    Output, real CDF, the value of the PDF.
%
  if ( x <= a - pi )
    cdf = 0.0;
  elseif ( x < a + pi )
    cdf = ( pi + x - a + 2.0 * b * sin ( x - a ) ) / ( 2.0 * pi );
  else
    cdf = 1.0;
  end

  return
end
