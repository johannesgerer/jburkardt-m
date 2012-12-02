function [ node_xy, element_node, element_neighbor ] = example2_q4_mesh ( ...
  node_num, element_num )

%*****************************************************************************80
%
%% EXAMPLE2_Q4_MESH sets up example #2 Q4 mesh.
%
%  Discussion:
%
%    The region is a semicircle.  This example includes degenerate elements
%    (the first layer of elements is touching the origin, and so has a side
%    of length zero).  The elements are not parallelograms.  And the elements
%    vary in size.
%
%    Because of the treatment of node 1, algorithms for counting boundary 
%    edges may become "confused".
%
%    The appropriate values of NODE_NUM and ELEMENT_NUM can be found by
%    calling EXAMPLE1_Q4_MESH_SIZE first.
%
%   29---30---31---32---33---34---35---36---37
%    | 25 | 26 | 27 | 28 | 29 | 30 | 31 | 32 |
%   20---21---22---23---24---25---26---27---28
%    | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24 |
%   11---12---13---14---15---16---17---18---19
%    |  9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 |
%    2----3----4----5----6----7----8----9---10
%    |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |
%    1----1----1----1----1----1----1----1----1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Output, real NODE_XY(2,NODE_NUM), the coordinates of the
%    nodes.
%
%    Output, integer ELEMENT_NODE(4,ELEMENT_NUM), the nodes
%    that make up the elements.
%
%    Output, integer ELEMENT_NEIGHBOR(4,ELEMENT_NUM), the
%    element neighbors on each side.  Negative values indicate edges that
%    lie on the exterior.
%
  k = 1;
  node_xy(1,k) = 0.0;
  node_xy(2,k) = 0.0;

  for row = 1 : 4
    r = row;
    for col = 0 : 8
      a = ( 8 - col ) * pi / 8.0;
      k = k + 1;
      node_xy(1,k) = r * cos ( a );
      node_xy(2,k) = r * sin ( a );
    end
  end

  element = 0;
  for row = 0 : 3
    for col = 0 : 7
      element = element + 1;
      if ( row == 0 )
        element_node(1,element) = 1;
        element_node(2,element) = 1;
        element_node(3,element) = col + 3;
        element_node(4,element) = col + 2;
      else
        element_node(1,element) = element_node(4,element-8);
        element_node(2,element) = element_node(3,element-8);
        element_node(3,element) = element_node(2,element) + 9;
        element_node(4,element) = element_node(1,element) + 9;
      end
    end
  end

  element = 0;
  for row = 0 : 3
    for col = 0 : 7
      element = element + 1;
      if ( row == 0 )
        element_neighbor(1,element) = -1;
      else
        element_neighbor(1,element) = element - 8;
      end
      if ( col == 7 )
        element_neighbor(2,element) = -1;
      else
        element_neighbor(2,element) = element + 1;
      end
      if ( row == 3 )
        element_neighbor(3,element) = - 1;
      else
        element_neighbor(3,element) = element + 8;
      end
      if ( col == 0 )
        element_neighbor(4,element) = - 1;
      else
        element_neighbor(4,element) = element - 1;
      end
    end
  end

  return
end
