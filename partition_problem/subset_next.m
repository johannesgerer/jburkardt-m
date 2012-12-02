function [ t, rank ] = subset_next ( n, t, rank )

%*****************************************************************************80
%
%% SUBSET_NEXT computes the subset lexicographic successor.
%
%  Discussion:
%
%    This is a lightly modified version of "subset_lex_successor()" from COMBO.
%
%  Example:
%
%    On initial call, N is 5 and the input value of RANK is -1.
%    Then here are the successive outputs from the program:
%
%   Rank   T1   T2   T3   T4   T5
%   ----   --   --   --   --   --
%      0    0    0    0    0    0
%      1    0    0    0    0    1
%      2    0    0    0    1    0
%      3    0    0    0    1    1
%     ..   ..   ..   ..   ..   ..
%     30    1    1    1    1    0
%     31    1    1    1    1    1
%     -1    0    0    0    0    0  <-- Reached end of cycle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2012
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
%    Input, integer N, the number of elements in the master set.
%    N must be positive.
%
%    Input/output, integer T(N), describes a subset.  T(I) is 0 if
%    the I-th element of the master set is not in the subset, and is
%    1 if the I-th element is part of the subset.
%    On input, T describes a subset.
%    On output, T describes the next subset in the ordering.
%
%    Input/output, integer RANK, the rank.
%    If RANK = -1 on input, then the routine understands that this is
%    the first call, and that the user wishes the routine to supply
%    the first element in the ordering, which has RANK = 0.
%    In general, the input value of RANK is increased by 1 for output,
%    unless the very last element of the ordering was input, in which
%    case the output value of RANK is -1.
%

%
%  Return the first element.
%
  if ( rank == -1 )
    t = zeros ( n, 1 );
    rank = 0;
    return
  end

  for i = n : -1 : 1

    if ( t(i) == 0 )
      t(i) = 1;
      rank = rank + 1;
      return
    else
      t(i) = 0;
    end

  end

  rank = -1;

  return
end
