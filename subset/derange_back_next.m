function [ a, more ] = derange_back_next ( n, a, more )

%*****************************************************************************80
%
%% DERANGE_BACK_NEXT returns the next derangement of N items.
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
%    This routine uses backtracking.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items to be deranged.
%
%    Input, integer A(N), the output value of A from the previous call.
%    On first call with MORE = FALSE, the input value of A is not important.
%
%    Input, logical MORE, should be set to FALSE on the first call, to force
%    initialization, and should be TRUE thereafter.
%
%    Output, integer A(N), contains the next derangement, if MORE is TRUE.
%
%    Output, logical MORE, is TRUE if another derangement was found, and
%    FALSE if there are no more derangements to return.
%
  persistent indx;
  persistent k;
  persistent maxstack;
  persistent nstack;
  persistent stacks;
  persistent ncan;

  if ( ~more )

    if ( n < 2 )
      more = 0;
      return
    end

    indx = 0;
    k = 0;
    maxstack = floor ( ( n * ( n + 1 ) ) / 2 );
    nstack = 0;
    stacks(1:maxstack) = 0;
    ncan(1:n) = 0;
    more = 1;

  end

  while ( 1 )

    [ a, indx, k, nstack, ncan ] = i4vec_backtrack ( ...
      n, maxstack, stacks, a, indx, k, nstack, ncan );

    if ( indx == 1 )

      break;

    elseif ( indx == 2 )

      [ nstack, stacks, ncan ] = derange_back_candidate ( n, a, k, nstack, ...
        stacks, ncan );

    else

      more = 0;
      break;

    end

  end

  return
end
