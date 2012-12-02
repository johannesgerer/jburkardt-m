function [ r, s, area ] = node_reference_t6 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_T6 returns the basis nodes for a 6 node triangle.
%
%  Reference Element T6:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  6  5
%    |  |   \
%    |  |    \
%    0  1--4--2
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
%    Output, real R(6), S(6), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  r(1:6) = [ 0.0, 1.0, 0.0, 0.5, 0.5, 0.0 ];
  s(1:6) = [ 0.0, 0.0, 1.0, 0.0, 0.5, 0.5 ];

  area = 0.5;

  return
end
