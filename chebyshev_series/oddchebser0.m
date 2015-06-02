function y0 = oddchebser0 ( x, coef, nc )

%*****************************************************************************80
%
%% ODDCHEBSER0 evaluates an odd Chebyshev series.
%
%  Discussion:
%
%    This function implements Clenshaw's modification of  his algorithm
%    for odd series.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    Manfred Zimmer
%
%  Reference:
%
%    Charles Clenshaw,
%    Mathematical Tables, Volume 5,
%    Chebyshev series for mathematical functions,
%    London, 1962.
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%    -1 <= X <= +1.
%
%    Input, real COEF(NC), the Chebyshev series.
%
%    Input, integer NC, the number of terms in the series.
%    0 < NC.
%
%    Output, real Y0, the value of the Chebyshev series at X.
%
  b0 = coef(nc);
  b1 = 0.0;
  b2 = 0.0;

  x2 = 4.0 * x * x - 2.0;

  for i = nc - 1 : -1 : 1

    b2 = b1;
    b1 = b0;
    b0 = coef(i) - b2 + x2 * b1;

  end

  y0 = ( b0 - b1 ) * x;

  return
end
