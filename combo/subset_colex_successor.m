function [ t, rank ] = subset_colex_successor ( n, t, rank )

%*****************************************************************************80
%
%% SUBSET_COLEX_SUCCESSOR computes the subset colexicographic successor.
%
%  Discussion:
%
%    In the original code, there is a last element with no successor.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2011
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
%    If the input T was the last in the ordering, then the output T
%    will be the first.
%
%    Input/output, integer RANK, the rank.
%    If RANK = -1 on input, then the routine understands that this is
%    the first call, and that the user wishes the routine to supply
%    the first element in the ordering, which has RANK = 0.
%    In general, the input value of RANK is increased by 1 for output,
%    unless the very last element of the ordering was input, in which
%    case the output value of RANK is 0.
%

%
%  Return the first element.
%
  if ( rank == -1 )
    t(1:n) = 0;
    rank = 0;
    return
  end
%
%  Check.
%
  subset_check ( n, t );

  for i = 1 : n

    if ( t(i) == 0 )
      t(i) = 1;
      rank = rank + 1;
      return
    else
      t(i) = 0;
    end

  end

  rank = 0;

  return
end
