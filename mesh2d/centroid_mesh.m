function c = centroid_mesh ( p, t )

%*****************************************************************************80
%
%% CENTROID_MESH computes the centroids of triangles in a mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real P(NP,2), the coordinates of the nodes.
%
%    Input, integer T(NT,3), the indices of nodes that form triangles.
%
%    Output, real C(NT,2), the coordinates of the triangle centroids.
%
  [ np, ~ ] = size ( p );

  [ nt, ~ ] = size ( t );

  c = zeros ( nt, 2 );

  c(1:nt,1) = ( p(t(1:nt,1),1) + p(t(1:nt,2),1) + p(t(1:nt,3),1) ) / 3.0;
  c(1:nt,2) = ( p(t(1:nt,1),2) + p(t(1:nt,2),2) + p(t(1:nt,3),2) ) / 3.0;

  return
end
