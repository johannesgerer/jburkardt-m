function x = r8pbu_cg ( n, mu, a, b, x )

%*****************************************************************************80
%
%% R8PBU_CG uses the conjugate gradient method on an R8PBU system.
%
%  Discussion:
%
%    The R8PBU storage format is for a symmetric positive definite band matrix.
%
%    To save storage, only the diagonal and upper triangle of A is stored,
%    in a compact diagonal format that preserves columns.
%
%    The diagonal is stored in row MU+1 of the array.
%    The first superdiagonal in row MU, columns 2 through N.
%    The second superdiagonal in row MU-1, columns 3 through N.
%    The MU-th superdiagonal in row 1, columns MU+1 through N.
%
%    The matrix A must be a positive definite symmetric band matrix.
%
%    The method is designed to reach the solution after N computational
%    steps.  However, roundoff may introduce unacceptably large errors for
%    some problems.  In such a case, calling the routine again, using
%    the computed solution as the new starting estimate, should improve
%    the results.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 October 1998
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Frank Beckman,
%    The Solution of Linear Equations by the Conjugate Gradient Method,
%    in Mathematical Methods for Digital Computers,
%    edited by John Ralston, Herbert Wilf,
%    Wiley, 1967,
%    ISBN: 0471706892,
%    LC: QA76.5.R3.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer MU, the number of superdiagonals.
%    MU must be at least 0, and no more than N-1.
%
%    Input, real A(MU+1,N), the R8PBU matrix.
%
%    Input, real B(N), the right hand side vector.
%
%    Input/output, real X(N).
%    On input, an estimate for the solution, which may be 0.
%    On output, the approximate solution vector.
%
  b = b(:);
  x = x(:);
%
%  Initialize
%    AP = A * x,
%    R  = b - A * x,
%    P  = b - A * x.
%
  ap = r8pbu_mv ( n, n, mu, a, x );

  r(1:n,1) = b(1:n,1) - ap(1:n,1);
  p(1:n,1) = b(1:n,1) - ap(1:n,1);
%
%  Do the N steps of the conjugate gradient method.
%
  for it = 1 : n
%
%  Compute the matrix*vector product AP=A*P.
%
    ap = r8pbu_mv ( n, n, mu, a, p );
%
%  Compute the dot products
%    PAP = P*AP,
%    PR  = P*R
%  Set
%    ALPHA = PR / PAP.
%
    pap = p' * ap;
    pr = p' * r;

    if ( pap == 0.0 )
      return
    end

    alpha = pr / pap;
%
%  Set
%    X = X + ALPHA * P
%    R = R - ALPHA * AP.
%
    x(1:n,1) = x(1:n,1) + alpha * p(1:n,1);
    r(1:n,1) = r(1:n,1) - alpha * ap(1:n,1);
%
%  Compute the vector dot product
%    RAP = R*AP
%  Set
%    BETA = - RAP / PAP.
%
    rap = r' * ap;

    beta = - rap / pap;
%
%  Update the perturbation vector
%    P = R + BETA * P.
%
    p(1:n,1) = r(1:n,1) + beta * p(1:n,1);

  end

  return
end
