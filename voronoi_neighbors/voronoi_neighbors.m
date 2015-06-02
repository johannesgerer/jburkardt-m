function vn = voronoi_neighbors ( x )

%*****************************************************************************80
%
%% VORONOI_NEIGHBORS computes the Voronoi neighbors of each node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2013
%
%  Author:
%
%    The form of this function was suggested by Talha Arslan.
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(2,N), a set of nodes in the plane.
%
%    Output, integer VN(N,N), the adjacency matrix for X.
%    VN(I,J) is 1 if node I and node J are neighbors.
%
  [ n, dim ] = size ( x );
%
%  V contains the Voronoi vertices, 
%  C contains indices of Voronoi vertices that form the (finite sides of the)
%  Voronoi cells.
%
  [ V, C ] = voronoin ( x );
%
%  Two nodes are neighbors if they share an edge, that is, two Voronoi
%  vertices.
%
  vn = sparse ( n, n );

  for i = 1 : n
    for j = i + 1 : n
      s = size ( intersect ( C{i}, C{j} ) );
      if ( 1 < s(2) )
        vn(i,j) = 1;
        vn(j,i) = 1;
      end
    end
  end

  return
end
