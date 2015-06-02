function x = cg_st ( n, nz_num, row, col, a, b, x )

%*****************************************************************************80
%
%% CG_ST uses the conjugate gradient method for a sparse triplet storage matrix.
%
%  Discussion:
%
%    The linear system has the form A*x=b, where A is a positive-definite
%    symmetric matrix, stored as a full storage matrix.
%
%    The method is designed to reach the solution to the linear system
%      A * x = b
%    after N computational steps.  However, roundoff may introduce
%    unacceptably large errors for some problems.  In such a case,
%    calling the routine a second time, using the current solution estimate
%    as the new starting guess, should result in improved results.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2014
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
%
%    Input, integer NZ_NUM, the number of nonzeros.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices
%    of the nonzero entries.
%
%    Input, real A(NZ_NUM), the nonzero entries.
%
%    Input, real B(N), the right hand side vector.
%
%    Input/output, real X(N).
%    On input, an estimate for the solution, which may be 0.
%    On output, the approximate solution vector.  
%

%
%  Initialize
%    AP = A * x,
%    R  = b - A * x,
%    P  = b - A * x.
%
  ap(1:n,1) = mv_st ( n, n, nz_num, row, col, a, x );

  r(1:n,1) = b(1:n,1) - ap(1:n,1);
  p(1:n,1) = b(1:n,1) - ap(1:n,1);
%
%  Do the N steps of the conjugate gradient method.
%
  for it = 1 : n
%
%  Compute the matrix*vector product AP = A*P.
%
    ap(1:n,1) = mv_st ( n, n, nz_num, row, col, a, p );
%
%  Compute the dot products
%    PAP = P*AP,
%    PR  = P*R
%  Set
%    ALPHA = PR / PAP.
%
    pap = p(1:n,1)' * ap(1:n,1);
    pr =  p(1:n,1)' * r(1:n,1);

    if ( pap == 0.0 )
      return;
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
    rap = r(1:n,1)' * ap(1:n,1);

    beta = - rap / pap;
%
%  Update the perturbation vector
%    P = R + BETA * P.
%
    p(1:n,1) = r(1:n,1) + beta * p(1:n,1);

  end

  return
end
