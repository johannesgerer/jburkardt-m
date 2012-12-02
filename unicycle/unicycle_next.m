function [ u, rank ] = unicycle_next ( n, u, rank )

%*****************************************************************************80
%
%% UNICYCLE_NEXT generates unicycles in lexical order, one at a time.
%
%  Example:
%
%    N = 4
%
%    1   1 2 3 4
%    2   1 2 4 3
%    3   1 3 2 4
%    4   1 3 4 2
%    5   1 4 2 3
%    6   1 4 3 2
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
%    Input/output, integer U(N); on first call with MORE = FALSE,
%    this value is not used.  Otherwise, the input value is the previous
%    unicycle.  The output value is the next unicycle.
%
%    Input/output, integer RANK, the rank.
%    If RANK = -1 on input, then the routine understands that this is
%    the first call, and that the user wishes the routine to supply
%    the first element in the ordering, which has RANK = 0.
%    In general, the input value of RANK is increased by 1 for output,
%    unless the very last element of the ordering was input, in which
%    case the output value of RANK is -1.
%
  if ( rank == -1 )
    u(1) = 1;
    p = [];
  else
    p(1:n-1) = u(2:n) - 1;
  end

  [ p, rank ] = perm_lex_next ( n - 1, p, rank );

  u(2:n) = p(1:n-1) + 1;

  return
end
