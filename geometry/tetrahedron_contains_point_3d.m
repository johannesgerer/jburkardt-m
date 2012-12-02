function inside = tetrahedron_contains_point_3d ( tetra, p )

%*****************************************************************************80
%
%% TETRAHEDRON_CONTAINS_POINT_3D finds if a point is inside a tetrahedron in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the tetrahedron vertices.
%
%    Input, real P(3), the point to be checked.
%
%    Output, logical INSIDE, is TRUE if (X,Y,Z) is inside
%    the tetrahedron or on its boundary.
%
  c = tetrahedron_barycentric_3d ( tetra, p );
%
%  If the point is in the tetrahedron, its barycentric coordinates
%  must be nonnegative.
%
  if ( any ( c(1:4) < 0.0 ) )
    inside = 0;
  else
    inside = 1;
  end

  return
end
