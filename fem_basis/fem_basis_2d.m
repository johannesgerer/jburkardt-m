function lijk = fem_basis_2d ( i, j, k, x, y )

%*****************************************************************************80
%
%% FEM_BASIS_2D evaluates an arbitrary triangular basis function.
%
%  Discussion:
%
%    Given the maximum degree D for the polynomial basis defined
%    on a reference triangle, we have ( ( D + 1 ) * ( D + 2 ) ) / 2 monomials
%    of degree at most D.  In each barycentric coordinate, we define
%    D+1 planes, so that 0 <= I, J, K <= D and I+J+K = D, with
%    (I,J,K) corresponding to
%    * the basis point (X,Y)(I,J,K) = ( I/D, J/D );
%    * the basis monomial P(I,J,K)(X,Y) = X^I Y^J.
%
%    For example, with D = 2, we have simply:
%
%    F
%    |\
%    C-E
%    |\|\
%    A-B-D
%
%    with
%
%       I J K    X    Y    P(I,J,K)(X,Y)
%
%    A (0 0 2) (0.0, 0.0)  1
%    B (1 0 1) (0.5, 0.0)  x
%    C (0 1 1) (0.0, 0.5)  y
%    D (2 0 0) (1.0, 0.0)  x^2
%    E (1 1 0) (0.5, 0.5)  x y
%    F (0 2 0) (0.0, 1.0)  y^2
%
%    Now instead of the monomials P(I,J,K)(X,Y), we want a set of
%    polynomials L(I,J,K)(X,Y) which span the same space, but have
%    the Lagrange property, namely L(I,J,K) (X,Y) is 1 if (X,Y) is
%    equal to (X,Y)(I,J,K), and 0 if (X,Y) is equal to any other
%    of the basis points.
%
%    This is easily arranged.  Given an index (I,J,K), we compute
%    1) I factors of the form (X-0)   * (X-1/D)   * ... * (X-(I-1)/D);
%    2) J factors of the form (Y-0)   * (Y-1/D)   * ... * (Y-(J-1)/D);
%    3) K factors of the form (X+Y-(D-0)/D) * (X+Y-(D-1)/D) * ... * (X+Y-(D-(K-1))/D).
%
%    This results in the product of I+J+K linear factors, in other words,
%    a polynomial of degree D.  This polynomial is 0 at all basis points
%    except (X,Y)(I,J,K).  If we divide this polynomial by its value at
%    the basis point, we arrive at the desired Lagrange polynomial
%    L(I,J,K)(X,Y).
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
%    Input, integer I, J, K, the integer barycentric coordinates of
%    the basis function, 0 <= I, J, K.  The polynomial degree D = I + J + K.
%
%    Input, real X, Y, the evaluation point.
%
%    Output, real LIJK, the value of the basis function at (X,Y).
%
  d = i + j + k;
  lijk = 1.0;
  cijk = 1.0;
  for p = 0 : i - 1
    lijk = lijk * ( d * x - p );
    cijk = cijk * (     i - p );
  end
  for p = 0 : j - 1
    lijk = lijk * ( d * y - p );
    cijk = cijk * (     j - p );
  end
  for p = 0 : k - 1
    lijk = lijk * ( d * ( x + y ) - ( d - p ) );
    cijk = cijk * (     ( i + j ) - ( d - p ) );
  end

  lijk = lijk / cijk;

  return
end
