function [ xmin, ymin ] = minabs ( x1, y1, x2, y2, x3, y3 )

%*****************************************************************************80
%
%% MINABS finds a local minimum of F(X) = A * abs ( X ) + B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, Y1, X2, Y2, X3, Y3, are three sets of
%    data of the form ( X, F(X) ).  The three X values must be distinct.
%
%    Output, real XMIN, YMIN.  XMIN is a point within the interval
%    spanned by X1, X2 and X3, at which F takes its local minimum
%    value YMIN.
%

%
%  Refuse to deal with coincident data.
%
  if ( x1 == x2 | x2 == x3 | x3 == x1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MINABS - Fatal error!\n' );
    fprintf ( 1, '  X values are equal.\n' );
    error ( 'MINABS - Fatal error!' );
  end
%
%  Sort the data.
%
  if ( x2 < x1 )
    [ x1, x2 ] = r8_swap ( x1, x2 );
    [ y1, y2 ] = r8_swap ( y1, y2 );
  end

  if ( x3 < x1 )
    [ x1, x3 ] = r8_swap ( x1, x3 );
    [ y1, y3 ] = r8_swap ( y1, y3 );
  end

  if ( x3 < x2 )
    [ x2, x3 ] = r8_swap ( x2, x3 );
    [ y2, y3 ] = r8_swap ( y2, y3 );
  end
%
%  Now determine the slopes.
%
  slope12 = ( y2 - y1 ) / ( x2 - x1 );
  slope23 = ( y3 - y2 ) / ( x3 - x2 );
  slope13 = ( y3 - y1 ) / ( x3 - x1 );
%
%  Case 1: Minimum must be at an endpoint.
%
  if ( slope13 <= slope12 | 0.0 <= slope12 ) 

    if ( y1 < y3 )
      xmin = x1;
      ymin = y1;
    else
      xmin = x3;
      ymin = y3;
    end
%
%  Case 2: The curve decreases, and decreases faster than the line
%  joining the endpoints.
%
%  Whichever of SLOPE12 and SLOPE23 is the greater in magnitude
%  represents the actual slope of the underlying function.
%  Find where two lines of that slope, passing through the
%  endpoint data, intersect.
%
  else

    slope = max ( abs ( slope12 ), slope23 );

    xmin = 0.5 * ( x1 + x3 + ( y1 - y3 ) / slope );
    ymin = y1 - slope * ( xmin - x1 );

  end

  return
end
