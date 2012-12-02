function [ r, s, area ] = node_reference_q8 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_Q8 returns the basis nodes for an 8 node quadrilateral.
%
%  Discussion:
%
%    This element is known as the quadratic "serendipity" element.
%
%  Reference Element Q8:
%
%    |
%    1  4--7--3
%    |  |     |
%    |  |     |
%    S  8     6
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
%    Output, real R(8), S(8), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  r(1:8) = [ 0.0, 1.0, 1.0, 0.0, 0.5, 1.0, 0.5, 0.0 ];
  s(1:8) = [ 0.0, 0.0, 1.0, 1.0, 0.0, 0.5, 1.0, 0.5 ];

  area = 1.0;

  return
end
