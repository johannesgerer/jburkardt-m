function [ x, d, u ] = pvandprg ( n, alpha, b, x, d, u )

%*****************************************************************************80
%
%% PVANDPRG solves a Vandermonde system A * x = f progressively.
%
%  Discussion:
%
%    This function receives the solution to the system of equations A * x = f
%    where A is a Vandermonde matrix for alpha(0) through alpha(n-1),
%    and new values alpha(n) and f(n).  It updates the solution.
%
%    To solve a system of Nbig equations, this function may be called repeatedly,
%    with N = 1, 2, ..., Nbig.  Each time, a solution to the current subsystem
%    is returned.
%
%    Note that the reference, which lists an Algol version of this algorithm, 
%    omits a minus sign, writing
%      u[j] := u[j] x delta;
%    where
%      u[j] := - u[j] x delta;
%    is actually necessary.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2014
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
%    Input, real D(N-1), real U(N-1), factorization data from the previous call.
%
%    Output, real X(N), the updated solution to the linear system.
%
%    Output, real D(N), U(N), updated factorization data.
%
  d(n) = b(n);
  for j = n - 1 : -1 : 1
    d(j) = d(j+1) - alpha(n-j) * d(j);
  end

  dn = d(1);
  u(n) = 1.0;

  for j = 1 : n - 1
    delta = alpha(n) - alpha(j);
    u(j) = - u(j) * delta;
    u(n) = u(n) * delta;
    x(j) = x(j) + dn / u(j);
  end

  x(n) = dn / u(n);

  return
end
