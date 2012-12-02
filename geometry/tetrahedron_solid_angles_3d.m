function angle = tetrahedron_solid_angles_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_SOLID_ANGLES_3D computes solid angles of a tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real ANGLE(4), the solid angles.
%
  dihedral_angles = tetrahedron_dihedral_angles_3d ( tetra );

  angle(1) = dihedral_angles(1) + dihedral_angles(2) + dihedral_angles(3) - pi;
  angle(2) = dihedral_angles(1) + dihedral_angles(4) + dihedral_angles(5) - pi;
  angle(3) = dihedral_angles(2) + dihedral_angles(4) + dihedral_angles(6) - pi;
  angle(4) = dihedral_angles(3) + dihedral_angles(5) + dihedral_angles(6) - pi;

  return
end
