function lij = fem_basis_1d ( i, j, x )

%*****************************************************************************80
%
%% FEM_BASIS_1D evaluates an arbitrary 1D basis function.
%
%  Discussion:
%
%    Given the maximum degree D for the polynomial basis defined
%    on a reference interval, we have D + 1 monomials
%    of degree at most D.  In each barycentric coordinate, we define
%    D+1 points, so that 0 <= I, J <= D and I+J = D, with
%    (I,J) corresponding to
%    * the basis point X(I,J) = ( I/D );
%    * the basis monomial P(I,J)(X) = X^I.
%
%    For example, with D = 2, we have simply:
%
%      A---B---C
%
%    with
%
%       I J    X      P(I,J)(X)
%
%    A (0 2) ( 0.0 )  1
%    B (1 1) ( 0.5 )  x
%    C (2 0) ( 1.0 )  x^2
%
%    Now instead of the monomials P(I,J)(X), we want a set of
%    polynomials L(I,J)(X) which span the same space, but have
%    the Lagrange property, namely L(I,J) (X) is 1 if X is
%    equal to X(I,J), and 0 if X is equal to any other
%    of the basis points.
%
%    This is easily arranged.  Given an index (I,J), we compute
%    1) I factors of the form (X-0)   * (X-1/D)   * ... * (X-(I-1)/D);
%    2) J factors of the form ???
%
%    This results in the product of I+J linear factors, in other words,
%    a polynomial of degree D.  This polynomial is 0 at all basis points
%    except X(I,J).  If we divide this polynomial by its value at
%    the basis point, we arrive at the desired Lagrange polynomial
%    L(I,J)(X).
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
%    Input, integer I, J, the integer barycentric coordinates of the basis
%    function, 0 <= I, J.  The polynomial degree D = I + J
%
%    Input, real X, the evaluation point.
%
%    Output, real LIJ, the value of the basis function at X.
%
  d = i + j;
  lij = 1.0;
  cij = 1.0;
  for p = 0 : i - 1
    lij = lij * ( d * x - p );
    cij = cij * (     i - p );
  end
  for p = 0 : j - 1
    lij = lij * ( d * x - ( d - p ) );
    cij = cij * (     i - ( d - p ) );
  end

  lij = lij / cij;

  return
end
