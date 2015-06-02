function [ as, bs, cs ] = sphere01_triangle_vertices_to_sides ( v1, v2, v3 )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_VERTICES_TO_SIDES computes spherical triangle sides on unit sphere.
%
%  Discussion:
%
%    We can use the ACOS system call here, but the ARC_COSINE routine
%    will automatically take care of cases where the input argument is
%    (usually slightly) out of bounds.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real V1(3), V2(3), V3(3), the vertices of the spherical
%    triangle.
%
%    Output, real AS, BS, CS, the (geodesic) length of the sides
%    of the triangle.
%

%
%  Destroy all row vectors!
%
  v1 = v1(:);
  v2 = v2(:);
  v3 = v3(:);

  as = r8_acos ( v2(1:3)' * v3(1:3) );
  bs = r8_acos ( v3(1:3)' * v1(1:3) );
  cs = r8_acos ( v1(1:3)' * v2(1:3) );

  return
end
