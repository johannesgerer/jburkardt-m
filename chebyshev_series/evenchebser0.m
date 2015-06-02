function y0 = evenchebser0 ( x, coef, nc )

%*****************************************************************************80
%
%% EVENCHEBSER0 evaluates an even Chebyshev series.
%
%  Discussion:
%
%    This function implements Clenshaw's modification of his
%    algorithm for even series.
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
%    Gerhard Maess,
%    Vorlesungen ueber Numerische Mathematik II, Analysis,
%    Berlin, Akademie_Verlag, 1984-1988,
%    ISBN: 978-3764318840,
%    LC: QA297.M325.  
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

  y0 = 0.5 * ( b0 - b2 );

  return
end
