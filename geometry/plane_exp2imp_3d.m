function [ a, b, c, d ] = plane_exp2imp_3d ( p1, p2, p3 )

%*****************************************************************************80
%
%% PLANE_EXP2IMP_3D converts an explicit plane to implicit form in 3D.
%
%  Discussion:
%
%    The explicit form of a plane in 3D is
%
%      the plane through P1, P2 and P3.
%
%    The implicit form of a plane in 3D is
%
%      A * X + B * Y + C * Z + D = 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2005
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
%    Input, real P1(3), P2(3), P3(3), three points on the plane.
%
%    Output, real A, B, C, D, coefficients which describe 
%    the plane.
%
  dim_num = 3;

  a = ( p2(2) - p1(2) ) * ( p3(3) - p1(3) ) ...
    - ( p2(3) - p1(3) ) * ( p3(2) - p1(2) );

  b = ( p2(3) - p1(3) ) * ( p3(1) - p1(1) ) ...
    - ( p2(1) - p1(1) ) * ( p3(3) - p1(3) );

  c = ( p2(1) - p1(1) ) * ( p3(2) - p1(2) ) ...
    - ( p2(2) - p1(2) ) * ( p3(1) - p1(1) );

  d = - p2(1) * a - p2(2) * b - p2(3) * c;

  return
end
