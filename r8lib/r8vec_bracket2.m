function [ left, right ] = r8vec_bracket2 ( n, x, xval, start )

%*****************************************************************************80
%
%% R8VEC_BRACKET2 searches a sorted array for successive brackets of a value.
%
%  Discussion:
%
%    If the values in the vector are thought of as defining intervals
%    on the real line, then this routine searches for the interval
%    containing the given value.
%
%    This routine is a variation on R8VEC_BRACKET.  It seeks to reduce
%    the search time by allowing the user to suggest an interval that
%    probably contains the value.  The routine will look in that interval
%    and the intervals to the immediate left and right.  If this does
%    not locate the point, a binary search will be carried out on
%    appropriate subportion of the sorted array.
%
%    In the most common case, 1 <= LEFT < LEFT + 1 = RIGHT <= N,
%    and X(LEFT) <= XVAL <= X(RIGHT).
%
%    Special cases:
%      Value is less than all data values:
%    LEFT = -1, RIGHT = 1, and XVAL < X(RIGHT).
%      Value is greater than all data values:
%    LEFT = N, RIGHT = -1, and X(LEFT) < XVAL.
%      Value is equal to a data value:
%    LEFT = RIGHT, and X(LEFT) = X(RIGHT) = XVAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, length of the input array.
%
%    Input, real X(N), an array that has been sorted into 
%    ascending order.
%
%    Input, real XVAL, a value to be bracketed by entries of X.
%
%    Input, integer START, between 1 and N, specifies that XVAL
%    is likely to be in the interval:
%
%      [ X(START), X(START+1) ]
%
%    or, if not in that interval, then either
%
%      [ X(START+1), X(START+2) ]
%    or
%      [ X(START-1), X(START) ].
%
%    Output, integer LEFT, RIGHT, the results of the search.
%
%
%  Check.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_BRACKET2 - Fatal error!\n' );
    fprintf ( 1, '  N < 1.\n' );
    error ( 'R8VEC_BRACKET2 - Fatal error!' );
  end

  if ( start < 1 || n < start )
    start = floor ( ( n + 1 ) / 2 );
  end
%
%  XVAL = X(START)?
%
  if ( x(start) == xval )

    left = start;
    right = start;
    return
%
%  X(START) < XVAL?
%
  elseif ( x(start) < xval )
%
%  X(START) = X(N) < XVAL < Infinity?
%
    if ( n < start + 1 )

      left = start;
      right = -1;
      return
%
%  XVAL = X(START+1)?
%
    elseif ( xval == x(start+1) )

      left = start + 1;
      right = start + 1;
      return
%
%  X(START) < XVAL < X(START+1)?
%
    elseif ( xval < x(start+1) )

      left = start;
      right = start + 1;
      return
%
%  X(START+1) = X(N) < XVAL < Infinity?
%
    elseif ( n < start + 2 )

      left = start + 1;
      right = -1;
      return
%
%  XVAL = X(START+2)?
%
    elseif ( xval == x(start+2) )

      left = start + 2;
      right = start + 2;
      return
%
%  X(START+1) < XVAL < X(START+2)?
%
    elseif ( xval < x(start+2) )

      left = start + 1;
      right = start + 2;
      return
%
%  Binary search for XVAL in [ X(START+2), X(N) ],
%  where XVAL is guaranteed to be greater than X(START+2).
%
    else

      low = start + 2;
      high = n;
      [ left, right ] = r8vec_bracket ( high + 1 - low, x(low:n), xval );
      left = left + low - 1;
      right = right + low - 1;

    end
%
%  -Infinity < XVAL < X(START) = X(1).
%
  elseif ( start == 1 )

    left = -1;
    right = start;
    return
%
%  XVAL = X(START-1)?
%
  elseif ( xval == x(start-1) )

    left = start - 1;
    right = start - 1;
    return
%
%  X(START-1) < XVAL < X(START)?
%
  elseif ( x(start-1) <= xval )

    left = start - 1;
    right = start;
    return
%
%  Binary search for XVAL in [ X(1), X(START-1) ],
%  where XVAL is guaranteed to be less than X(START-1).
%
  else

    low = 1;
    high = start - 1;
    [ left, right ] = r8vec_bracket ( high + 1 - low, x(1:start-1), xval );

  end

  return
end
