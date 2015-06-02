function x_new = r8sd_cg ( n, ndiag, offset, a, b, x )

%*****************************************************************************80
%
%% R8SD_CG uses the conjugate gradient method on a R8SD linear system.
%
%  Discussion:
%
%    The R8SD storage format is for symmetric matrices whose only nonzero entries
%    occur along a few diagonals, but for which these diagonals are not all
%    close enough to the main diagonal for band storage to be efficient.
%
%    In that case, we assign the main diagonal the offset value 0, and 
%    each successive superdiagonal gets an offset value 1 higher, until
%    the highest superdiagonal (the A(1,N) entry) is assigned the offset N-1.
%
%    Assuming there are NDIAG nonzero diagonals (ignoring subdiagonals!),
%    we then create an array B that has N rows and NDIAG columns, and simply
%    "collapse" the matrix A to the left:
%
%    For the conjugate gradient method to be applicable, the matrix A must 
%    be a positive definite symmetric matrix.
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
%    19 March 2004
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
%    Input, integer NDIAG, the number of diagonals that are stored.
%    NDIAG must be at least 1 and no more than N.
%
%    Input, integer OFFSET(NDIAG), the offsets for the diagonal storage.
%
%    Input, real A(N,NDIAG), the R8SD matrix.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, real X(N), an estimate for the solution, which may be 0.
%
%    Output, real X_NEW(N), the approximate solution vector.  Note that 
%    repeated calls to this routine, with the output X_NEW from the
%    previous call used as the input value of X, MAY improve the solution.
%
  x_new(1:n) = x(1:n);
%
%  Initialize
%    AP = A * x,
%    R  = b - A * x,
%    P  = b - A * x.
%
  ap(1:n) = r8sd_mxv ( n, ndiag, offset, a, x_new );

  r(1:n) = b(1:n) - ap(1:n);
  p(1:n) = b(1:n) - ap(1:n);
%
%  Do the N steps of the conjugate gradient method.
%
  for it = 1 : n
%
%  Compute the matrix*vector product AP = A*P.
%
    ap(1:n) = r8sd_mxv ( n, ndiag, offset, a, p );
%
%  Compute the dot products
%    PAP = P*AP,
%    PR  = P*R
%  Set
%    ALPHA = PR / PAP.
%
    pap = p(1:n) * ap(1:n)';
    pr =  p(1:n) * r(1:n)';

    if ( pap == 0.0E+00 )
      return;
    end

    alpha = pr / pap;
%
%  Set
%    X = X + ALPHA * P
%    R = R - ALPHA * AP.
%
    x_new(1:n) = x_new(1:n) + alpha * p(1:n);
    r(1:n) = r(1:n) - alpha * ap(1:n);
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
