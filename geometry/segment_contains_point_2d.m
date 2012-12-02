function [ u, v ] = segment_contains_point_2d ( p1, p2, p )

%*****************************************************************************80
%
%% SEGMENT_CONTAINS_POINT_2D reports if a line segment contains a point in 2D.
%
%  Discussion:
%
%    A line segment is the finite portion of a line that lies between
%    two points.
%
%    In exact arithmetic, point P is on the line segment between
%    P1 and P2 if and only if 0 <= U <= 1 and V = 0.
%
%    Thanks to Lars Cremean for corecting a MATLAB error in which
%    elementwise multiplication was needed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P1(2), P2(2), the endpoints of the line segment.
%
%    Input, real P(2), a point to be tested.
%
%    Output, real U, the coordinate of P3 along the axis from
%    with origin at P1 and unit at P2.
%
%    Output, real V, the magnitude of the off-axis portion of the
%    vector P3-P1, measured in units of (P2-P1).
%
  dim_num = 2;

  normsq = sum ( ( p2(1:dim_num) - p1(1:dim_num) ).^2 );

  if ( normsq == 0.0 )

    if ( p(1:dim_num) == p1(1:dim_num) )
      u = 0.5;
      v = 0.0;
    else
      u = 0.5;
      v = Inf;
    end

  else
    
    u = ( ( p(1:dim_num) - p1(1:dim_num) ) ...
        * ( p2(1:dim_num) - p1(1:dim_num) )' ) / normsq;

    v = sqrt ( ( ( u - 1.0 ) * p1(1) - u * p2(1) + p(1) ).^2 ...
             + ( ( u - 1.0 ) * p1(2) - u * p2(2) + p(2) ).^2 ) ...
             / sqrt ( normsq );

  end

  return
end
