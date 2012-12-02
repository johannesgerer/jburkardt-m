function angles = tetrahedron_face_angles_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_FACE_ANGLES_3D returns the 12 face angles of a tetrahedron 3D.
%
%  Discussion:
%
%    The tetrahedron has 4 triangular faces.  This routine computes the
%    3 planar angles associated with each face.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Output, real ANGLES(3,4), the face angles.
%

%
%  Face 123
%
  tri(1:3,1:3) = tetra(1:3,1:3);
  angles(1:3,1) = triangle_angles_3d ( tri );
%
%  Face 124
%
  tri(1:3,1:2) = tetra(1:3,1:2);
  tri(1:3,3) = tetra(1:3,4);
  angles(1:3,2) = triangle_angles_3d ( tri );
%
%  Face 134
%
  tri(1:3,1) = tetra(1:3,1);
  tri(1:3,2:3) = tetra(1:3,3:4);
  angles(1:3,3) = triangle_angles_3d ( tri );
%
%  Face 234
%
  tri(1:3,1:3) = tetra(1:3,2:4);
  angles(1:3,4) = triangle_angles_3d ( tri );

  return
end
