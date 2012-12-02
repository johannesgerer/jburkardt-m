function [ a, more ] = derange_weed_next ( n, a, more )

%*****************************************************************************80
%
%% DERANGE_WEED_NEXT computes all of the derangements of N objects, one at a time.
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
%    This routine simply generates all permutations, one at a time,
%    and weeds out those that are not derangements.
%
%  Example:
%
%    Here are the derangements when N = 4:
%
%    2143  3142  4123
%    2341  3412  4312
%    2413  3421  4321
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
%    Input, integer N, the number of objects being permuted.
%
%    Input, integer A(N).  On an initialization call, A is ignored.
%    Otherwise, A should be the output value of A from the previous call.
%
%    Input, logical MORE, is FALSE on an initialization call, and TRUE otherwise.
%
%    Output, integer A(N), if MORE is TRUE, the next derangement.
%    If MORE is FALSE, then A contains no useful information.
%
%    Output, logical MORE is TRUE if the next derangement was output in
%    A, and FALSE if there are no more derangements.
%
  persistent maxder;
  persistent numder;
%
%  Initialization on call with MORE = FALSE.
%
  if ( ~more )
    a = [];
    maxder = derange_enum ( n );
    numder = 0;
  end
%
%  Watch out for cases where there are no derangements.
%
  if ( maxder == 0 )
    more = 0;
    return
  end
%
%  Get the next permutation.
%
  while ( 1 )

    [ a, more ] = perm_lex_next ( n, a, more );
%
%  See if it is a derangment.
%
    deranged = derange_check ( n, a );

    if ( deranged )
      break;
    end

  end

  numder = numder + 1;

  if ( maxder <= numder )
    more = 0;
  end

  return
end
