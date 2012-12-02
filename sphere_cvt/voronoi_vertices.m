function v = voronoi_vertices ( n, xyz, face_num, face )

%*****************************************************************************80
%
%% VORONOI_VERTICES computes the Voronoi vertices.
%
%  Discussion:
%
%    We are given information defining the Delaunay triangulation of
%    a set of N points on the unit sphere.  
%
%    Each Delaunay triangle determines a Voronoi vertex, which is
%    the unit normal vector to that triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real XYZ(3,N), the coordinates of the points.
%
%    Input, integer FACE_NUM, the number of Delaunay triangles.
%
%    Input, integer FACE(3,FACE_NUM), the indices of points that
%    form each Delaunay triangle.
%
%    Output, real V(3,N), the coordinates of the Voronoi vertices.
%    
  for f = 1 : face_num

    i1 = face(1,f);
    i2 = face(2,f);
    i3 = face(3,f);

    v(1,f) = ( xyz(2,i2) - xyz(2,i1) ) * ( xyz(3,i3) - xyz(3,i1) ) ...
           - ( xyz(3,i2) - xyz(3,i1) ) * ( xyz(2,i3) - xyz(2,i1) );

    v(2,f) = ( xyz(3,i2) - xyz(3,i1) ) * ( xyz(1,i3) - xyz(1,i1) ) ...
           - ( xyz(1,i2) - xyz(1,i1) ) * ( xyz(3,i3) - xyz(3,i1) );

    v(3,f) = ( xyz(1,i2) - xyz(1,i1) ) * ( xyz(2,i3) - xyz(2,i1) ) ...
           - ( xyz(2,i2) - xyz(2,i1) ) * ( xyz(1,i3) - xyz(1,i1) );

    norm = sqrt ( sum ( v(1:3,f).^2 ) );

    v(1:3,f) = v(1:3,f) / norm;

  end

  return
end
