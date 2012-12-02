function cdf = anglit_cdf ( x )

%*****************************************************************************80
%
%% ANGLIT_CDF evaluates the Anglit CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
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
  if ( x <  -0.25 * pi )
    cdf = 0.0;
  elseif ( x < 0.25 * pi )
    cdf = 0.5 - 0.5 * cos ( 2.0 * x + pi / 2.0 );
  else
    cdf = 1.0;
  end

  return
end
