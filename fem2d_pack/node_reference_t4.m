function [ r, s, area ] = node_reference_t4 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_T4 returns the basis nodes for the 4 node triangle.
%
%  Reference Element T4:
%
%    |
%    1  3
%    |  |\
%    |  | \
%    S  |  \
%    |  | 4 \
%    |  |    \
%    0  1-----2
%    |
%    +--0--R--1-->
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2006
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
  r(1:4) = [ 0.0, 1.0, 0.0, 1.0 / 3.0 ];
  s(1:4) = [ 0.0, 0.0, 1.0, 1.0 / 3.0 ];

  area = 0.5;

  return
end
