function [ r, pc ] = tetrahedron_insphere_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_INSPHERE_3D finds the insphere of a tetrahedron in 3D.
%
%  Discussion:
%
%    The insphere of a tetrahedron is the inscribed sphere, which touches
%    each face of the tetrahedron at a single point.
%
%    The points of contact are the centroids of the triangular faces
%    of the tetrahedron.  Therefore, the point of contact for a face
%    can be computed as the average of the vertices of that face.
%
%    The sphere can then be determined as the unique sphere through
%    the four given centroids.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Philip Schneider, David Eberly,
%    Geometric Tools for Computer Graphics,
%    Elsevier, 2002,
%    ISBN: 1558605940,
%    LC: T385.G6974.
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real R, PC(3,1), the radius and the center
%    of the sphere.
%
  dim_num = 3;

  v21(1:dim_num,1) = tetra(1:dim_num,2) - tetra(1:dim_num,1);
  v31(1:dim_num,1) = tetra(1:dim_num,3) - tetra(1:dim_num,1);
  v41(1:dim_num,1) = tetra(1:dim_num,4) - tetra(1:dim_num,1);
  v32(1:dim_num,1) = tetra(1:dim_num,3) - tetra(1:dim_num,2);
  v42(1:dim_num,1) = tetra(1:dim_num,4) - tetra(1:dim_num,2);
  v43(1:dim_num,1) = tetra(1:dim_num,4) - tetra(1:dim_num,3);

  n123 = r8vec_cross_product_3d ( v21, v31 );
  n124 = r8vec_cross_product_3d ( v41, v21 );
  n134 = r8vec_cross_product_3d ( v31, v41 );
  n234 = r8vec_cross_product_3d ( v42, v32 );

  l123 = norm ( n123 );
  l124 = norm ( n124 );
  l134 = norm ( n134 );
  l234 = norm ( n234 );

  pc(1:dim_num,1) = ( l234 * tetra(1:dim_num,1)   ...
                    + l134 * tetra(1:dim_num,2)   ...
                    + l124 * tetra(1:dim_num,3)   ...
                    + l123 * tetra(1:dim_num,4) ) ...
                  / ( l234 + l134 + l124 + l123 );

  b(1:dim_num,1:4) = tetra(1:dim_num,1:4);
  b(4,1:4) = 1.0;

  gamma = abs ( r8mat_det_4d ( b ) );

  r = gamma / ( l234 + l134 + l124 + l123 );

  return
end
