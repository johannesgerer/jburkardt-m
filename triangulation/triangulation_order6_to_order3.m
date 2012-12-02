function triangle_node2 = triangulation_order6_to_order3 ( triangle_num1, triangle_node1 )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_TO_ORDER3 linearizes a quadratic triangulation.
%
%  Discussion:
%
%    A quadratic triangulation is assumed to consist of 6-node triangles,
%    as in the following:
%
%    11-12-13-14-15
%     |\    |\    |
%     | \   | \   |
%     6  7  8  9 10
%     |   \ |   \ |
%     |    \|    \|
%     1--2--3--4--5
%
%   This routine rearranges information so as to define the 3-node
%   triangulation:
%
%    11-12-13-14-15
%     |\ |\ |\ |\ |
%     | \| \| \| \|
%     6--7--8--9-10
%     |\ |\ |\ |\ |
%     | \| \| \| \|
%     1--2--3--4--5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM1, the number of triangles in the quadratic
%    triangulation.
%
%    Input, integer TRIANGLE_NODE1(6,TRIANGLE_NUM1), the quadratic triangulation.
%
%    Output, integer TRIANGLE_NODE2(3,4*TRIANGLE_NUM1), the linear triangulation.
%
  tri2 = 0;

  for tri1 = 1 : triangle_num1

    n1 = triangle_node1(1,tri1);
    n2 = triangle_node1(2,tri1);
    n3 = triangle_node1(3,tri1);
    n4 = triangle_node1(4,tri1);
    n5 = triangle_node1(5,tri1);
    n6 = triangle_node1(6,tri1);

    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n1, n4, n6 ]';
    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n2, n5, n4 ]';
    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n3, n6, n5 ]';
    tri2 = tri2 + 1;
    triangle_node2(1:3,tri2) = [ n4, n5, n6 ]';

  end

  return
end
