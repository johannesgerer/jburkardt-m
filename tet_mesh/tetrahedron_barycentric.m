function c = tetrahedron_barycentric ( tetra, p )

%*****************************************************************************80
%
%% TETRAHEDRON_BARYCENTRIC returns the barycentric coordinates of a point.
%
%  Discussion:
%
%    The barycentric coordinates of a point (X,Y,Z) with respect to
%    a tetrahedron are a set of four values C(1:4), each associated
%    with a vertex of the tetrahedron.  The values must sum to 1.
%    If all the values are between 0 and 1, the point is contained
%    within the tetrahedron.
%
%    The barycentric coordinate of point X related to vertex A can be
%    interpreted as the ratio of the volume of the tetrahedron with 
%    vertex A replaced by vertex X to the volume of the original 
%    tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real TETRA(3,4) the tetrahedron vertices.
%
%    Input, real P(3), the point to be checked.
%
%    Output, real C(4), the barycentric coordinates of (X,Y,Z) with
%    respect to the tetrahedron.
%
  dim_num = 3;
  nrhs = 1;
%
%  Set up the linear system
%
%    ( X2-X1  X3-X1  X4-X1 ) C1    X - X1
%    ( Y2-Y1  Y3-Y1  Y4-Y1 ) C2  = Y - Y1
%    ( Z2-Z1  Z3-Z1  Z4-Z1 ) C3    Z - Z1
%
%  which is satisfied by the barycentric coordinates of (X,Y,Z).
%
  a(1:dim_num,1:3) = tetra(1:dim_num,2:4);
  a(1:dim_num,4) = p(1:dim_num)';

  for i = 1 : dim_num
    a(i,1:4) = a(i,1:4) - tetra(i,1);
  end
%
%  Solve the linear system.
%
  [ a, info ] = r8mat_solve ( dim_num, nrhs, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRAHEDRON_BARYCENTRIC - Fatal error!' );
    fprintf ( 1, '  The linear system is singular.' );
    fprintf ( 1, '  The input data does not form a proper tetrahedron.' );
    error ( 'TETRAHEDRON_BARYCENTRIC - Fatal error!' );
  end

  c(2:4) = a(1:dim_num,4);

  c(1) = 1.0 - sum ( c(2:4) );

  return
end
