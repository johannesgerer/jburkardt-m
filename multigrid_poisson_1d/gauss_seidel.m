function [ u, dif_l1 ] = gauss_seidel ( n, r, u )

%*****************************************************************************80
%                                                    
%% GAUSS_SEIDEL carries out one step of a Gauss-Seidel iteration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2011
%
%  Author:
%
%    John Burkardt
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
%    Input, integer N, the number of unknowns.
%
%    Input, real R(N,1), the right hand side.
%
%    Input/output, real U(N,1), the estimated solution.
%
%    Output, real DIF_L1, the L1 norm of the difference between the
%    input and output solution estimates.
%
  u_old(1:n,1) = u(1:n,1);

  for i = 2 : n - 1
    u(i) = 0.5 * ( u(i-1) + u_old(i+1) + r(i) );
  end 

  dif_l1 = sum ( abs ( u(2:n-1) - u_old(2:n-1) ) );

  return
end
