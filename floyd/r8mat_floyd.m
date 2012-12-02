function a = r8mat_floyd ( n, a )

%*****************************************************************************80
%
%% R8MAT_FLOYD finds the shortest R8 distances between pairs of nodes in a directed graph.
%
%  Discussion:
%
%    We assume we are given the adjacency matrix A of the directed graph.
%
%    We assume that A is an R8MAT, that is, a two-dimensional array of R8's.
%
%    The adjacency matrix is NOT assumed to be symmetric.
%
%    If there is not a direct link from node I to node J, the distance
%    would formally be infinity.  We assume that such distances are assigned
%    the value R8_HUGE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the direct distance from node I to node J.
%
%    Output, real A(N,N), the shortest distance from node I to node J.
%
  for k = 1 : n
    for j = 1 : n
      for i = 1 : n
        a(i,j) = min ( a(i,j), a(i,k) + a(k,j) );
      end
    end
  end

  return
end
