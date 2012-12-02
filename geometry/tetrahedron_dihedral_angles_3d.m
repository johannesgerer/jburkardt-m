function angle = tetrahedron_dihedral_angles_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_DIHEDRAL_ANGLES_3D computes dihedral angles of a tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    08 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron,
%    which can be labeled as A, B, C and D.
%
%    Output, real ANGLE(6), the dihedral angles along the
%    axes AB, AC, AD, BC, BD and CD, respectively.
%
  ab(1:3) = tetra(1:3,2) - tetra(1:3,1);
  ac(1:3) = tetra(1:3,3) - tetra(1:3,1);
  ad(1:3) = tetra(1:3,4) - tetra(1:3,1);
  bc(1:3) = tetra(1:3,3) - tetra(1:3,2);
  bd(1:3) = tetra(1:3,4) - tetra(1:3,2);
 
  abc_normal = r8vec_cross_product_3d ( ac, ab );
  abd_normal = r8vec_cross_product_3d ( ab, ad );
  acd_normal = r8vec_cross_product_3d ( ad, ac );
  bcd_normal = r8vec_cross_product_3d ( bc, bd );

  angle(1) = r8vec_angle_3d ( abc_normal, abd_normal );
  angle(2) = r8vec_angle_3d ( abc_normal, acd_normal );
  angle(3) = r8vec_angle_3d ( abd_normal, acd_normal );
  angle(4) = r8vec_angle_3d ( abc_normal, bcd_normal );
  angle(5) = r8vec_angle_3d ( abd_normal, bcd_normal );
  angle(6) = r8vec_angle_3d ( acd_normal, bcd_normal );

  angle(1:6) = pi - angle(1:6);

  return
end
