function quality = tetrahedron_quality1_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_QUALITY1_3D: "quality" of a tetrahedron in 3D.
%
%  Discussion:
%
%    The quality of a tetrahedron is 3.0 times the ratio of the radius of
%    the inscribed sphere divided by that of the circumscribed sphere.
%
%    An equilateral tetrahredron achieves the maximum possible quality of 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the tetrahedron vertices.
%
%    Output, real QUALITY, the quality of the tetrahedron.
%
  dim_num = 3;

  [ r_out, pc ] = tetrahedron_circumsphere_3d ( tetra );

  [ r_in, pc ] = tetrahedron_insphere_3d ( tetra );

  quality = 3.0 * r_in / r_out;

  return
end
