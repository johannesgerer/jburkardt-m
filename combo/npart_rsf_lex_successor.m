function [ a, rank ] = npart_rsf_lex_successor ( n, npart, a, rank )

%*****************************************************************************80
%
%% NPART_RSF_LEX_SUCCESSOR computes the RSF lex successor for NPART partitions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2011
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
%    Input, integer N, the integer to be partitioned.
%    N must be at least 1.
%
%    Input, integer NPART, the number of parts of the partition.
%    1 <= NPART <= N.
%
%    Input/output, integer A(NPART), contains the partition.
%    A(1) through A(NPART) contain the nonzero integers which
%    sum to N.
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

    if ( npart < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'NPART_RSF_LEX_SUCCESSOR - Fatal error!\n' );
      fprintf ( 1, '  NPART < 1.\n' );
      error ( 'NPART_RSF_LEX_SUCCESSOR - Fatal error!' );
    end

    a(1:npart-1) = 1;
    a(npart) = n - ( npart - 1 );

    rank = 0;
    return

  end
%
%  Check.
%
  ierror = part_rsf_check ( n, npart, a );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NPART_RSF_LEX_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'NPART_RSF_LEX_SUCCESSOR - Fatal error!' );
  end
%
%  Find the first index I for which A(NPART+1-I) + 1 < A(NPART).
%
  i = 2;

  while ( 1 )

    if ( npart < i )
      break
    end

    if ( a(npart+1-i) + 1 < a(npart) )
      break
    end

    i = i + 1;

  end
%
%  If no such index, we've reached the end of the line.
%
  if ( i == npart + 1 )

    a(1:npart-1) = 1;
    a(npart) = n - ( npart - 1 );

    rank = 0;
    return
%
%  Otherwise, increment A(NPART+1-I), and adjust other entries.
%
  else

    a(npart+1-i) = a(npart+1-i) + 1;
    d = - 1;

    for j = i - 1 : -1 : 2
      d = d + a(npart+1-j) - a(npart+1-i);
      a(npart+1-j) = a(npart+1-i);
    end

    a(npart) = a(npart) + d;

  end

  rank = rank + 1;

  return
end
