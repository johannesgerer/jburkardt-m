function [ r, s, area ] = node_reference_t10 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_T10 returns the basis nodes for a 10 node triangle.
%
%  Reference Element T10:
%
%    |
%    1  10
%    |  |\
%    |  | \
%    |  8  9
%    |  |   \
%    S  |    \
%    |  5  6  7
%    |  |      \
%    |  |       \
%    0  1--2--3--4
%    |
%    +--0----R---1-->
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
%    Output, real R(10), S(10), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  r(1) = 0.0;
  s(1) = 0.0;

  r(2) = 1.0 / 3.0;
  s(2) = 0.0;

  r(3) = 2.0 / 3.0;
  s(3) = 0.0;

  r(4) = 1.0;
  s(4) = 0.0;

  r(5) = 0.0;
  s(5) = 1.0 / 3.0;

  r(6) = 1.0 / 3.0;
  s(6) = 1.0 / 3.0;

  r(7) = 2.0 / 3.0;
  s(7) = 1.0 / 3.0;

  r(8) = 0.0;
  s(8) = 2.0 / 3.0;

  r(9) = 1.0 / 3.0;
  s(9) = 2.0 / 3.0;

  r(10) = 0.0;
  s(10) = 1.0;

  area = 0.5;

  return
end
