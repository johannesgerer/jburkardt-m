function value = box_01_contains_point_2d ( p )

%*****************************************************************************80
%
%% BOX_01_CONTAINS_POINT_2D determines if a point is inside a unit box in 2D.
%
%  Discussion:
%
%    A unit box in 2D is a rectangle with sides aligned on coordinate
%    axes.  It can be described as the set of points P satisfying:
%
%      0 <= P(1:2) <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(2), the point to be checked.
%
%    Output, logical VALUE, is TRUE if P is inside the box.
%
  value = 0;

  for i = 1 : 2
    if ( p(i) < 0.0 | 1.0 < p(i) )
      return
    end
  end

  value = 1;

  return
end
