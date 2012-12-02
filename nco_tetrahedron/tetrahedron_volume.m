function volume = tetrahedron_volume ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_VOLUME computes the volume of a tetrahedron in 3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4), the vertices of the tetrahedron.
%
%    Output, real VOLUME, the volume of the tetrahedron.
%
  dim_num = 3;

  a(1:dim_num,1:4) = tetra(1:dim_num,1:4);
  a(4,1:4) = 1.0;

  volume = abs ( r8mat_det_4d ( a ) ) / 6.0;

  return
end
