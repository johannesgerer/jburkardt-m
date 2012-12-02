function [ x, more ] = vector_constrained_next4 ( n, alpha, x_min, x_max, ...
  x, q, more )

%*****************************************************************************80
%
%% VECTOR_CONSTRAINED_NEXT4 returns the "next" constrained vector.
%
%  Discussion:
%
%    This routine is similar to VECTOR_CONSTRAINED_NEXT2 and 
%    VECTOR_CONSTRAINED_NEXT3.
%
%    We consider all vectors X of dimension N whose components
%    satisfy X_MIN(1:N) <= X(1:N) <= X_MAX(1:N).
%
%    We are only interested in the subset of these vectors which
%    satisfy the following constraint:
%
%      sum ( 1 <= I <= N ) ALPHA(I) * X(I) <= Q
%
%    This routine returns, one at a time, and in right-to-left
%    lexicographic order, exactly those vectors which satisfy
%    the constraint.
%
%  Example:
%
%    N = 3
%    ALPHA    4.0  3.0  5.0
%    Q       20.0
%    X_MIN:   1   1   1
%    X_MAX:   5   6   4
%
%    #  X(1)  X(2)  X(3)     Total
%
%    1    1     1     1       12.0
%    2    2     1     1       20.0
%    3    1     2     1       15.0
%    4    2     2     1       19.0
%    5    1     3     1       18.0
%    6    1     1     2       17.0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2006
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
%    Input, integer X(N).  On first call (with MORE = FALSE),
%    the input value of X is not important.  On subsequent calls, the
%    input value of X should be the output value from the previous call.
%
%    Input, real Q, the limit on the sum.
%
%    Input, logical MORE.  On input, if the user has set MORE
%    FALSE, the user is requesting the initiation of a new sequence
%    of values.  If MORE is TRUE, then the user is requesting "more"
%    values in the current sequence.
%
%    Output, integer X(N).  On output, (with MORE = TRUE), the value of
%    X will be the "next" vector in the reverse lexicographical list of 
%    vectors that satisfy the condition.  However, on output with 
%    MORE = FALSE, the vector X is meaningless, because there are no 
%    more vectors in the list.
%
%    Output, logical MORE.  On output, if MORE is TRUE,
%    then another value was found and returned in X, but if MORE is
%    FALSE, then there are no more values in the sequence, and X is
%    NOT the next value.
%
  if ( ~more )

    x(1:n) = x_min(1:n);

    total = alpha(1:n) * x(1:n)';

    if ( q < total )
      more = 0;
    else
      more = 1;
    end

    return

  else

    i = 1;

    while ( 1 )

      if ( x(i) < x_max(i) )

        x(i) = x(i) + 1;

        total = alpha(1:n) * x(1:n)';

        if ( total <= q )
          break
        end

      end

      x(i) = x_min(i);

      i = i + 1;

      if ( n < i )
        more = 0;
        break
      end

    end

  end

  return
end
