function [ y0, y1 ] = oddchebser1 ( x, coef, nc )

%*****************************************************************************80
%
%% ODDCHEBSER1 evaluates an odd Chebyshev series and the first derivative.
%
%  Discussion:
%
%    This function implements a modification and extension of
%    Clenshaw's algorithm.
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
%    Output, real Y1, the value of the 1st derivative of the
%    Chebyshev series at X.
%
  coefi = 2.0 * coef(nc);
  b0 = coefi;
  b1 = 0.0;
  b2 = 0.0;
  c0 = coefi;
  c1 = 0.0;
  c2 = 0.0;

  x2 = 4.0 * x * x - 2.0;

  for i = nc - 1 : -1 : 1

    b2 = b1;
    b1 = b0;
    coefi = 2.0 * coef(i) - coefi;
    b0 = coefi - b2 + x2 * b1;

    if ( 1 < i )
      c2 = c1;
      c1 = c0;
      c0 = b0 - c2 + x2 * c1;
    end

  end

  y0 = ( b0 - b2 ) * 0.5 * x;
  y1 = ( c0 - c2 ) * 4.0 * x * x + ( b0 - b2 ) * 0.5;

  return
end
