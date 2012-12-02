function value = tetra_volume ( x, y, z )

%*****************************************************************************80
%
%% TETRA_VOLUME computes the volume of a tetrahedron in 3D.
%
%  Integration region:
%
%    Points inside a tetrahedron whose four vertices are given.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(4), Y(4), Z(4), the vertices.
%
%    Output, realn TETRA_VOLUME, the volume of the tetrahedron.
%
  value = tetra_unit_volume ( ) * parallelipiped_volume_3d ( x, y, z );

  return
end
