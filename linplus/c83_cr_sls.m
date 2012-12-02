function x = c83_cr_sls ( n, a_cr, nb, b )

%*****************************************************************************80
%
%% C83_CR_SLS solves several complex linear systems factored by C83_CR_FA.
%
%  Discussion:
%
%    The matrix A must be tridiagonal.  C83_CR_FA is called to compute the
%    LU factors of A.  It does so using a form of cyclic reduction.  If
%    the factors computed by C83_CR_FA are passed to C83_CR_SLS, then one or many
%    linear systems involving the matrix A may be solved.
%
%    Note that C83_CR_FA does not perform pivoting, and so the solution 
%    produced by C83_CR_SLS may be less accurate than a solution produced 
%    by a standard Gauss algorithm.  However, such problems can be 
%    guaranteed not to occur if the matrix A is strictly diagonally 
%    dominant, that is, if the absolute value of the diagonal coefficient 
%    is greater than the sum of the absolute values of the two off diagonal 
%    coefficients, for each row of the matrix.
%
%  Example:
%
%    Here is how a C83 matrix of order 5 would be stored:
%
%       *  A12 A23 A34 A45
%      A11 A22 A33 A44 A55
%      A21 A32 A43 A54  *
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 May 2010
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Roger Hockney,
%    A fast direct solution of Poisson's equation using Fourier Analysis,
%    Journal of the ACM,
%    Volume 12, Number 1, pages 95-113, January 1965.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, complex A_CR(3,2*N+1), factorization information computed by C83_CR_FA.
%
%    Input, integer NB, the number of right hand sides.
%
%    Input, complex B(N,NB), the right hand side vectors.
%
%    Output, complex X(N,NB), the solutions of the linear system.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'C83_CR_SLS - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive N = %d\n', n );
    return
  end

  x = zeros ( n, nb );

  if ( n == 1 )
    x(1,1:nb) = a_cr(2,2) * b(1,1:nb);
    return
  end
%
%  Set up RHS.
%
  rhs = zeros ( 2 * n + 1, nb );

  rhs(1,1:nb) = 0.0;
  rhs(2:n+1,1:nb) = b(1:n,1:nb);
  rhs(n+2:2*n+1,1:nb) = 0.0;

  il = n;
  ndiv = 1;
  ipntp = 0;

  while ( 1 < il )

    ipnt = ipntp;
    ipntp = ipntp + il;
    il = floor ( il / 2 );
    ndiv = ndiv * 2;
    ihaf = ipntp;

    for iful = ipnt + 2 : 2 : ipntp
      ihaf = ihaf + 1;
      rhs(ihaf+1,1:nb) = rhs(iful+1,1:nb) ...
        - a_cr(3,iful) * rhs(iful,1:nb) ...
        - a_cr(1,iful+1) * rhs(iful+2,1:nb);
    end

  end

  rhs(ihaf+1,1:nb) = rhs(ihaf+1,1:nb) * a_cr(2,ihaf+1);
  ipnt = ipntp;

  while ( 0 < ipnt )

    ipntp = ipnt;
    ndiv = floor ( ndiv / 2 );
    il = floor ( n / ndiv );
    ipnt = ipnt - il;
    ihaf = ipntp;

    for ifulm = ipnt + 1 : 2 : ipntp
      iful = ifulm + 1;
      ihaf = ihaf + 1;
      rhs(iful+1,1:nb) = rhs(ihaf+1,1:nb);
      rhs(ifulm+1,1:nb) = a_cr(2,ifulm+1) * ( rhs(ifulm+1,1:nb) ...
        - a_cr(3,ifulm) * rhs(ifulm,1:nb) ...
        - a_cr(1,ifulm+1) * rhs(iful+1,1:nb) );
    end

  end

  x(1:n,1:nb) = rhs(2:n+1,1:nb);

  return
end
