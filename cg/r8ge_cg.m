function x = r8ge_cg ( n, a, b, x )

%*****************************************************************************80
%
%% R8GE_CG uses the conjugate gradient method on an R8GE system.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each entry.  The two dimensional logical
%    array can be thought of as a vector of M*N entries, starting with
%    the M entries in the column 1, then the M entries in column 2
%    and so on.  Considered as a vector, the entry A(I,J) is then stored
%    in vector location I+(J-1)*M.
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
%    02 June 2014
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
%    Input, real A(N,N), the matrix.
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
  ap = r8ge_mv ( n, n, a, x );

  r(1:n,1) = b(1:n) - ap(1:n);
  p(1:n,1) = b(1:n) - ap(1:n);
%
%  Do the N steps of the conjugate gradient method.
%
  for it = 1 : n
%
%  Compute the matrix*vector product AP=A*P.
%
    ap = r8ge_mv ( n, n, a, p );
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
