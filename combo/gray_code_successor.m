function [ t, rank ] = gray_code_successor ( n, t, rank )

%*****************************************************************************80
%
%% GRAY_CODE_SUCCESSOR computes the binary reflected Gray code successor.
%
%  Example:
%
%    000, 001, 011, 010, 110, 111, 101, 100,
%    after which the sequence repeats.
%
%  Discussion:
%
%    In the original code, the successor of the element that has an
%    initial 1 followed by N-1 zeroes is undefined.  In this version,
%    the successor is the element with N zeroes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
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
%    Input, integer N, the number of digits in each element.
%    N must be positive.
%
%    Input/output, integer T(N).
%    On input, T contains an element of the Gray code, that is,
%    each entry T(I) is either 0 or 1.
%    On output, T contains the successor to the input value; this
%    is an element of the Gray code, which differs from the input
%    value in a single position.
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
  ierror = gray_code_check ( n, t );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRAY_CODE_SUCCESSOR - Fatal error!\n' );
    fprintf ( 1, '  The input array is illegal.\n' );
    fprintf ( 1, '  IERROR = %d\n', ierror );
    error ( 'GRAY_CODE_SUCCESSOR - Fatal error!' );
  end

  weight = sum ( t(1:n) );

  if ( mod ( weight, 2 ) == 0 )

    if ( t(n) == 0 )
      t(n) = 1;
    else
      t(n) = 0;
    end

    rank = rank + 1;
    return

  else

    for i = n : -1 : 2
      if ( t(i) == 1 )
        if ( t(i-1) == 0 )
          t(i-1) = 1;
        else
          t(i-1) = 0;
        end
        rank = rank + 1;
        return
      end
    end
%
%  The final element was input.
%  Return the first element.
%
    t(1:n) = 0;
    rank = 0;

  end

  return
end
