function pinv = perm_inverse ( n, p )

%*****************************************************************************80
%
%% PERM_INVERSE computes the inverse of a permutation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of values being permuted.
%    N must be positive.
%
%    Input, integer P(N), describes the permutation.
%    P(I) is the item which is permuted into the I-th place
%    by the permutation.
%
%    Output, integer PINV(N), the inverse permutation.
%

%
%  Check.
%
  perm_check ( n, p );

  pinv(p(1:n)) = 1:n;

  return
end
