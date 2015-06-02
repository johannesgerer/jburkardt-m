function [ u, it_num ] = multigrid_poisson_1d ( n, a, b, ua, ub, force, exact )

%*****************************************************************************80
%                                                    
%% MULTIGRID_POISSON_1D solves a 1D PDE using the multigrid method.
%
%  Discussion:
%
%    This routine solves a 1D boundary value problem of the form
%
%      - U''(X) = F(X) for A < X < B,
%
%    with boundary conditions U(A) = UA, U(B) = UB.
%
%    The multigrid method is used. 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 July 2014
%
%  Author:
%
%    Original FORTRAN77 version by William Hager.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    William Hager,
%    Applied Numerical Linear Algebra,
%    Prentice-Hall, 1988,
%    ISBN13: 978-0130412942,
%    LC: QA184.H33.
%
%  Parameters:
%
%    Input, integer N, the number of intervals.
%    N must be a power of 2.
%
%    Input, real A, B, the left and right endpoints of the region.
%
%    Input, real UA, UB, the left and right boundary values.
%
%    Input, function value = FORCE ( x ), the name of the function 
%    which evaluates the right hand side.
%
%    Input, function value = EXACT ( x ), the name of the function 
%    which evaluates the exact solution.
%
%    Output, integer IT_NUM, the number of iterations.
%
%    Output, real U(N+1), the computed solution.
%

%
%  Determine if we have enough storage.
%
  k = i4_log_2 ( n );

  if ( n ~= 2^k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MULTIGRID_POISSON_1D - Fatal error!\n' );
    fprintf ( 1, '  N is not a power of 2.\n' );
    error ( 'MULTIGRID_POISSON_1D - Fatal error!' );
  end

  nl = n + n + k - 2;

  uu = zeros ( nl, 1 );
  r = zeros ( nl, 1 );
%
%  Initialization.
%
  it = 4;
  it_num = 0;
  tol = 0.0001;
  utol = 0.7;
  m = n;
% 
%  Set the nodes.
%
  x = ( linspace ( a, b, n + 1 ) )';
%
%  Set the right hand side.
%
  r = zeros ( n + 1, 1 );
  r(1) = ua;
  r(2:n) = force ( x(2:n) ) / n / n;
  r(n+1) = ub;
%
%  L points to first entry of solution.
%  LL points to penultimate entry.
%
  l = 1;
  ll = n;
% 
%  Gauss-Seidel iteration
%
  d1 = 0.0;
  j = 0;

  while ( 1 )

    d0 = d1;
    j = j + 1;
    [ uu(l:ll+1), d1 ] = gauss_seidel ( n + 1, r(l:ll+1), uu(l:ll+1) );
    it_num = it_num + 1;
%
%  Do at least 4 iterations at each level.
%
    if ( j < it )

      continue
%
%  Enough iterations, satisfactory decrease, on finest grid, exit.
%
    elseif ( d1 < tol && n == m )

      break
%
%  Enough iterations, satisfactory convergence, go finer.
%
    elseif ( d1 < tol )

      uu(l-1-n-n:l-1) = ctof ( n + 1, uu(l:ll+1), n + n + 1, uu(l-1-n-n:l-1) );

      n = n + n;
      ll = l - 2;
      l = l - 1 - n;
      j = 0;
%
%  Enough iterations, slow convergence, 2 < N, go coarser.
%
    elseif ( utol * d0 <= d1 && 2 < n )

      [ uu(l+n+1:l+n+1+(n/2)), r(l+n+1:l+n+1+(n/2)) ] = ...
        ftoc ( n + 1, uu(l:ll+1), r(l:ll+1), (n/2)+1 );

      n = n / 2;
      l = ll + 2;
      ll = ll + n + 1;
      j = 0;

    end

  end

  u(1:n+1) = uu(1:n+1);

  return
end

