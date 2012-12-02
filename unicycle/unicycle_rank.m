function rank = unicycle_rank ( n, u )

%*****************************************************************************80
%
%% UNICYCLE_RANK computes the rank of a unicycle.
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
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the order of the unicycle.
%
%    Input, integer U(N), a unicycle in sequence form.
%
%    Output, integer RANK, the rank of the unicycle.
%
  p(1:n-1) = u(2:n) - 1;

  rank = perm_lex_rank ( n - 1, p );

  return
end
