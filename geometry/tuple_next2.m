function [ rank_new, x_new ] = tuple_next2 ( n, xmin, xmax, rank, x )

%*****************************************************************************80
%
%% TUPLE_NEXT2 computes the next element of an integer tuple space.
%
%  Discussion:
%
%    The elements X are N vectors.
%
%    Each entry X(I) is constrained to lie between XMIN(I) and XMAX(I).
%
%    The elements are produced one at a time.
%
%    The first element is
%      (XMIN(1), XMIN(2), ..., XMIN(N)),
%    the second is (probably)
%      (XMIN(1), XMIN(2), ..., XMIN(N)+1),
%    and the last element is
%      (XMAX(1), XMAX(2), ..., XMAX(N))
%
%    Intermediate elements are produced in a lexicographic order, with
%    the first index more important than the last, and the ordering of
%    values at a fixed index implicitly defined by the sign of
%    XMAX(I) - XMIN(I).
%
%  Example:
%
%    N = 2,
%    XMIN = (/ 1, 10 /)
%    XMAX = (/ 3,  8 /)
%
%    RANK    X
%    ----  -----
%      1   1 10
%      2   1  9
%      3   1  8
%      4   2 10
%      5   2  9
%      6   2  8
%      7   3 10
%      8   3  9
%      9   3  8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components.
%
%    Input, integer XMIN(N), XMAX(N), the "minimum" and "maximum" entry values.
%    These values are minimum and maximum only in the sense of the lexicographic
%    ordering.  In fact, XMIN(I) may be less than, equal to, or greater
%    than XMAX(I).
%
%    Input, integer RANK, is set to 0 on the first call.  Thereafter, RANK
%    should be the value output by RANK_NEW on the previous call.
%
%    Input, integer X(N), except on the first call, X should contain
%    the value output in X_NEW on the previous call.
%
%    Output, integer RANK_NEW, the rank of the output item.  
%    If RANK is zero, there are no more items in the sequence.
%
%    Output, integer X_NEW(N), the next tuple.
%
  rank_new = rank;
  x_new(1:n) = x(1:n);

  if ( rank_new < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TUPLE_NEXT2 - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RANK = %d\n', rank_new );
    error ( 'TUPLE_NEXT2 - Fatal error!' );
  end

  if ( product ( 1 + abs ( xmax(1:n) - xmin(1:n) ) ) < rank_new )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TUPLE_NEXT2 - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RANK = %d\n', rank_new );
    error ( 'TUPLE_NEXT2 - Fatal error!' );
  end

  if ( rank_new == 0 )
    x_new(1:n) = xmin(1:n);
    rank_new = 1;
    return
  end

  rank_new = rank_new + 1;
  i = n;

  while ( 1 )

    if ( x_new(i) ~= xmax(i) )
      x_new(i) = x_new(i) + i4_sign ( xmax(i) - xmin(i) );
      break;
    end

    x_new(i) = xmin(i)

    if ( i == 1 )
      rank_new = 0;
      break;
    end

    i = i - 1;

  end

  return
end
