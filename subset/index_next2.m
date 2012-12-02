function [ a, more ] = index_next2 ( n, lo, hi, a, more )

%*****************************************************************************80
%
%% INDEX_NEXT2 generates all index vectors within given lower and upper limits.
%
%  Example:
%
%    N = 3,
%    LO(1) = 1, LO(2) = 10, LO(3) = 4
%    HI(1) = 2, HI(2) = 11, HI(3) = 6
%
%    1   2   3
%    ---------
%    1  10   4
%    2  10   4
%    1  11   4
%    2  11   4
%    1  10   5
%    2  10   5
%    1  11   5
%    2  11   5
%    1  10   6
%    2  10   6
%    1  11   6
%    2  11   6
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
%    Input, integer N, the number of entries in A.  The rank of
%    the object being indexed.
%
%    Input, integer LO(N), HI(N), the lower and upper limits for the array
%    indices.  LO(I) should be less than or equal to HI(I), for each I.
%
%    Input, integer A(N), the output value of A from the previous call.
%    This value is not needed on startup calls with MORE = FALSE.
%
%    Input, logical MORE, the output value of MORE from the previous call,
%    or set to FALSE if this is a startup call.
%
%    Output, integer A(N), the successor set of indices to the input
%    value.
%
%    Output, logical MORE, will normally be returned TRUE but
%    once all the vectors have been generated, it will be
%    reset FALSE and you should stop calling the program.
%
  if ( ~more )

    a(1:n) = lo(1:n);

    for i = 1 : n
      if ( hi(i) < lo(i) )
        more = 0;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'INDEX_NEXT2 - Fatal error!\n' );
        fprintf ( 1,  '  Entry %d of HI is %d\n', i, hi(i) );
        fprintf ( 1,  '  Entry %d of LO is %d\n', i, lo(i) );
        fprintf ( 1,  '  but LO(I) <= HI(I) is required.\n' );
        error ( 'INDEX_NEXT2 - Fatal error!' );
      end
    end

  else

    a(1:n) = a(1:n);

    inc = 1;

    while ( hi(inc) <= a(inc) )
      a(inc) = lo(inc);
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
