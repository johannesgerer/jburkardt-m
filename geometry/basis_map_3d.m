function [ a, ierror ] = basis_map_3d ( u, v )

%*****************************************************************************80
%
%% BASIS_MAP_3D computes the matrix which maps one basis to another.
%
%  Discussion:
%
%    As long as the column vectors U1, U2 and U3 are linearly independent,
%    a matrix A will be computed that maps U1 to V1, U2 to V2, and
%    U3 to V3, where V1, V2 and V3 are the columns of V.
%
%    Depending on the values of the vectors, A may represent a
%    rotation, reflection, dilation, project, or a combination of these
%    basic linear transformations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real U(3,3), the columns of U are the three 
%    "domain" or "preimage" vectors, which should be linearly independent.
%
%    Input, real V(3,3), the columns of V are the three 
%    "range" or "image" vectors.
%
%    Output, real A(3,3), a matrix with the property that 
%    A * U1 = V1, A * U2 = V2 and A * U3 = V3.
%
%    Output, integer IERROR, error flag.
%    0, no error occurred.
%    nonzero, the matrix [ U1 | U2 | U3 ] is exactly singular.
%
  ierror = 0;
%
%  Compute C = the inverse of [ U1 | U2 | U3 ].
%
  b(1:3,1:3) = u(1:3,1:3);

  [ c, det ] = r8mat_inverse_3d ( b );

  if ( det == 0.0 )
    ierror = 1;
    a = [];
    return
  end
%
%  A = [ V1 | V2 | V3 ] * inverse [ U1 | U2 | U3 ].
%
  a(1:3,1:3) = v(1:3,1:3) * c(1:3,1:3);

  return
end
