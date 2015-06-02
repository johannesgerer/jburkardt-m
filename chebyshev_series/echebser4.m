function [ y0, y1, y2, y3, y4 ] = echebser4 ( x, coef, nc )

%*****************************************************************************80
%
%% ECHEBSER4 evaluates a Chebyshev series and four derivatives.
%
%  Discussion:
%
%    This function implements a modification and extension of
%    Maess's algorithm.  Table 6.5.1 on page 164 of the reference
%    gives an example for treating the first derivative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2014
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
%    Output, real Y0, Y1, Y2, Y3, Y4, the value of the 
%    Chebyshev series and its first four derivatives at X.
%
  b0 = coef(nc);
  b1 = 0.0;
  b2 = 0.0;
  c0 = coef(nc);
  c1 = 0.0;
  c2 = 0.0;
  d0 = coef(nc);
  d1 = 0.0;
  d2 = 0.0;
  e0 = coef(nc);
  e1 = 0.0;
  e2 = 0.0;
  f0 = coef(nc);
  f1 = 0.0;
  f2 = 0.0;

  for i = nc - 1 : -1 : 1

    b2 = b1;
    b1 = b0;
    b0 = coef(i) - b2 + 2.0 * x * b1;

    if ( 1 < i )
      c2 = c1;
      c1 = c0;
      c0 = b0 - c2 + 2.0 * x * c1;
    end

    if ( 2 < i )
      d2 = d1;
      d1 = d0;
      d0 = c0 - d2 + 2.0 * x * d1;
    end

    if ( 3 < i )
      e2 = e1;
      e1 = e0;
      e0 = d0 - e2 + 2.0 * x * e1;
    end

    if ( 4 < i )
      f2 = f1;
      f1 = f0;
      f0 = e0 - f2 + 2.0 * x * f1;
    end

  end

  y0 = ( b0 - b2 )        / 2.0;
  y1 =   c0 - c2;
  y2 = ( d0 - d2 ) *  2.0 * 2.0;
  y3 = ( e0 - e2 ) *  6.0 * 4.0;
  y4 = ( f0 - f2 ) * 24.0 * 8.0;

  return
end
