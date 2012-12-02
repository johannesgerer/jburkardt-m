function x = r8sm_sl ( n, a_lu, u, v, b, pivot, job )

%*****************************************************************************80
%
%% R8SM_SL solves a square R8SM system that has been factored.
%
%  Discussion:
%
%    The R8SM storage format is used for an M by N Sherman Morrison matrix B,
%    which is defined by an M by N matrix A, an M vector U, and
%    an N vector V, by B = A - U * V'
%
%    It is assumed that A has been decomposed into its LU factors
%    by R8GE_FA.  The Sherman Morrison formula allows
%    us to solve linear systems involving (A-u*v') by solving linear
%    systems involving A and adjusting the results.
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
%    Kahaner, Moler, and Nash
%    Numerical Methods and Software,
%    Prentice Hall, 1989
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A_LU(N,N), the LU factors from R8GE_FA.
%
%    Input, real U(N), V(N), the R8SM vectors U and V.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, integer PIVOT(N), the pivot vector produced by R8GE_FA.
%
%    Input, integer JOB, specifies the system to solve.
%    0, solve (A-u*v') * X = B.
%    nonzero, solve (A-u*v') * X = B.
%
%    Output, real X(N), the solution vector.
%
  if ( job == 0 )
%
%  Solve A' * w = v.
%
    job_local = 1;
    w = r8ge_sl ( n, a_lu, pivot, v, job_local );
%
%  Set beta = w' * b.
%
    beta = w(1:n) * b(1:n)';
%
%  Solve A * x = b.
%
    job_local = 0;
    x = r8ge_sl ( n, a_lu, pivot, b, job_local );
%
%  Solve A * w = u.
%
    job_local = 0;
    w = r8ge_sl ( n, a_lu, pivot, u, job_local );
%
%  Set alpha = 1 / ( 1 - v' * w ).
%
    alpha = 1.0E+00 - v(1:n) * w(1:n)';

  else
%
%  Solve A * w = u.
%
    job_local = 0;
    w = r8ge_sl ( n, a_lu, pivot, u, job_local );
%
%  Set beta = w' * b.
%
    beta = w(1:n) * b(1:n)';
%
%  Solve A' * x = b.
%
    job_local = 1;
    x = r8ge_sl ( n, a_lu, pivot, b, job_local );
%
%  Solve A' * w = v.
%
    job_local = 1;
    w = r8ge_sl ( n, a_lu, pivot, v, job_local );
%
%  Set alpha = 1 / ( 1 - u' * w ).
%
    alpha = 1.0E+00 - u(1:n) * w(1:n)';

  end

  if ( alpha == 0.0E+00 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8SM_SL - Fatal error!\n' );
    fprintf ( 1, '  The divisor ALPHA is zero.\n' );
    error ( 'R8SM_SL - Fatal error!' );
  end

  alpha = 1.0E+00 / alpha;
%
%  Set b = b + alpha * beta * w.
%
  x(1:n) = x(1:n) + alpha * beta * w(1:n);

  return
end
