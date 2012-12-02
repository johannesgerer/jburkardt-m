function value = box_contains_point_2d ( box, p )

%*****************************************************************************80
%
%% BOX_CONTAINS_POINT_2D determines if a point is inside a box in 2D.
%
%  Discussion:
%
%    A box in 2D is a rectangle with sides aligned on coordinate
%    axes.  It can be described by its low and high corners,
%    as the set of points P satisfying:
%
%      BOX(1:2,1) <= P(1:2) <= BOX(1:2,2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real BOX(2,2), the corners of the box.
%
%    Input, real P(2), the point to be checked.
%
%    Output, logical VALUE, is TRUE if P is inside the box.
%
  value = 0;

  for i = 1 : 2
    if ( p(i) < box(i,1) | box(i,2) < p(i) )
      return
    end
  end

  value = 1;

  return
end
