function [ x_new, itknt ] = r8pbu_sor ( n, mu, a, b, eps, itchk, itmax, omega, x )

%*****************************************************************************80
%
%% R8PBU_SOR uses SOR iteration to solve a R8PBU linear system.
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
%    A relaxation factor OMEGA may be used.
%
%    The iteration will proceed until a convergence test is met,
%    or the iteration limit is reached.
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
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer MU, the number of superdiagonals in the matrix.
%    MU must be at least 0, and no more than N-1.
%
%    Input, real A(MU+1,N), the R8PBU matrix.
%
%    Input, real B(N), the right hand side of the system.
%
%    Input, real EPS, convergence tolerance for the system.  The vector
%    b - A * x is computed every ITCHK iterations, and if the maximum
%    entry of this vector is of norm less than EPS, the program
%    will return.
%
%    Input, integer ITCHK, the interval between convergence checks.  ITCHK steps
%    will be taken before any check is made on whether the iteration
%    has converged.  ITCHK should be at least 1 and no greater
%    than ITMAX.
%
%    Input, integer ITMAX, the maximum number of iterations allowed.  The
%    program will return to the user if this many iterations are taken
%    without convergence.
%
%    Input, real OMEGA, the relaxation factor.  OMEGA must be strictly between
%    0 and 2.  Use OMEGA = 1 for no relaxation, classical Jacobi iteration.
%
%    Input, real X(N), a starting vector for the iteration.
%
%    Output, real X_NEW(N), the current approximation to the solution.
%
%    Output, integer ITKNT, the number of iterations taken.
%
  itknt = 0;
  x_new(1:n) = x(1:n);

  if ( itchk <= 0 | itmax < itchk )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8PBU_SOR - Fatal error!\n' );
    fprintf ( 1, '  Illegal ITCHK = %d\n', itchk );
    return;
  end

  if ( itmax <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8PBU_SOR - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive ITMAX = %d\n', itmax );
    return;
  end

  if ( omega <= 0.0 | 2.0 <= omega )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8PBU_SOR - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of OMEGA = %f\n', omega );
    return;
  end

  itknt = 0;
%
%  Take ITCHK steps of the iteration before doing a convergence check.
%
  while ( itknt <= itmax )

    for it = 1 : itchk
%
%  Compute XTEMP(I) = B(I) + A(I,I) * X(I) - SUM ( 1 <= J <= N ) A(I,J) * X(J).
%
      xtemp(1:n) = r8pbu_mxv ( n, mu, a, x_new );

      xtemp(1:n) = x_new(1:n) + ( b(1:n) - xtemp(1:n) ) ./ a(mu+1,1:n);
%
%  Compute the next iterate as a weighted combination of the
%  old iterate and the just computed standard Jacobi iterate.
%
      if ( omega ~= 1.0 )
        xtemp(1:n) = ( 1.0 - omega ) * x_new(1:n) + omega * xtemp(1:n);
      end

      itknt = itknt + 1;
%
%  Copy the new result into the old result vector.
%
      x_new(1:n) = xtemp(1:n);

    end
%
%  Compute the maximum residual, the greatest entry in the vector
%  RESID(I) = B(I) - A(I,J) * X(J).
%
    xtemp(1:n) = r8pbu_mxv ( n, mu, a, x_new );

    err = 0.0;
    for i = 1 : n
      err = max ( err, abs ( b(i) - xtemp(i) ) );
    end
%
%  Test to see if we can quit because of convergence,
%
    if ( err <= eps )
      return;
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8PBU_SOR - Warning!\n' );
  fprintf ( 1, '  The iteration did not converge.\n' );

  return
end
