function x = simplex_grid_index_to_point ( m, n, ng, g, v )

%*****************************************************************************80
%
%% SIMPLEX_GRID_INDEX_TO_POINT returns  points corresponding to simplex indices.
%
%  Discussion:
%
%    The M-dimensional simplex is defined by M+1 vertices.
%
%    Given a regular grid that uses N subintervals along the edge between
%    each pair of vertices, a simplex grid index G is a set of M+1 values
%    each between 0 and N, and summing to N. 
%
%    This function determines the coordinates X of the point corresponding
%    to the index G.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of subintervals.
%
%    Input, integer NG, the number of grid indices to be converted.
%
%    Input, integer G(M+1,NG), the grid indices of 1 or more points.
%
%    Input, real V(M,M+1), the coordinates of the vertices of the simplex.
%
%    Output, real X(M,NG), the coordinates of one or more points.
%
  x = v(1:m,1:m+1) * g(1:m+1,1:ng) / n;

  return
end
