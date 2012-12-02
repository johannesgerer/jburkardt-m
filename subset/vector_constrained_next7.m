function [ x, more ] = vector_constrained_next7 ( n, level_weight, x_max, ...
  x, q_min, q_max, more )

%*****************************************************************************80
%
%% VECTOR_CONSTRAINED_NEXT7 returns the "next" constrained vector.
%
%  Discussion:
%
%    We consider vectors X of dimension N satisfying:
%
%      0 <= X(1:N) <= X_MAX(1:N).
%
%    and the following constraint:
%
%      Q_MIN < sum ( 1 <= I <= N ) LEVEL_WEIGHT(I) * X(I) <= Q_MAX
%
%    This routine returns, one at a time, and in right-to-left
%    lexicographic order, exactly those vectors which satisfy
%    the constraint.
%
%  Example:
%
%    N = 3
%    LEVEL_WEIGHT    4.0  3.0  5.0
%    Q_MIN   16.0
%    Q_MAX   20.0
%    X_MAX:   5   6   4
%
%    #  X(1)  X(2)  X(3)     Total
%
%    1    3     1     1       20.0
%    2    2     2     1       19.0
%    3    1     3     1       18.0
%    4    1     1     2       17.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components in the vector.
%
%    Input, real LEVEL_WEIGHT(N), the coefficient vector.
%
%    Input, integer X_MAX(N), the maximum
%    values allowed in each component.
%
%    Input, integer X(N).  On first call, with
%    MORE = FALSE, the input value of X is not important.  On subsequent calls,
%    the input value of X should be the output value from the previous call.
%
%    Input, real Q_MIN, Q_MAX, the lower and upper
%    limits on the sum.
%
%    Input, logical MORE.  If the user has set MORE
%    FALSE, the user is requesting the initiation of a new sequence
%    of values.  If MORE is TRUE, then the user is requesting "more"
%    values in the current sequence.  
%
%    Output, integer X(N), (with MORE = TRUE), the value of X will be 
%    the "next" vector in the reverse lexicographical list of vectors 
%    that satisfy the condition.  However, on output with MORE = FALSE, 
%    the vector X is meaningless, because there are no more vectors 
%    in the list.
%
%    Output, logical MORE is TRUE if the next value of X was found, and
%    FALSE if there were no more values of X to compute.  
%
  if ( ~more )

    more = 1;

    x(1:n,1) = 0;

    total = level_weight(1:n)' * x(1:n);

    if ( q_min < total && total <= q_max )
      return
    end

  end

  while ( 1 )

    i = n;

    while ( 1 )

      if ( x(i) < x_max(i) )
        break
      end

      if ( i <= 1 )
        more = 0;
        return
      end

      i = i - 1;

    end

    x(i) = x(i) + 1;
    x(i+1:n) = 0;

    total = level_weight(1:n)' * x(1:n);

    if ( q_min < total && total <= q_max )
      break
    end

  end

  return
end
