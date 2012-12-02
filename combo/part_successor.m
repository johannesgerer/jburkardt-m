function [ npart, a, rank ] = part_successor ( n, npart, a, rank )

%*****************************************************************************80
%
%% PART_SUCCESSOR computes the lexicographic partition successor.
%
%  Discussion:
%
%    PART_SUCCESSOR is "inspired by" the GenPartitions algorithm,
%    but instead of relying on recursion, generates the partitions
%    one at a time.
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
    a(1:n) = 1;
    npart = n;
    rank = 0;
    return
  end
%
%  Check.
%
  ierror = part_sf_check ( n, npart, a );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PART_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    error ( 'PART_SUCCESSOR - Fatal error!' );
  end
%
%  If possible, increment the first intermediate position that
%  is less than its left hand neighbor, and has at least one
%  right hand neighbor.
%
  ihi = npart - 1;

  for i = ihi : -1 : 2

    if ( a(i) < a(i-1) )
      asum = sum ( a(i+1:npart) ) - 1;
      a(i) = a(i) + 1;
      a(i+1:npart) = 0;
      npart = i + asum;
      a(i+1:npart) = 1;
      rank = rank + 1;
      return
    end

  end
%
%  A) there are two or more parts
%  Increment the first, replace the rest by 1's.
%
  if ( 2 <= npart )
    a(1) = a(1) + 1;
    a(2:npart) = 0;
    npart = n - a(1) + 1;
    a(2:npart) = 1;
    rank = rank + 1;
%
%  B) there is only one part.
%  We've reached the last item.
%  Return the first one.
%
  elseif ( npart == 1 )
    a(1:n) = 1;
    npart = n;
    rank = 0;
  end

  return
end
