function u = unicycle_unrank ( n, rank )

%*****************************************************************************80
%
%% UNICYCLE_UNRANK "unranks" a unicycle.
%
%  Discussion:
%
%    That is, given a rank, it computes the corresponding unicycle.
%
%    The value of the rank should be between 0 and (N-1)%-1.
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
%  Reference:
%
%    Dennis Stanton, Dennis White,
%    Constructive Combinatorics,
%    Springer, 1986,
%    ISBN: 0387963472,
%    LC: QA164.S79.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the set.
%
%    Input, integer RANK, the desired rank of the permutation.
%
%    Output, integer U(N), the unicycle.
%
  p = perm_lex_unrank ( n - 1, rank );

  u(1) = 1;
  u(2:n) = p(1:n-1) + 1;

  return
end
