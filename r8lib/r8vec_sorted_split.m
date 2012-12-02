function [ i_lt, i_gt ] = r8vec_sorted_split ( n, a, split )

%*****************************************************************************80
%
%% R8VEC_SORTED_SPLIT "splits" a sorted R8VEC, given a splitting value.
%
%  Discussion:
%
%    Given SPLIT, the routine seeks indices I_LT and I_GT so that
%
%      A(I_LT) < SPLIT < A(I_GT),
%
%    and if there are intermediate index values between I_LT and
%    I_GT, then those entries of A are exactly equal to SPLIT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters
%
%    Input, integer N, the number of entries in A.
%
%    Input, real A(N), a sorted array.
%
%    Input, real SPLIT, a value to which the entries in A are
%    to be compared.
%
%    Output, integer I_LT:
%    0 if no entries are less than SPLIT;
%    N if all entries are less than SPLIT;
%    otherwise, the index of the last entry in A less than SPLIT.
%
%    Output, integer I_GT:
%    1 if all entries are greater than SPLIT;
%    N+1 if no entries are greater than SPLIT;
%    otherwise the index of the first entry in A greater than SPLIT.
%
  if ( n < 1 )
    i_lt = -1;
    i_gt = -1;
    return
  end

  if ( split < a(1) )
    i_lt = 0;
    i_gt = 1;
    return
  end

  if ( a(n) < split )
    i_lt = n;
    i_gt = n + 1;
    return
  end

  lo = 1;
  hi = n;

  while ( 1 )

    if ( lo + 1 == hi )
      i_lt = lo;
      break
    end

    mid = round ( ( lo + hi ) / 2 );

    if ( split <= a(mid) )
      hi = mid;
    else
      lo = mid;
    end

  end

  for i = i_lt + 1 : n
    if ( split < a(i) )
      i_gt = i;
      return
    end
  end

  i_gt = n + 1;

  return
end
