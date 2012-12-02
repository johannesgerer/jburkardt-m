function [ t, rank ] = bal_seq_successor ( n, t, rank )

%*****************************************************************************80
%
%% BAL_SEQ_SUCCESSOR computes the lexical balanced sequence successor.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2011
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
%    Input, integer N, the number of 0's (and 1's) in the sequence.
%    N must be positive.
%
%    Input/output, integer T(2*N), on input, a balanced sequence,
%    and on output, its lexical successor.
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
    t(n+1:2*n) = 1;
    rank = 0;
    return;
  end
%
%  Check.
%
  ierror = bal_seq_check ( n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BAL_SEQ_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'BAL_SEQ_SUCCESSOR - Fatal error!' );
  end
%
%  After the I-th 0 there is a 'slot' with the capacity to
%  hold between 0 and I ones.
%
%  The first element of the sequence has all the 1's cowering
%  behind the N-th 0.
%
%  We seek to move a 1 to the left, and to do it lexically,
%  we will move a 1 to the rightmost slot that is under capacity.
%
%  Find the slot.
%
  slot = 0;
  slot_index = 0;
  slot_ones = 0;

  open = 0;
  open_index = 0;

  for i = 1 : 2 * n

    if ( t(i) == 0 )

      if ( 0 < slot )
        if ( slot_ones < slot )
          open = slot;
          open_index = slot_index;
        end
      end

      slot = slot + 1;
      slot_index = i;

%     slot_ones = 0;

    else
      slot_ones = slot_ones + 1;
    end

  end
%
%  If OPEN is not 0, then preserve the string up to the OPEN-th 0,
%  preserve the 1's that follow, but then write a 1, then
%  all the remaining 0's and all the remaining 1's.
%
  if ( open ~= 0 )

    j = open_index + 1;

    while ( t(j) == 1 )
      j = j + 1;
    end

    t(j) = 1;

    for i = open + 1 : n
      j = j + 1;
      t(j) = 0;
    end

    t(j+1:2*n) = 1;
%
%  If OPEN is 0, the last element was input.
%  Return the first one.
%
  else

    t(1:n) = 0;
    t(n+1:2*n) = 1;
    rank = 0;
    return

  end

  rank = rank + 1;

  return
end
