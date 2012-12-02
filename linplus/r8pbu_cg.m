function x_new = r8pbu_cg ( n, mu, a, b, x )

%*****************************************************************************80
%
%% R8PBU_CG uses the conjugate gradient method on a R8PBU system.
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
%    27 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    F S Beckman,
%    The Solution of Linear Equations by the Conjugate Gradient Method,
%    Mathematical Methods for Digital Computers, pages 62-72.
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
%    Input, real X(N), an estimate for the solution, which may be 0.
%
%    Output, real X_NEW(N), the approximate solution vector.
%
  x_new(1:n) = x(1:n);
%
%  Initialize
%    AP = A * x,
%    R  = b - A * x,
%    P  = b - A * x.
%
  ap(1:n) = r8pbu_mxv ( n, mu, a, x_new );

  r(1:n) = b(1:n) - ap(1:n);
  p(1:n) = b(1:n) - ap(1:n);
%
%  Do the N steps of the conjugate gradient method.
%
  for it = 1 : n
%
%  Compute the matrix*vector product AP=A*P.
%
    ap(1:n) = r8pbu_mxv ( n, mu, a, p );
%
%  Compute the dot products
%    PAP = P*AP,
%    PR  = P*R
%  Set
%    ALPHA = PR / PAP.
%
    pap = p(1:n) * ap(1:n)';
    pr  = p(1:n) * r(1:n)';

    if ( pap == 0.0 )
      return;
    end

    alpha = pr / pap;
%
%  Set
%    X = X + ALPHA * P
%    R = R - ALPHA * AP.
%
    x_new(1:n) = x_new(1:n) + alpha * p(1:n);
    r(1:n)     = r(1:n)     - alpha * ap(1:n);
%
%  Compute the vector dot product
%    RAP = R*AP
%  Set
%    BETA = - RAP / PAP.
%
    rap = r(1:n) * ap(1:n)';

    beta = - rap / pap;
%
%  Update the perturbation vector
%    P = R + BETA * P.
%
    p(1:n) = r(1:n) + beta * p(1:n);

  end

  return
end
