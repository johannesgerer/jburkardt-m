function x = r83s_cg ( n, a, b, x )

%*****************************************************************************80
%
%% R83S_CG uses the conjugate gradient method on an R83S system.
%
%  Discussion:
%
%    The R83S storage format is used for a tridiagonal scalar matrix.
%    The vector A(3) contains the subdiagonal, diagonal, and superdiagonal
%    values that occur on every row.
%
%    The matrix A must be a positive definite symmetric band matrix.
%
%    The method is designed to reach the solution after N computational
%    steps.  However, roundoff may introduce unacceptably large errors for
%    some problems.  In such a case, calling the routine again, using
%    the computed solution as the new starting estimate, should improve
%    the results.
%
%  Example:
%
%    Here is how an R83S matrix of order 5, stored as (A1,A2,A3), would
%    be interpreted:
%
%      A2  A3   0   0   0
%      A1  A2  A3   0   0
%       0  A1  A2  A3   0 
%       0   0  A1  A2  A3
%       0   0   0  A1  A2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 June 2014
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
%    Input, real A(3), the matrix.
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
  ap = r83s_mv ( n, n, a, x );

  r(1:n,1) = b(1:n,1) - ap(1:n,1);
  p(1:n,1) = b(1:n,1) - ap(1:n,1);
%
%  Do the N steps of the conjugate gradient method.
%
  for it = 1 : n
%
%  Compute the matrix*vector product AP=A*P.
%
    ap = r83s_mv ( n, n, a, p );
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
