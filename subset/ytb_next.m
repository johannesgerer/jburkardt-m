function [ lambda, a, more ] = ytb_next ( n, lambda, a, more )

%*****************************************************************************80
%
%% YTB_NEXT computes the next Young tableau for a given shape.
%
%  Discussion:
%
%    When the routine is called with MORE = FALSE (the first time), and
%    if LAMBDA on this call has M parts, with M < N, then the user
%    must also make sure that LAMBDA(M+1) = 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2004
%
%  Author:
%
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
%    Input, integer N, the integer which is to be partitioned.
%
%    Input, integer LAMBDA(N), contains a partition of N.
%    The elements of LAMBDA are nonnegative integers that sum to N.
%    On the first call, with MORE = FALSE, the user sets LAMBDA.
%    After the first call, the input value of LAMBDA is not important.
%
%    Input, integer A(N).  On the first call, with MORE = FALSE,
%    no value of A needs to be set.  After the first call, the input
%    value of A should be the output value of A from the previous call.
%
%    Input, logical MORE.  Set MORE to FALSE before the first call.
%    Thereafter, set it to the output value of MORE on the previous call.
%
%    Output, integer LAMBDA(N), contains the partition of N,
%    corresponding to the Young tableau.
%
%    Output, integer A(N), the next Young tableau.  A(I) is the
%    row containing I in the output tableau.
%
%    Output, logical MORE, is TRUE until the last tableau is returned,
%    when the value of MORE is FALSE.
%
  it = n;

  if ( more )

    lambda(1) = 1;
    lambda(2:n) = 0;

    isave = 0;

    for i = 2 : n

      lambda(a(i)) = lambda(a(i)) + 1;

      if ( a(i) < a(i-1) )
        isave = i;
        break;
      end

    end

    if ( isave == 0 )
      more = 0;
      return
    end

    it = lambda(1+a(isave));

    for i = n : -1 : 1

      if ( lambda(i) == it )
        a(isave) = i;
        lambda(i) = lambda(i) - 1;
        it = isave - 1;
        break;
      end

    end

  end

  k = 1;
  ir = 1;

  while ( 1 )

    if ( n < ir )
      break;
    end

    if ( lambda(ir) ~= 0 )
      a(k) = ir;
      lambda(ir) = lambda(ir) - 1;
      k = k + 1;
      ir = ir + 1;
      continue;
    end

    if ( it < k )
      break;
    end

    ir = 1;

  end

  if ( n == 1 )
    more = 0;
    return
  end

  for j = 2 : n
    if ( a(j) < a(j-1) )
      more = 1;
      return
    end
  end

  more = 0;

  return
end
