function [ a, in, out ] = ksub_next2 ( n, k, a )

%*****************************************************************************80
%
%% KSUB_NEXT2 generates the subsets of size K from a set of size N, one at a time.
%
%  Discussion:
%
%    This routine uses the revolving door method.  It has no "memory".
%    As far as this routine is concerned, the subsets of size K are
%    arranged in a ring that "wraps around".  There is no last subset,
%    and so the routine can be started anywhere, and called indefinitely.
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
%    Input, integer K, the size of the desired subset.  K must be
%    between 0 and N.
%
%    Input, integer A(K), a subset of size K.  A must contain K unique 
%    numbers, in order, between 1 and N.  
%
%    Output, integer A(K), the "next" subset of size K.  
%
%    Output, integer IN, the element of the output subset which
%    was not in the input set.  Each new subset differs from the
%    last one by adding one element and deleting another.
%
%    Output, integer OUT, the element of the input subset which
%    is not in the output subset.
%  
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_NEXT2 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  but 0 < N is required!\n' );
    error ( 'KSUB_NEXT2 - Fatal error!' );
  end

  if ( k < 0 | n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_NEXT2 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '  but 0 <= K <= N is required!\n' );
    error ( 'KSUB_NEXT2 - Fatal error!' );
  end

  j = 0;

  while ( 1 )

    if ( 0 < j | mod ( k, 2 ) == 0 )

      j = j + 1;

      if ( k < j )
        a(k) = k;
        in = k;
        out = n;
        return
      end

      if ( a(j) ~= j )

        out = a(j);
        in = out - 1;
        a(j) = in;

        if ( j ~= 1 )
          in = j - 1;
          a(j-1) = in;
        end

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
  out = in - 1;

  if ( j ~= 1 )
    a(j-1) = out;
    out = j - 1;
  end

  return
end
