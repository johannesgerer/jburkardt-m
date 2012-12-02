function [ r, s, area ] = node_reference_ql ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_QL returns the basis nodes for a quadratic/linear.
%
%  Reference Element QL:
%
%    |
%    1  4---5---6
%    |  |       |
%    |  |       |
%    S  |       |
%    |  |       |
%    |  |       |
%    0  1---2---3
%    |
%    +--0---R---1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real R(6), S(6), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  r(1:6) = [ 0.0, 0.5, 1.0, 0.0, 0.5, 1.0 ];
  s(1:6) = [ 0.0, 0.0, 0.0, 1.0, 1.0, 1.0 ];

  area = 1.0;

  return
end
