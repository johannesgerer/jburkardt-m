function node_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1, ...
  f2, f3 )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_PROJECT projects from plane to spherical triangle.
%
%  Discussion:
%
%    We assume that points A, B and C lie on the unit sphere, and they
%    thus define a spherical triangle.
%
%    They also, of course, define a planar triangle.
%
%    Let (F1,F2,F3) be the barycentric coordinates of a point in this 
%    planar triangle.
%
%    This function determines the coordinates of the point in the planar
%    triangle identified by the barycentric coordinates, and returns the
%    coordinates of the projection of that point onto the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A_XYZ(3), B_XYZ(3), C_XYZ(3), the coordinates
%    of the points A, B, and C.
%
%    Input, integer F1, F2, F3, the barycentric coordinates
%    of a point in the triangle ABC.  Normally, these coordinates would
%    be real numbers, and would sum to 1.  For convenience, we allow these
%    to be integers which must be divided by F1+F2+F3.
%
%    Output, real NODE_XYZ(3), the coordinates of the 
%    point on the unit sphere which is the projection of the point on the plane
%    whose barycentric coordinates with respect to A, B, and C is
%    (F1,F2,F3)/(F1+F2+F3).
%

%
%  Destroy all row vectors!
%
  a_xyz = a_xyz(:);
  b_xyz = b_xyz(:);
  c_xyz = c_xyz(:);

  node_xyz(1:3,1) = ...
    ( ( f1           ) * a_xyz(1:3)   ...
    + (      f2      ) * b_xyz(1:3)   ...
    + (           f3 ) * c_xyz(1:3) ) ...
    / ( f1 + f2 + f3 );

  node_norm = r8vec_norm ( 3, node_xyz(1:3,1) );

  node_xyz(1:3,1) = node_xyz(1:3,1) / node_norm;

  return
end
