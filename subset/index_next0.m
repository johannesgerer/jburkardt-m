function [ a, more ] = index_next0 ( n, hi, a, more )

%*****************************************************************************80
%
%% INDEX_NEXT0 generates all index vectors within given upper limits.
%
%  Discussion:
%
%    The index vectors are generated in such a way that the reversed
%    sequences are produced in lexicographic order.
%
%  Example:
%
%    N = 3,
%    HI = 3
%
%    1   2   3
%    ---------
%    1   1   1
%    2   1   1
%    3   1   1
%    1   2   1
%    2   2   1
%    3   2   1
%    1   3   1
%    2   3   1
%    3   3   1
%    1   1   2
%    2   1   2
%    3   1   2
%    1   2   2
%    2   2   2
%    3   2   2
%    1   3   2
%    2   3   2
%    3   3   2
%    1   1   3
%    2   1   3
%    3   1   3
%    1   2   3
%    2   2   3
%    3   2   3
%    1   3   3
%    2   3   3
%    3   3   3
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
%    Input, integer HI, the upper limit for the array indices.
%    The lower limit is implicitly 1 and HI must be at least 1.
%
%    Input, integer A(N), contains the output value of A from
%    the previous call.  On a startup call, with MORE = FALSE,
%    the input value of A doesn't matter.
%
%    Input, logical MORE.  Set this variable FALSE before
%    the first call.  Normally, MORE will be returned TRUE but
%    once all the vectors have been generated, MORE will be
%    reset to FALSE and you should stop calling the program.
%
%    Output, integer A(N), the next index set.
%
%    Output, logical MORE, is normally TRUE on output, but
%    once all the vectors have been generated, MORE will be
%    reset to FALSE and you should stop calling the program.
%
  if ( ~more )

    a(1:n) = 1;

    if ( hi < 1 )
      more = 0;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'INDEX_NEXT0 - Fatal error!\n' );
      fprintf ( 1, '  HI is %d\n', hi );
      fprintf ( 1, '  but HI must be at least 1.\n' );
      return
    end

  else

    inc = 1;

    while ( hi <= a(inc) )
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
    if ( a(i) < hi )
      more = 1;
    end
  end

  return
end
