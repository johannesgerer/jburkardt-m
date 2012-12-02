function [ r, s, area ] = node_reference_q9 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_Q9 returns the basis nodes for a 9 node quadrilateral.
%
%  Reference Element Q9:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8  9  6
%    |  |     |
%    |  |     |
%    0  1--5--2
%    |
%    +--0--R--1-->
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
%    Input, real R(9), S(9), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  r(1:9) = [ 0.0, 1.0, 1.0, 0.0, 0.5, 1.0, 0.5, 0.0, 0.5 ];
  s(1:9) = [ 0.0, 0.0, 1.0, 1.0, 0.0, 0.5, 1.0, 0.5, 0.5 ];

  area = 1.0;

  return
end
