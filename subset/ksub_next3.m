function [ a, more, in, iout ] = ksub_next3 ( n, k, a, more )

%*****************************************************************************80
%
%% KSUB_NEXT3 generates the subsets of size K from a set of size N, one at a time.
%
%  Discussion:
%
%    The routine uses the revolving door method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2005
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the size of the set from which subsets are drawn.
%    N must be positive.
%
%    Input, integer K, the size of the desired subsets.  K must be
%    between 0 and N.
%
%    Input, integer A(K).  A(I) is the I-th element of the
%    output subset.  The elements of A are sorted.
%
%    Input, logical MORE.  On first call, set MORE = FALSE
%    to signal the beginning.  MORE will be set to TRUE, and on
%    each call, the routine will return another K-subset.
%    Finally, when the last subset has been returned,
%    MORE will be set FALSE and you may stop calling.
%
%    Output, integer A(K).  A(I) is the I-th element of the
%    output subset.  The elements of A are sorted.
%
%    Output, logical MORE.  On first call, set MORE = FALSE
%    to signal the beginning.  MORE will be set to TRUE, and on
%    each call, the routine will return another K-subset.
%    Finally, when the last subset has been returned,
%    MORE will be set FALSE and you may stop calling.
%
%    Output, integer IN, the element of the output subset which
%    was not in the input set.  Each new subset differs from the
%    last one by adding one element and deleting another.  IN is not
%    defined the first time that the routine returns, and is
%    set to zero.
%
%    Output, integer IOUT, the element of the input subset which is
%    not in the output subset.  IOUT is not defined the first time
%    the routine returns, and is set to zero.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_NEXT3 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  but 0 < N is required!\n' );
    error ( 'KSUB_NEXT3 - Fatal error!' );
  end

  if ( k < 0 | n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_NEXT3 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '  but 0 <= K <= N is required!\n' );
    error ( 'KSUB_NEXT3 - Fatal error!' );
  end

  if ( ~more )
    in = 0;
    iout = 0;
    a(1:k) = i4vec_indicator ( k );
    more = ( k ~= n );
    return
  end

  j = 0;

  while ( 1 )

    if ( 0 < j | mod ( k, 2 ) == 0 )

      j = j + 1;

      if ( a(j) ~= j )

        iout = a(j);
        in = iout - 1;
        a(j) = in;

        if ( j ~= 1 )
          in = j - 1;
          a(j-1) = in;
        end

        if ( k ~= 1 )
          more = ( a(k-1) == k-1 );
        end

        more = ( ~more ) | ( a(k) ~= n );

        return

      end

    end

    j = j + 1;
    m = n;

    if ( j < k )
      m = a(j+1) - 1;
    end

    if ( m ~= a(j) )
      break
    end

  end

  in = a(j) + 1;
  a(j) = in;
  iout = in - 1;

  if ( j ~= 1 )
    a(j-1) = iout;
    iout = j - 1;
  end

  if ( k ~= 1 )
    more = ( a(k-1) == k-1 );
  end

  more = ( ~more ) | ( a(k) ~= n );

  return
end
