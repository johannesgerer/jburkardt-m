function centroid = tetrahedron_centroid_3d ( tetra )

%*****************************************************************************80
%
%% TETRAHEDRON_CENTROID_3D computes the centroid of a tetrahedron in 3D.
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
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Output, real CENTROID(3), the coordinates of the centroid.
%
  dim_num = 3;

  for i = 1 : dim_num
    centroid(i) = sum ( tetra(i,1:4) ) / 4.0;
  end

  return
end
