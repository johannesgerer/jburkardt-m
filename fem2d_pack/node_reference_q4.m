function [ r, s, area ] = node_reference_q4 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_Q4 returns the basis nodes for a 4 node quadrilateral.
%
%  Reference Element Q4:
%
%    |
%    1  4-------3
%    |  |       |
%    |  |       |
%    S  |       |
%    |  |       |
%    |  |       |
%    0  1-------2
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
%    Output, real R(4), S(4), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  r(1:4) = [ 0.0, 1.0, 1.0, 0.0 ];
  s(1:4) = [ 0.0, 0.0, 1.0, 1.0 ];

  area = 1.0;

  return
end
