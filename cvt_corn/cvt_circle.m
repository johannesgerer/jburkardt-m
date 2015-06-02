function p_xy = cvt_circle ( r, np, p_xy, p_type )

%*****************************************************************************80
%
%% CVT_CIRCLE applies the CVT algorithm to points on a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real R, the radius of the circle.
%
%    Input, integer NP, the number of points.
%
%    Input, real P_XY(2,NP), the point coordinates.
%
%    Input, integer P_TYPE(NP),
%    1, the point is constrained to the circle.
%    2, the point is constrainted to the disk.
%
%    Output, real P_XY(2,NP), the updated point coordinates.
%
  for i = 1 : 30
    p_xy = cvt_circle_step ( r, np, p_xy, p_type );
  end

  return
end

