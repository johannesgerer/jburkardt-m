function quality2 = tetrahedron_quality2_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY2_3D: "quality" of a tetrahedron in 3D.
%
%  Discussion:
%
%    The quality measure #2 of a tetrahedron is:
%
%      QUALITY2 = 2 * sqrt ( 6 ) * RIN / LMAX
%
%    where
%
%      RIN = radius of the inscribed sphere;
%      LMAX = length of longest side of the tetrahedron.
%
%    An equilateral tetrahredron achieves the maximum possible quality of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Qiang Du and Desheng Wang,
%    The Optimal Centroidal Voronoi Tesselations and the Gersho's
%    Conjecture in the Three-Dimensional Space,
%    Computers and Mathematics with Applications,
%    Volume 49, 2005, pages 1355-1373.
%
%  Parameters:
%
%    Input, real TETRA(3,4), the tetrahedron vertices.
%
%    Output, real QUALITY2, the quality of the tetrahedron.
%
  dim_num = 3;

  edge_length(1:6) = tetrahedron_edge_length_3d ( tetra );

  l_max = max ( edge_length(1:6) );

  [ r_in, pc ] = tetrahedron_insphere_3d ( tetra );

  quality2 = 2.0 * sqrt ( 6.0 ) * r_in / l_max;

  return
end
