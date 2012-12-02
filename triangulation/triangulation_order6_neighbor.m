function [ t2, s2 ] = triangulation_order6_neighbor ( triangle_num, ...
  triangle_node, t1, s1 )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER6_NEIGHBOR determines a neighbor of a given triangle.
%
%  Discussion:
%
%    A set of nodes is given.  A triangulation of the nodes has been
%    defined and recorded in TRIANGLE_NODE.  The TRIANGLE_NODE data structure records
%    triangles as sets of six nodes, with the first three being the
%    vertices, in counterclockwise order.  The fourth node is the
%    midside node between nodes 1 and 2, and the other two are listed
%    logically.
%
%    The nodes of the triangle are listed in counterclockwise order.
%    This means that if two triangles share a side, then the nodes
%    defining that side occur in the order (N1,N2,N3) for one triangle,
%    and (N3,N2,N1) for the other.
%
%    The routine is given a triangle and a side, and asked to find
%    another triangle (if any) that shares that side.  The routine
%    simply searches the TRIANGLE_NODE structure for an occurrence of the
%    nodes in the opposite order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TRIANGLE_NUM, the number of triangles.
%
%    Input, integer TRIANGLE_ORDER(6,TRIANGLE_NUM), the nodes that define
%    each triangle.
%
%    Input, integer T1, the index of the triangle.
%
%    Input, integer S1, the index of the triangle side.
%
%    Output, integer T2, the index of the triangle which is the neighbor
%    to T1 on side S1, or -1 if there is no such neighbor.
%
%    Output, integer S2, the index of the side of triangle T2 which
%    is shared with triangle T1, or -1 if there is no such neighbor.
%
  t2 = -1;
  s2 = -1;

  n1 = triangle_node(s1,t1);
  ss = i4_wrap ( s1+1, 1, 3 );
  n2 = triangle_node(ss,t1);

  for t = 1 : triangle_num
    for s = 1 : 3
      if ( triangle_node(s,t) == n1 )
        ss = i4_wrap ( s-1, 1, 3 );
        if ( triangle_node(ss,t) == n2 )
          t2 = t;
          s2 = ss;
          return
        end
      end
    end
  end

  return
end
