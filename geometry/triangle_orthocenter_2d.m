function [ center, flag ] = triangle_orthocenter_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_ORTHOCENTER_2D computes the orthocenter of a triangle in 2D.
%
%  Discussion:
%
%    The orthocenter is defined as the intersection of the three altitudes
%    of a triangle.
%
%    An altitude of a triangle is the line through a vertex of the triangle
%    and perpendicular to the opposite side.
%
%    In geometry, the orthocenter of a triangle is often symbolized by "H".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Adrian Bowyer and John Woodwark,
%    A Programmer's Geometry,
%    Butterworths, 1983.
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real CENTER(2,1), the orthocenter of the triangle.
%
%    Output, logical FLAG, is TRUE if the value could not be computed.
%

%
%  Determine a point P23 common to the line (P2,P3) and
%  its perpendicular through P1.
%
  [ p23, flag ] = line_exp_perp_2d ( t(1:2,2), t(1:2,3), t(1:2,1) );

  if ( flag )
    center(1:2,1) = r8_huge ( );
    return
  end
%
%  Determine a point P31 common to the line (P3,P1) and
%  its perpendicular through P2.
%
  [ p31, flag ] = line_exp_perp_2d ( t(1:2,3), t(1:2,1), t(1:2,2) );

  if ( flag )
    center(1:2,1) = r8_huge ( );
    return
  end
%
%  Determine CENTER, the intersection of the lines (P1,P23) and (P2,P31).
%
  [ ival, center ] = lines_exp_int_2d ( t(1:2,1), p23(1:2,1), t(1:2,2), ...
    p31(1:2,1) );

  if ( ival ~= 1 )
    flag = 1;
    center(1:2,1) = r8_huge ( );
    return
  end

  return
end
