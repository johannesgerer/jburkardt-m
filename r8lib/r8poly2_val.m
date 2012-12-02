function [ y, yp, ypp ] = r8poly2_val ( x1, y1, x2, y2, x3, y3, x )

%*****************************************************************************80
%
%% R8POLY2_VAL evaluates a parabola defined by three data values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, Y1, X2, Y2, X3, Y3, three pairs of data.
%    If the X values are distinct, then all the Y values represent
%    actual values of the parabola.
%
%    Three special cases are allowed:
%
%      X1 == X2 /= X3: Y2 is the derivative at X1;
%      X1 /= X2 == X3: Y3 is the derivative at X3;
%      X1 == X2 == X3: Y2 is the derivative at X1, and
%                      Y3 is the second derivative at X1.
%
%    Input, real X, an abscissa at which the parabola is to be
%    evaluated.
%
%    Output, real Y, YP, YPP, the values of the parabola and
%    its first and second derivatives at X.
%

%
%  If any X's are equal, put them and the Y data first.
%
  if ( x1 == x2 && x2 == x3 )
    distinct = 1;
  elseif ( x1 == x2 )
    distinct = 2;
  elseif ( x1 == x3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY2_VAL - Fatal error!\n' );
    fprintf ( 1, '  X1 = X3 =/= X2.\n' );
    fprintf ( 1, '  X1 = %f\n', x1 );
    fprintf ( 1, '  X2 = %f\n', x2 );
    fprintf ( 1, '  X3 = %f\n', x3 );
    error ( 'R8POLY2_VAL - Fatal error!' );
  elseif ( x2 == x3 )
    distinct = 2;
    [ x1, x2 ] = r8_swap ( x1, x2 );
    [ x2, x3 ] = r8_swap ( x2, x3 );
    [ y1, y3 ] = r8_swap ( y1, y2 );
    [ y2, y3 ] = r8_swap ( y2, y3 );
  else
    distinct = 3;
  end
%
%  Set up the coefficients.
%
  if ( distinct == 1 )

    dif1 = y2;
    dif2 = 0.5 * y3;

  elseif ( distinct == 2 )

    dif1 = y2;
    dif2 = ( ( y3 - y1 ) / ( x3 - x1 ) - y2 ) / ( x3 - x2 );

  elseif ( distinct == 3 )

    dif1 = ( y2 - y1 ) / ( x2 - x1 );
    dif2 =  ( ( y3 - y1 ) / ( x3 - x1 ) ...
            - ( y2 - y1 ) / ( x2 - x1 ) ) / ( x3 - x2 );

  end
%
%  Evaluate.
%
  y = y1 + ( x - x1 ) * dif1 + ( x - x1 ) * ( x - x2 ) * dif2;
  yp = dif1 + ( 2.0 * x - x1 - x2 ) * dif2;
  ypp = 2.0 * dif2;

  return
end
