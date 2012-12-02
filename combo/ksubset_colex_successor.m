function [ t, rank ] = ksubset_colex_successor ( k, n, t, rank )

%*****************************************************************************80
%
%% KSUBSET_COLEX_SUCCESSOR computes the K subset colex successor.
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
%    24 January 2011
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
%    Input, integer K, the number of elements each K subset must
%    have.  1 <= K <= N.
%
%    Input, integer N, the number of elements in the master set.
%    N must be positive.
%
%    Input/output, integer T(K), describes a K subset.  T(I) is the
%    I-th element.  The elements must be listed in DESCENDING order.
%    On input, T describes a K subset.
%    On output, T describes the next K subset in the ordering.
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
    for i = 1 : k
      t(i) = k + 1 - i;
    end
    rank = 0;
    return
  end
%
%  Check.
%
  ierror = ksubset_colex_check ( k, n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUBSET_COLEX_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'KSUBSET_COLEX_SUCCESSOR - Fatal error!' );
  end

  for i = k - 1 : -1 : 1
    if ( t(k+1-i) + 1 < t(k-i) )
      t(k+1-i) = t(k+1-i) + 1;
      rank = rank + 1;
      return
    end
  end

  if ( t(1) < n )
    t(1) = t(1) + 1;
    for i = 1 : k - 1
      t(k+1-i) = i;
    end
    rank = rank + 1;
    return
  end
%
%  The last K subset was input.
%  Return the first one.
%
  for i = 1 : k
    t(i) = k + 1 - i;
  end

  rank = 0;

  return
end
