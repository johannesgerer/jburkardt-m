function [ r, s, area ] = node_reference_q12 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_Q12 returns the basis nodes for a 12 node quadrilateral.
%
%  Discussion:
%
%    This element is known as the cubic "serendipity" element.
%
%  Reference Element Q12:
%
%    |
%    1  9-10-11-12
%    |  |        |
%    |  7        8
%    S  |        |
%    |  5        6
%    |  |        |
%    0  1--2--3--4
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
%    Output, real R(12), S(12), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  a = 0.0;
  b = 1.0 / 3.0;
  c = 2.0 / 3.0;
  d = 1.0;

  r(1:12) = [ a, b, c, d, a, d, a, d, a, b, c, d ];
  s(1:12) = [ a, a, a, a, b, b, c, c, d, d, d, d ];

  area = 1.0;

  return
end
