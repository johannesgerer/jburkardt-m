function [ a, rank ] = npart_sf_lex_successor ( n, npart, a, rank )

%*****************************************************************************80
%
%% NPART_SF_LEX_SUCCESSOR computes SF NPART partition.
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
%    N must be positive.
%
%    Input, integer NPART, the number of parts of the partition.
%    1 <= NPART <= N.
%
%    Input/output, integer A(NPART), contains the partition.
%    A(1) through A(NPART) contain the nonzero integers which
%    sum to N.  The values in A must be in DESCENDING order.
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
    a = i4vec_part2 ( n, npart );
    rank = 0;
    return
  end
%
%  Check.
%
  ierror = part_sf_check ( n, npart, a );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NPART_SF_LEX_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'NPART_SF_LEX_SUCCESSOR - Fatal error!' );
  end
%
%  Find the last entry that is 2 or more.
%
  for i = npart : -1 : 1
    if ( 1 < a(i) )
      indx = i;
      break
    end
  end
%
%  As long as the last nonunit occurs after the first position,
%  have it donate 1 to the left.
%
  if ( 1 < indx )

    a(indx) = a(indx) - 1;
    a(indx-1) = a(indx-1) + 1;
    indx = indx - 1;

    while ( 1 )

      if ( indx <= 1 )
        break
      end

      if ( a(indx) <= a(indx-1) )
        break
      end

      temp      = a(indx);
      a(indx)   = a(indx-1);
      a(indx-1) = temp;

      indx = indx - 1;

    end
%
%  Sum the tail.
%
    temp = sum ( a(indx+1:npart) );
%
%  Partition the tail sum equally over the tail.
%
    a(indx+1:npart) = i4vec_part2 ( temp, npart - indx );

    rank = rank + 1;
%
%  If A(2) through A(NPART) are 1, then this is the last element.
%  Return the first one.
%
  else

    a = i4vec_part2 ( n, npart );
    rank = 0;

  end

  return
end
