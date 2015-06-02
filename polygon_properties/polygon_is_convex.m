function value = polygon_is_convex ( n, v )

%*****************************************************************************80
%
%% POLYGON_IS_CONVEX determines whether a polygon is convex.
%
%  Discussion:
%
%    If the polygon has less than 3 distinct vertices, it is
%    classified as convex degenerate.
%
%    If the polygon "goes around" more than once, it is classified
%    as NOT convex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Schorn and Frederick Fisher,
%    Testing the Convexity of a Polygon,
%    Graphics Gems IV, 
%    edited by Paul Heckbert,
%    AP Professsional, 1994.
%
%  Parameters
%
%    Input, integer N, the number of vertices.
%
%    Input, real V(2,N), the coordinates of the vertices of the polygon.  
%
%    Output, integer VALUE:
%    -1, the polygon is not convex;
%     0, the polygon has less than 3 vertices; it is "degenerately" convex;
%     1, the polygon is convex and counterclockwise;
%     2, the polygon is convex and clockwise.
%
  RAD_TO_DEG = 180.0 / pi;

  CONVEX_CCW = 1;
  CONVEX_CW = 2;
  DEGENERATE_CONVEX = 0;
  NOT_CONVEX = -1;
  tol = 1.0;

  exterior_total = 0.0;
%
%  If there are not at least 3 distinct vertices, we are done.
%
  if ( n < 3 )
    value = DEGENERATE_CONVEX;
    return
  end

  sense = 0.0;
%
%  Consider each polygonal vertex I.
%
  for i = 1 : n

    ip1 = i + 1;
    if ( n < ip1 )
      ip1 = ip1 - n;
    end

    ip2 = i + 2;
    if ( n < ip2 )
      ip2 = ip2 - n;
    end

    dot =   ( v(1,ip2) - v(1,ip1) ) * ( v(1,i) - v(1,ip1) ) ...
          + ( v(2,ip2) - v(2,ip1) ) * ( v(2,i) - v(2,ip1) );

    cross =   ( v(1,ip2) - v(1,ip1) ) * ( v(2,i) - v(2,ip1) ) ...
            - ( v(1,i)   - v(1,ip1) ) * ( v(2,ip2) - v(2,ip1) );

    angle = atan2 ( cross, dot );
%
%  See if the turn defined by this vertex is our first indication of
%  the "sense" of the polygon, or if it disagrees with the previously
%  defined sense.
%
    if ( sense == 0.0 )

      if ( angle < 0.0 )
        sense = -1.0;
      elseif ( 0.0 < angle )
        sense = +1.0;
      end

    elseif ( sense == 1.0 )

      if ( angle < 0.0 )
        value = NOT_CONVEX;
        return
      end

    elseif ( sense == -1.0 )

      if ( 0.0 < angle )
        value = NOT_CONVEX;
        return
      end

    end
%
%  If the exterior total is greater than 360, then the polygon is
%  going around again.
%
    angle = atan2 ( -cross, -dot );

    exterior_total = exterior_total + angle;

    if ( 360.0 + tol < abs ( exterior_total ) * RAD_TO_DEG )
      value = NOT_CONVEX;
      return
    end

  end

  if ( sense == 1.0 )
    value = CONVEX_CCW;
  elseif ( sense == -1.0 )
    value = CONVEX_CW;
  end

  return
end
