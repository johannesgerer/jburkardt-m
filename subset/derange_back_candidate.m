function [ nstack, stacks, ncan ] = derange_back_candidate ( ...
  n, a, k, nstack, stacks, ncan )

%*****************************************************************************80
%
%% DERANGE_BACK_CANDIDATE finds possible values for the K-th entry of a derangement.
%
%  Discussion:
%
%    A derangement of N objects is a permutation which leaves no object
%    unchanged.
%
%    A derangement of N objects is a permutation with no fixed
%    points.  If we symbolize the permutation operation by "P",
%    then for a derangment, P(I) is never equal to I.
%
%    The number of derangements of N objects is sometimes called
%    the subfactorial function, or the derangement number D(N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the derangement.
%
%    Input, integer A(N).  The first K-1 entries of A
%    record the currently set values of the derangement.
%
%    Input, integer K, the entry of the derangement for which candidates
%    are to be found.
%
%    Input, integer NSTACK, the length of the stack.
%
%    Input, integer STACKS((N*(N+1))/2).
%
%    Input, integer NCAN(N), the number of candidates for each level.
%
%    Output, integer NSTACK, the length of the output stack.
%
%    Output, integer STACKS((N*(N+1))/2), contains candidates for entry K
%    added to the end of the stack.
%
%    Output, integer NCAN(N), the number of candidates for each level.
%

%
%  Consider all the integers from 1 through N that have not been used yet.
%
  nfree = n - k + 1;

  ifree = perm_free ( k - 1, a, nfree );
%
%  Everything but K is a legitimate candidate for the K-th entry.
%
  ncan(k) = 0;

  for ican = 1 : nfree

    if ( ifree(ican) ~= k )
      ncan(k) = ncan(k) + 1;
      nstack = nstack + 1;
      stacks(nstack) = ifree(ican);
    end

  end

  return
end
