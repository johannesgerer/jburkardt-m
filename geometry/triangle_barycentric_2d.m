function xsi = triangle_barycentric_2d ( t, p )

%*****************************************************************************80
%
%% TRIANGLE_BARYCENTRIC_2D finds the barycentric coordinates of a point in 2D.
%
%  Discussion:
%
%    The barycentric coordinate of point X related to vertex A can be
%    interpreted as the ratio of the area of the triangle with
%    vertex A replaced by vertex X to the area of the original
%    triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 Decewmber 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%    The vertices should be given in counter clockwise order.
%
%    Input, real P(2,1), the point to be checked.
%
%    Output, real XSI(3,1), the barycentric coordinates of (X,Y)
%    with respect to the triangle.
%
  nrhs = 1;
%
%  Set up the linear system
%
%    ( X2-X1  X3-X1 ) XSI(1)  = X-X1
%    ( Y2-Y1  Y3-Y1 ) XSI(2)    Y-Y1
%
%  which is satisfied by the barycentric coordinates of (X,Y).
%
  a(1,1) = t(1,2) - t(1,1);
  a(1,2) = t(1,3) - t(1,1);
  a(1,3) = p(1,1) - t(1,1);

  a(2,1) = t(2,2) - t(2,1);
  a(2,2) = t(2,3) - t(2,1);
  a(2,3) = p(2,1) - t(2,1);
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( 2, nrhs, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE_BARYCENTRIC_2D - Fatal error!\n' );
    fprintf ( 1, '  The linear system is singular.\n' );
    fprintf ( 1, '  The input data does not form a proper triangle.\n' );
    error ( 'TRIANGLE_BARYCENTRIC_2D - Fatal error!\n' );
  end

  xsi(1,1) = a(1,3);
  xsi(2,1) = a(2,3);
  xsi(3,1) = 1.0 - xsi(1,1) - xsi(2,1);

  return
end
