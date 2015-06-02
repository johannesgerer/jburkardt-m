function x = tridisolve ( a, b, c, d )

%*****************************************************************************80
%
%% TRIDISOLVE solves a tridiagonal system of linear equations.
%
%  Discussion:
%
%    We can describe an NxN tridiagonal matrix by vectors A, B, and C, where
%    A and C are of length N-1.  In that case, a linear system can be
%    represented as
%                        b(1) * x(1) + c(1) * x(2)   = d(1),
%      a(j-1) * x(j-1) + b(j) * x(j) + c(j) * x(j+1) = d(j), j = 2:n-1,
%      a(n-1) * x(n-1) + b(n) * x(n)                 = d(n)
%
%    This function produces the solution vector X.
%
%    This function is derived from Cleve Moler's Matlab suite.
%
%  Modified:
%
%    19 May 2013
%
%  Author:
%
%    Cleve Moler.
%
%  Parameters:
%
%    Input, real A(N-1), B(N), C(N-1), the matrix entries.
%
%    Input, real D(N), the right hand side.
%
%    Output, real X(N), the solution.
%
  x = d;
  n = length ( x );
  bi = zeros ( n, 1 );

  for j = 1 : n - 1
    bi(j) = 1.0 / b(j);
    mu = a(j) * bi(j);
    b(j+1) = b(j+1) - mu * c(j);
    x(j+1) = x(j+1) - mu * x(j);
  end

  x(n) = x(n) / b(n);
  for j = n - 1 : -1 : 1
    x(j) = ( x(j) - c(j) * x(j+1) ) * bi(j);
  end

  return
end
