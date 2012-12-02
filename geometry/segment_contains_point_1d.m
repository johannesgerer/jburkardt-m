function t = segment_contains_point_1d ( p1, p2, p )

%*****************************************************************************80
%
%% SEGMENT_CONTAINS_POINT_1D reports if a line segment contains a point in 1D.
%
%  Discussion:
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1, P2, two points defining a line segment.
%    The line segment has T = 0 at P1, and T = 1 at P2.
%
%    Input, real P, a point to be tested.
%
%    Output, real T, the coordinate of P3 in units of (P2-P1).
%    The point P3 is contained in the line segment if 0 <= T <= 1.
%
  unit = p2 - p1;

  if ( unit == 0.0 )

    if ( p == p1 )
      t = 0.5;
    elseif ( p < p1 )
      t = -Inf;
    elseif ( p1 < p )
      t = Inf;
    end

  else

    t = ( p - p1 ) / unit;

  end

  return
end
