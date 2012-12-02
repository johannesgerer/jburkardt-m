function u_inverse = unicycle_inverse ( n, u )

%*****************************************************************************80
%
%% UNICYCLE_INVERSE returns the inverse of a unicycle.
%
%  Example:
%
%    N = 4
%
%    U         = 1 3 4 2
%    U_INVERSE = 1 2 4 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the unicycles.
%
%    Input, integer U(N), the unicycle sequence vector.
%
%    Output, integer U_INVERSE(N), the inverse unicycle.
%
  u_inverse(1) = 1;
  u_inverse(2:n) = u(n:-1:2);

  return
end
