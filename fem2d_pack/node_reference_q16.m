function [ r, s, area ] = node_reference_q16 ( )

%*****************************************************************************80
%
%% NODE_REFERENCE_Q16 returns the basis nodes for a 16 node quadrilateral.
%
%  Reference Element Q16:
%
%    |
%    1 13--14--15--16
%    |  |   :   :   |
%    |  |   :   :   |
%    |  9..10..11..12
%    S  |   :   :   |
%    |  |   :   :   |
%    |  5...6...7...8
%    |  |   :   :   |
%    |  |   :   :   |
%    0  1---2---3---4
%    |
%    +--0-----R-----1-->
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
%    Output, real R(16), S(16), the coordinates of the basis nodes.
%
%    Output, real AREA, the area of the element.
%
  k = 0;
  for i = 0 : 3
    for j = 0 : 3
      k = k + 1;
      r(k) = j / 3.0;
      s(k) = i / 3.0;
    end
  end

  area = 1.0;

  return
end
