function [ triangle_num, triangle_node ] = points_delaunay_naive_2d ( node_num, node_xy )

%*****************************************************************************80
%
%% POINTS_DELAUNAY_NAIVE_2D is a naive Delaunay triangulation scheme.
%
%  Discussion:
%
%    This routine is only suitable as a demonstration code for small
%    problems.  Its running time is of order N**4.  Much faster
%    algorithms are available.
%
%    Given a set of nodes in the plane, a triangulation is set of
%    triples of distinct nodes, forming triangles, so that every
%    point within the convex hull of the set of nodes is either
%    one of the nodes, or lies on an edge of one or more triangles,
%    or lies within exactly one triangle.
%
%    A Delaunay triangulation is a triangulation with additional
%    properties.
%
%    NODE_NUM must be at least 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joseph O'Rourke,
%    Computational Geometry,
%    Cambridge University Press,
%    Second Edition, 1998, page 187.
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.  
%
%    Input, real NODE_XY(2,NODE_NUM), the nodes.
%
%    Output, integer TRIANGLE_NUM, the number of triangles in the triangulation.
%
%    Output, integer TRIANGLE_NODE(3,MAXTRI), the indices of the triangle nodes.
%
  dim_num = 2;

  triangle_num = 0;

  if ( node_num < 3 )
    triangle_node = [];
    return
  end
%
%  Compute Z = X*X + Y*Y.
%
  z(1:node_num) = node_xy(1,1:node_num).^2 + node_xy(2,1:node_num).^2;
%
%  For each triple (I,J,K):
%
  for i = 1 : node_num - 2
    for j = i+1 : node_num
      for k = i+1 : node_num

        if ( j ~= k )

          xn = ( node_xy(2,j) - node_xy(2,i) ) * ( z(k) - z(i) ) ...
             - ( node_xy(2,k) - node_xy(2,i) ) * ( z(j) - z(i) );

          yn = ( node_xy(1,k) - node_xy(1,i) ) * ( z(j) - z(i) ) ...
             - ( node_xy(1,j) - node_xy(1,i) ) * ( z(k) - z(i) );

          zn = ( node_xy(1,j) - node_xy(1,i) ) * ( node_xy(2,k) - node_xy(2,i) ) ...
             - ( node_xy(1,k) - node_xy(1,i) ) * ( node_xy(2,j) - node_xy(2,i) );

          flag = ( zn < 0.0 );

          if ( flag )
            for m = 1 : node_num 
              flag = flag & ...
                ( ( node_xy(1,m) - node_xy(1,i) ) * xn ...
                + ( node_xy(2,m) - node_xy(2,i) ) * yn ...
                + ( z(m)   - z(i) )   * zn <= 0.0 );
            end
          end

          if ( flag )
            triangle_num = triangle_num + 1;
            triangle_node(1:3,triangle_num) = [ i, j, k ]';
          end

        end

      end
    end
  end

  return
end
