function [ array_out, in, out ] = ksub_next2 ( n, k, array )

%*****************************************************************************80
%
%% KSUB_NEXT2 computes the next K subset of an N set.
%
%  Discussion:
%
%    This routine uses the revolving door method.  It has no "memory".
%    It simply calculates the successor of the input set,
%    and will start from the beginning after the last set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    25 May 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
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
%    Input, integer ARRAY(K).  On input, the user must
%    supply a subset of size K in ARRAY.  That is, ARRAY must
%    contain K unique numbers, in order, between 1 and N.  On
%    output, ARRAY(I) is the I-th element of the output subset.
%    The output array is also in sorted order.
%
%    Output, integer ARRAY_OUT(K), contains, in ascending order, 
%    the elements of the next K subset.
%
%    Output, integer IN, the element of the output subset which
%    was not in the input set.  Each new subset differs from the
%    last one by adding one element and deleting another.
%
%    Output, integer OUT, the element of the input subset which
%    is not in the output subset.
%
  array_out(1:k) = array(1:k);

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
        array_out(k) = k;
        in = k;
        out = n;
        return;
      end

      if ( array_out(j) ~= j )

        out = array_out(j);
        in = out - 1;
        array_out(j) = in;

        if ( j ~= 1 )
          in = j - 1;
          array_out(j-1) = in;
        end

        return

      end

    end

    j = j + 1;
    m = n;

    if ( j < k )
      m = array_out(j+1) - 1;
    end

    if ( m ~= array_out(j) );
      break
    end

  end

  in = array_out(j) + 1;
  array_out(j) = in;
  out = in - 1;

  if ( j ~= 1 )
    array_out(j-1) = out;
    out = j - 1;
  end

  return
end
