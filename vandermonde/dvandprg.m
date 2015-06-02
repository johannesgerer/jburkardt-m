function [ x, c, m ] = dvandprg ( n, alpha, b, x, c, m )

%*****************************************************************************80
%
%% DVANDPRG solves a Vandermonde system A' * x = f progressively.
%
%  Discussion:
%
%    This function receives the solution to the system of equations A' * x = f
%    where A is a Vandermonde matrix for alpha(0) through alpha(n-1),
%    and new values alpha(n) and f(n).  It updates the solution.
%
%    To solve a system of Nbig equations, this function may be called repeatedly,
%    with N = 1, 2, ..., Nbig.  Each time, a solution to the current subsystem
%    is returned.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Ake Bjorck, Victor Pereyra,
%    Solution of Vandermonde Systems of Equations,
%    Mathematics of Computation,
%    Volume 24, Number 112, October 1970, pages 893-903.
%
%  Parameters:
%
%    Input, integer N, the new order of the matrix, which is 1 larger
%    than on the previous call.  For the first call, N must be 1.
%
%    Input, real ALPHA(N), the parameters that define the matrix.
%    The values should be distinct.  The value ALPHA(N) has just been
%    added to the system.
%
%    Input, real B(N), the right hand side of the linear system.
%
%    Input, real X(N-1), the previous solution of the linear system.
%
%    Input, real C(N-1), real M(N-1), factorization data from the previous call.
%
%    Output, real X(N), the updated solution to the linear system.
%
%    Output, real C(N), M(N), updated factorization data.
%
  c(n) = b(n);
  for j = n - 1 : -1 : 1
    c(j) = ( c(j+1) - c(j) ) / ( alpha(n) - alpha(j) );
  end

  if ( n == 1 )
    m(n) = 1.0;
  else
    m(n) = 0.0;
  end
  cn = c(1);
  x(n) = c(1);

  for j = n - 1 : -1 : 1
    m(j+1) = m(j+1) - alpha(n-1) * m(j);
    x(n-j) = x(n-j) + m(j+1) * cn;
  end

  return
end
