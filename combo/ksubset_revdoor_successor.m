function [ t, rank ] = ksubset_revdoor_successor ( k, n, t, rank )

%*****************************************************************************80
%
%% KSUBSET_REVDOOR_SUCCESSOR computes the K subset revolving door successor.
%
%  Discussion:
%
%    After numerous attempts to implement the algorithm published in
%    Kreher and Stinson, the Nijenhuis and Wilf version was implemented
%    instead.  The K and S algorithm is supposedly based on the N and W one.
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
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Second Edition,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
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
%    I-th element.  The elements must be listed in ascending order.
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
  if ( rank == - 1 )
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
    fprintf ( 1, 'KSUBSET_REVDOOR_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'KSUBSET_RECDOOR_SUCCESSOR - Fatal error!' );
  end

  j = 0;

  while ( 1 )

    if ( 0 < j || mod ( k, 2 ) == 0 )

      j = j + 1;

      if ( k < j )
        t(k) = k;
        rank = 0;
        return
      end

      if ( t(j) ~= j )

        t(j) = t(j) - 1;

        if ( j ~= 1 )
          t(j-1) = j - 1;
        end

        rank = rank + 1;
        return

      end

    end

    j = j + 1;

    if ( j < k )
      if ( t(j) ~= t(j+1) - 1 )
        break
      end
    else
      if ( t(j) ~= n )
        break
      end
    end

  end

  t(j) = t(j) + 1;

  if ( j ~= 1 )
    t(j-1) = t(j) - 1;
  end

  rank = rank + 1;

  return
end
