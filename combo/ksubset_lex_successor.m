function [ t, rank ] = ksubset_lex_successor ( k, n, t, rank )

%*****************************************************************************80
%
%% KSUBSET_LEX_SUCCESSOR computes the K subset lexicographic successor.
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
%    have. 1 <= K <= N.
%
%    Input, integer N, the number of elements in the master set.
%    N must be positive.
%
%    Input/output, integer T(K), describes a K subset.  T(I) is
%    the I-th element.  The elements must be listed in ascending order.
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
    t = i4vec_indicator ( k );
    rank = 0;
    return
  end
%
%  Check.
%
  ierror = ksubset_lex_check ( k, n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUBSET_LEX_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'KSUBSET_LEX_SUCCESSOR - Fatal error!' );
  end

  isave = 0;

  for i = k : -1 : 1
    if ( t(i) ~= n - k + i )
      isave = i;
      break
    end
  end
%
%  The last K subset was input.
%  Return the first one.
%
  if ( isave == 0 )
    t = i4vec_indicator ( k );
    rank = 0;
  else

    for j = k : -1 : isave
      t(j) = t(isave) + 1 + j - isave;
    end

    rank = rank + 1;

  end

  return
end
