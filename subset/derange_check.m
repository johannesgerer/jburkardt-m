function deranged = derange_check ( n, a )

%*****************************************************************************80
%
%% DERANGE_CHECK determines whether a permutation is a derangement.
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
%    12 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects permuted.
%
%    Input, integer A(N), a permutation of the integers 1 through N.
%
%    Output, logical DERANGED, is TRUE if A is a derangement, and
%    FALSE otherwise.
%
  for i = 1 : n
    if ( a(i) == i )
      deranged = 0;
      return
    end
  end

  deranged = 1;

  return
end
