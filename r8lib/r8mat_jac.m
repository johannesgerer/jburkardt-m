function fprime = r8mat_jac ( m, n, eps, fx, x )

%*****************************************************************************80
%
%% R8MAT_JAC estimates a dense jacobian matrix of the function FX.
%
%  Discussion:
%
%    FPRIME(I,J) = d F(I) / d X(J).
%
%    The jacobian is assumed to be dense, and the LINPACK/LAPACK
%    general matrix storage mode ("GE") is used.
%
%    Forward differences are used, requiring N+1 function evaluations.
%
%    Values of EPS have typically been chosen between
%    sqrt ( EPSMCH ) and sqrt ( sqrt ( EPSMCH ) ) where EPSMCH is the
%    machine tolerance.
%
%    If EPS is too small, then F(X+EPS) will be the same as
%    F(X), and the jacobian will be full of zero entries.
%
%    If EPS is too large, the finite difference estimate will
%    be inaccurate.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of functions.
%
%    Input, integer N, the number of variables.
%
%    Input, real EPS, a tolerance to be used for shifting the
%    X values during the finite differencing.  No single value
%    of EPS will be reliable for all vectors X and functions FX.
%
%    Input, external FX, the name of the user written
%    routine which evaluates the function at a given point X.
%
%    FX should have the form:
%
%      function f = fx ( m, n, x )
%
%    Input, real X(N), the point where the jacobian
%    is to be estimated.
%
%    Output, real FPRIME(M,N), the M by N estimated jacobian
%    matrix.
%

%
%  Evaluate the function at the base point, X.
%
  work2 = feval ( fx, m, n, x );
%
%  Now, one by one, vary each component J of the base point X, and
%  estimate DF(I)/DX(J) = ( F(X+) - F(X) )/ DEL.
%
  for j = 1 : n

    xsave = x(j);
    del = eps * ( 1.0 + abs ( x(j) ) );
    x(j) = x(j) + del;
    work1 = feval ( fx, m, n, x );
    x(j) = xsave;
    fprime(1:m,j) = ( work1(1:m) - work2(1:m) )' / del;

  end

  return
end
