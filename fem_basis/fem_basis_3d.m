function lijkl = fem_basis_3d ( i, j, k, l, x, y, z )

%*****************************************************************************80
%
%% FEM_BASIS_3D evaluates an arbitrary tetrahedral basis function.
%
%  Discussion:
%
%    Given the maximum degree D for the polynomial basis defined
%    on a reference tetrahedron, we have
%    ( D + 1 ) * ( D + 2 ) * ( D + 3 ) / 6 monomials
%    of degree at most D.  In each barycentric coordinate, we define
%    D+1 planes, so that 0 <= I, J, K, L <= D and I+J+K+L = D, with
%    (I,J,K,L) corresponding to
%    * the basis point (X,Y,Z)(I,J,K,L) = ( I/D, J/D, K/D );
%    * the basis monomial P(I,J,K,L)(X,Y,Z) = X^I Y^J Z^K.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, K, L, the integer barycentric 
%    coordinates of the basis function, 0 <= I, J, K, L. 
%    The polynomial degree D = I + J + K + L.
%
%    Input, real X, Y, Z, the evaluation point.
%
%    Output, real LIJKL, the value of the basis function at (X,Y,Z).
%
  d = i + j + k + l;
  lijkl = 1.0;
  cijkl = 1.0;
  for p = 0 : i - 1
    lijkl = lijkl * ( d * x - p );
    cijkl = cijkl * (     i - p );
  end
  for p = 0 : j - 1
    lijkl = lijkl * ( d * y - p );
    cijkl = cijkl * (     j - p );
  end
  for p = 0 : k - 1
    lijkl = lijkl * ( d * z - p );
    cijkl = cijkl * (     k - p );
  end
  for p = 0 : l - 1
    lijkl = lijkl * ( d * ( x + y + z ) - ( d - p ) );
    cijkl = cijkl * (     ( i + j + k ) - ( d - p ) );
  end

  lijkl = lijkl / cijkl;

  return
end
