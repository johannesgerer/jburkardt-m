function u_index = unicycle_index ( n, u )

%*****************************************************************************80
%
%% UNICYCLE_INDEX returns the index form of a unicycle.
%
%  Example:
%
%    N = 4
%
%    U       = 1 3 4 2
%    U_INDEX = 3 1 4 2
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
%    Output, integer U_INDEX(N), the unicycle index vector.
%
  for i = 1 : n
    ip1 = i4_wrap ( i + 1, 1, n );
    u_index(u(i)) = u(ip1);
  end

  return
end
