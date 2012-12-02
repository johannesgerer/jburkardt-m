function type = r82poly2_type ( a, b, c, d, e, f )

%*****************************************************************************80
%
%% R82POLY2_TYPE analyzes a second order polynomial in two variables.
%
%  Discussion:
%
%    The polynomial has the form
%
%      A x^2 + B y^2 + C xy + Dx + Ey + F = 0
%
%    The possible types of the solution set are:
%
%     1: a hyperbola;
%        9x^2 -  4y^2       -36x - 24y -  36 = 0
%     2: a parabola;
%        4x^2 +  1y^2 - 4xy + 3x -  4y +   1 = 0;
%     3: an ellipse;
%        9x^2 + 16y^2       +36x - 32y -  92 = 0;
%     4: an imaginary ellipse (no real solutions);
%         x^2 +   y^2       - 6x - 10y + 115 = 0;
%     5: a pair of intersecting lines;
%                        xy + 3x -   y -   3 = 0
%     6: one point;
%         x^2 +  2y^2       - 2x + 16y +  33 = 0;
%     7: a pair of distinct parallel lines;
%                 y^2            -  6y +   8 = 0
%     8: a pair of imaginary parallel lines (no real solutions);
%                 y^2            -  6y +  10 = 0
%     9: a pair of coincident lines.
%                 y^2            -  2y +   1 = 0
%    10: a single line;
%                             2x -   y +   1 = 0;
%    11; all space;
%                                          0 = 0;
%    12; no solutions;
%                                          1 = 0;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger, editor,
%    CRC Standard Mathematical Tables and Formulae,
%    CRC Press, 30th Edition, 1996, pages 282-284.
%
%  Parameters:
%
%    Input, real A, B, C, D, E, F, the coefficients.
%
%    Output, integer TYPE, indicates the type of the solution set.
%

%
%  Handle the degenerate case.
%
  if ( a == 0.0 && b == 0.0 && c == 0.0 )
    if ( d == 0.0 && e == 0.0 )
      if ( f == 0.0 )
        type = 11;
      else
        type = 12;
      end
    else
      type = 10;
    end
    return
  end

  delta = 8.0 * a * b * f ...
        + 2.0 * c * e * d ...
        - 2.0 * a * e * e ...
        - 2.0 * b * d * d ...
        - 2.0 * f * c * c;

  j = 4.0 * a * b - c * c;

  if ( delta ~= 0.0 )
    if ( j < 0.0 )
      type = 1;
    elseif ( j == 0.0 )
      type = 2;
    elseif ( 0.0 < j )
      if ( r8_sign ( delta ) ~= r8_sign ( a + b ) )
        type = 3;
      elseif ( r8_sign ( delta ) == r8_sign ( a + b ) )
        type = 4;
      end
    end
  elseif ( delta == 0.0 )
    if ( j < 0.0 )
      type = 5;
    elseif ( 0.0 < j )
      type = 6;
    elseif ( j == 0.0 )

      k = 4.0 * ( a + b ) * f - d * d - e * e;

      if ( k < 0.0 )
        type = 7;
      elseif ( 0.0 < k )
        type = 8;
      elseif ( k == 0.0 )
        type = 9;
      end

    end
  end

  return
end
