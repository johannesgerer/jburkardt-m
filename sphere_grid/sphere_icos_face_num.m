function face_num = sphere_icos_face_num ( factor )

%*****************************************************************************80
%
%% SPHERE_ICOS_FACE_NUM sizes an icosahedral grid on a sphere.
%
%  Discussion:
%
%    With FACTOR = 1, the grid has 20 triangular faces, 30 edges, and 12 nodes.
%
%    With FACTOR = 2, each triangle of the icosahedron is subdivided into
%    2x2 subtriangles, resulting in 80 faces, 120 edges, and 
%    42 = 12 + 20 * 3 * (1)/2 + 20 * 0 ) nodes.
%
%    With FACTOR = 3, each triangle of the icosahedron is subdivided into
%    3x3 subtriangles, resulting in 180 faces, 270 edges, and 
%    92 ( = 12 + 20 * 3 * (2)/2 + 20 * 1 ) nodes.
%
%    In general, each triangle is subdivided into FACTOR*FACTOR subtriangles,
%    resulting in 20 * FACTOR * FACTOR faces, 30 * FACTOR * FACTOR edges, and
%      12 
%    + 20 * 3          * (FACTOR-1) / 2 
%    + 20 * (FACTOR-2) * (FACTOR-1) / 2 nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR, the subdivision factor, which must
%    be at least 1.
%
%    Output, integer FACE_NUM, the number of faces.
%
  face_num = 20 * factor * factor;

  return
end
