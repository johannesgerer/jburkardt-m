function [ npart, a, rank ] = partn_successor ( n, nmax, npart, a, rank )

%*****************************************************************************80
%
%% PARTN_SUCCESSOR computes partitions whose largest part is NMAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2011
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
%    Input, integer NMAX, the maximum size of any part of the
%    partition.  1 <= NMAX <= N.
%
%    Input/output, integer NPART, the number of parts of the
%    partition.  1 <= NPART <= N.
%
%    Input/output, integer A(N), contains the partition.
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
    a(1) = nmax;
    npart = n + 1 - nmax;
    a(2:npart) = 1;
    rank = 0;
    return
  end
%
%  Check.
%
  ierror = partn_sf_check ( n, nmax, npart, a );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PARTN_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'PARTN_SUCCESSOR - Fatal error!' );
  end
%
%  If there are at least two parts, and the next to last is not NMAX,
%  then rob the last part and pay the next to the last part.
%  Then, if the next to last part is too big, swap it leftwards.
%
  if ( 1 < npart )

    if ( a(npart-1) < nmax )

      a(npart) = a(npart) - 1;
      a(npart-1) = a(npart-1) + 1;
      index = npart - 1;

      while ( 1 )

        if ( index <= 1 )
          break
        end

        if ( a(index) <= a(index-1) )
          break
        end

        temp       = a(index-1);
        a(index-1) = a(index);
        a(index)   = temp;

        index = index - 1;

      end
%
%  Sum the tail.
%
      temp = sum ( a(index+1:npart) );
%
%  Spread the sum as 1's.
%
      npart = index + temp;
      a(index+1:npart) = 1;
      rank = rank + 1;
      return

    end
%
%  Otherwise, we've reached the last item.
%  Return the first one.
%
  else

    npart = n + 1 - nmax;
    a(1) = nmax;
    a(2:npart) = 1;
    rank = 0;
    return

  end

  return
end
