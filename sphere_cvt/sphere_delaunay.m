function [ face_num, face ] = sphere_delaunay ( n, xyz )

%*****************************************************************************80
%
%% SPHERE_DELAUNAY computes a Delaunay triangulation on the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real XYZ(3,N), points on a sphere.
%
%    Ouptut, integer FACE_NUM, the number of faces.
%
%    Output, int FACE(3,FACE_NUM), the faces.
%
  face = convhulln ( xyz' );

  face = face';

  [ dim_num, face_num ] = size ( face );
%
%  For some reason, the orientation of these triangles is reversed.
%
  for j = 1 : face_num
    face(1:3,j) = face(3:-1:1,j);
  end
%
%  Rotate each column so smallest entry is first.
%
  for j = 1 : face_num
    if ( face(2,j) < face(1,j) && face(2,j) < face(3,j) )
      face(1:3,j) = [ face(2,j), face(3,j), face(1,j) ]';
    elseif ( face(3,j) < face(1,j) && face(3,j) < face(2,j) )
      face(1:3,j) = [ face(3,j), face(1,j), face(2,j) ]';
    end
  end
%
%  Sort the columns lexically.
%
  face = i4col_sort_a ( 3, face_num, face );

  return
end
