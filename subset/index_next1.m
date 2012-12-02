function [ a, more ] = index_next1 ( n, hi, a, more )

%*****************************************************************************80
%
%% INDEX_NEXT1 generates all index vectors within given upper limits.
%
%  Discussion:
%
%    The index vectors are generated in such a way that the reversed
%    sequences are produced in lexicographic order.
%
%  Example:
%
%    N = 3,
%    HI(1) = 4, HI(2) = 2, HI(3) = 3
%
%    1   2   3
%    ---------
%    1   1   1
%    2   1   1
%    3   1   1
%    4   1   1
%    1   2   1
%    2   2   1
%    3   2   1
%    4   2   1
%    1   1   2
%    2   1   2
%    3   1   2
%    4   1   2
%    1   2   2
%    2   2   2
%    3   2   2
%    4   2   2
%    1   1   3
%    2   1   3
%    3   1   3
%    4   1   3
%    1   2   3
%    2   2   3
%    3   2   3
%    4   2   3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, integer HI(N), the upper limits for the array indices.
%    The lower limit is implicitly 1, and each HI(I) should be at least 1.
%
%    Input, integer A(N), the output value of A on the previous call.
%    On startup calls with MORE = FALSE, the input value of A doesn't matter.
%
%    Input, logical MORE, is set to the output value of MORE on the
%    previous call, or to FALSE on a startup call.
%
%    Output, integer A(N), the next index vector.
%
%    Output, logical MORE, is normally TRUE, but will be FALSE once there
%    are no more index vectors to generate.
%
  if ( ~more )

    a(1:n) = 1;

    for i = 1 : n
      if ( hi(i) < 1 )
        more = 0;
        fprintf ( 1, '\n' );
        fprintf ( 1,  'INDEX_NEXT1 - Fatal error!\n' );
        fprintf ( 1,  '  Entry %d of HI is %d\n', i, hi(i) );
        fprintf ( 1,  '  but all entries must be at least 1.\n' );
        return
      end
    end

  else

    inc = 1;

    while ( hi(inc) <= a(inc) )
      a(inc) = 1;
      inc = inc + 1;
    end

    a(inc) = a(inc) + 1;

  end
%
%  See if there are more entries to compute.
%
  more = 0;

  for i = 1 : n
    if ( a(i) < hi(i) )
      more = 1;
    end
  end

  return
end
