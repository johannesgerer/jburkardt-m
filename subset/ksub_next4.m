function [ a, done ] = ksub_next4 ( n, k, a, done )

%*****************************************************************************80
%
%% KSUB_NEXT4 generates the subsets of size K from a set of size N, one at a time.
%
%  Discussion:
%
%    The subsets are generated one at a time.
%
%    The routine should be used by setting DONE to TRUE, and then calling
%    repeatedly.  Each call returns with DONE equal to FALSE, the array
%    A contains information defining a new subset.  When DONE returns
%    equal to TRUE, there are no more subsets.
%
%    There are ( N*(N-1)*...*(N+K-1)) / ( K*(K-1)*...*2*1) such subsets.
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
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the size of the entire set.
%
%    Input, integer K, the size of the desired subset.  K must be
%    between 0 and N.
%
%    Input, integer A(K), is not needed on the first call, with DONE = TRUE.
%    On subsequent calls, it should be the output value of A from the
%    previous call.
%
%    Input, logical DONE, should be TRUE on the first call, to force initialization,
%    and then FALSE on subsequent calls.
%
%    Output, integer A(K), as long as DONE is returned FALSE, A 
%    is the next K subset.
%
%    Output, logical DONE, is TRUE if the routine is returning the
%    next K subset, and FALSE if there are no more subsets to return.
%  
  if ( k < 0 | n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_NEXT4 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '  but 0 <= K <= N is required!\n' );
    error ( 'KSUB_NEXT4 - Fatal error!' );
  end
%
%  First call:
%
  if ( done )

    a(1:k) = i4vec_indicator ( k );

    if ( 0 < n )
      done = 0;
    else
      done = 1;
    end
%
%  Next call.
%
  else

    if ( a(1) < n-k+1 )

      done = 0;

      jsave = k;

      for j = 1 : k-1

        if ( a(j) + 1 < a(j+1) )
          jsave = j;
          break
        end

      end

      a(1:jsave-1) = i4vec_indicator ( jsave-1 );
      a(jsave) = a(jsave) + 1;

    else

      done = 1;

    end

  end

  return
end
