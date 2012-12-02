function x = r83_cr_sl ( n, a_cr, b )

%*****************************************************************************80
%
%% R83_CR_SL solves a real linear system factored by R83_CR_FA.
%
%  Discussion:
%
%    The matrix A must be tridiagonal.  R83_CR_FA is called to compute the
%    LU factors of A.  It does so using a form of cyclic reduction.  If
%    the factors computed by R83_CR_FA are passed to R83_CR_SL, then one or many
%    linear systems involving the matrix A may be solved.
%
%    Note that R83_CR_FA does not perform pivoting, and so the solution 
%    produced by R83_CR_SL may be less accurate than a solution produced 
%    by a standard Gauss algorithm.  However, such problems can be 
%    guaranteed not to occur if the matrix A is strictly diagonally 
%    dominant, that is, if the absolute value of the diagonal coefficient 
%    is greater than the sum of the absolute values of the two off diagonal 
%    coefficients, for each row of the matrix.
%
%  Example:
%
%    Here is how a R83 matrix of order 5 would be stored:
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
%    22 March 2004
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
%    Input, real A_CR(3,2*N+1), factorization information computed by R83_CR_FA.
%
%    Input, real B(N), the right hand side vector.
%
%    Output, real X(N), the solution of the linear system.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R83_CR_SL - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive N = %d\n', n );
    return
  end

  x = zeros ( n, 1 );

  if ( n == 1 )
    x(1) = a_cr(2,2) * b(1);
    return
  end
%
%  Set up RHS.
%
  rhs = zeros ( 2 * n + 1, 1 );

  rhs(1) = 0.0;
  rhs(2:n+1) = b(1:n);
  rhs(n+2:2*n+1) = 0.0;

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
      rhs(ihaf+1) = rhs(iful+1) - a_cr(3,iful) * rhs(iful) ...
        - a_cr(1,iful+1) * rhs(iful+2);
    end

  end

  rhs(ihaf+1) = rhs(ihaf+1) * a_cr(2,ihaf+1);
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
      rhs(iful+1) = rhs(ihaf+1);
      rhs(ifulm+1) = a_cr(2,ifulm+1) * ( rhs(ifulm+1) ...
        - a_cr(3,ifulm) * rhs(ifulm) ...
        - a_cr(1,ifulm+1) * rhs(iful+1) );
    end

  end

  x(1:n) = rhs(2:n+1);

  return
end
