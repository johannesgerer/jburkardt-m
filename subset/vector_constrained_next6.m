function [ x, more ] = vector_constrained_next6 ( n, alpha, x_min, x_max, ...
  x, q_min, q_max, more )

%*****************************************************************************80
%
%% VECTOR_CONSTRAINED_NEXT6 returns the "next" constrained vector.
%
%  Discussion:
%
%    This routine is similar to VECTOR_CONSTRAINED_NEXT2,
%    VECTOR_CONSTRAINED_NEXT3, and VECTOR_CONSTRAINED_NEXT4.
%
%    We consider all vectors X of dimension N whose components
%    satisfy X_MIN(1:N) <= X(1:N) <= X_MAX(1:N).
%
%    We are only interested in the subset of these vectors which
%    satisfy the following constraint:
%
%      Q_MIN <= sum ( 1 <= I <= N ) ALPHA(I) * X(I) <= Q_MAX
%
%    This routine returns, one at a time, and in right-to-left
%    lexicographic order, exactly those vectors which satisfy
%    the constraint.
%
%  Example:
%
%    N = 3
%    ALPHA    4.0  3.0  5.0
%    Q_MIN   16.0
%    Q_MAX   20.0
%    X_MIN:   1   1   1
%    X_MAX:   5   6   4
%
%    #  X(1)  X(2)  X(3)     Total
%
%    1    2     1     1       20.0
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
%    08 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components in the vector.
%
%    Input, real ALPHA(N), the coefficient vector.
%
%    Input, integer X_MIN(N), X_MAX(N), the minimum and maximum
%    values allowed in each component.
%
%    Input, integer X(N), the output value of X from the previous call.
%    On first call, the user must set X = [];
%
%    Input, real Q_MIN, Q_MAX, the lower and upper
%    limits on the sum.
%
%    Input, logical MORE, should be FALSE on the first call, and
%    TRUE thereafter.
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

    x(1:n) = x_min(1:n);

    total = alpha(1:n) * x(1:n)';

    if ( q_min <= total & total <= q_max )
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
    x(i+1:n) = x_min(i+1:n);

    total = alpha(1:n) * x(1:n)';

    if ( q_min <= total & total <= q_max )
      break
    end

  end

  return
end
