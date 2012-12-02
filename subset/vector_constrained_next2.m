function [ x, constraint, more ] = vector_constrained_next2 ( ...
  n, x_min, x_max, x, more )

%*****************************************************************************80
%
%% VECTOR_CONSTRAINED_NEXT2 returns the "next" constrained vector.
%
%  Discussion:
%
%    We consider all vectors of dimension N whose components
%    satisfy X_MIN(1:N) <= X(1:N) <= X_MAX(1:N).
%
%    We are only interested in the subset of these vectors which
%    satisfy the following constraint:
%
%      sum ( 1 <= I <= N ) ( X(I) / X_MAX(I) ) <= 1
%
%    We can carry out this check using integer arithmetic if we
%    multiply through by P = product ( X_MAX(1:N) ):
%
%      sum ( 1 <= I <= N ) ( X(I) * ( P / X_MAX(I) ) ) <= P.
%
%    This routine returns, one at a time, and in right-to-left
%    lexicographic order, exactly those vectors which satisfy
%    the constraint.
%
%  Example:
%
%    N = 3
%    X_MIN:   1   1   1
%    X_MAX:   5   6   4
%
%    P = 120
%
%    #  X(1)  X(2)  X(3)  CONSTRAINT
%
%    1    1     1     1       74
%    2    2     1     1       98
%    3    1     2     1       94
%    4    2     2     1      119
%    5    1     3     1      114
%    6    1     1     2      104
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components in the vector.
%
%    Input, integer X_MIN(N), X_MAX(N), the minimum and maximum
%    values allowed in each component.
%
%    Input, integer X(N).  On first call (with MORE = FALSE),
%    the input value of X is not important.  On subsequent calls, the
%    input value of X should be the output value from the previous call.
%    On output, (with MORE = TRUE), the value of X will be the "next"
%    vector in the reverse lexicographical list of vectors that satisfy
%    the condition.  However, on output with MORE = FALSE, the vector
%    X is meaningless, because there are no more vectors in the list.
%
%    Input, logical MORE.  On input, if the user has set MORE
%    FALSE, the user is requesting the initiation of a new sequence
%    of values.  If MORE is TRUE, then the user is requesting "more"
%    values in the current sequence.  On output, if MORE is TRUE,
%    then another value was found and returned in X, but if MORE is
%    FALSE, then there are no more values in the sequence, and X is
%    NOT the next value.
%
%    Output, integer X(N).  On first call (with MORE = FALSE),
%    the input value of X is not important.  On subsequent calls, the
%    input value of X should be the output value from the previous call.
%    On output, (with MORE = TRUE), the value of X will be the "next"
%    vector in the reverse lexicographical list of vectors that satisfy
%    the condition.  However, on output with MORE = FALSE, the vector
%    X is meaningless, because there are no more vectors in the list.
%
%    Output, integer CONSTRAINT, the constraint value for X.  Valid vectors X
%    will have a CONSTRAINT value between product(X_MIN(1:N)) (automatically)
%    and product(X_MAX(1:N)) (because we skip over vectors with a
%    constraint larger than this value).
%
%    Output, logical MORE.  On input, if the user has set MORE
%    FALSE, the user is requesting the initiation of a new sequence
%    of values.  If MORE is TRUE, then the user is requesting "more"
%    values in the current sequence.  On output, if MORE is TRUE,
%    then another value was found and returned in X, but if MORE is
%    FALSE, then there are no more values in the sequence, and X is
%    NOT the next value.
%
  persistent x_prod;

  if ( ~more )

    x(1:n) = x_min(1:n);

    x_prod = prod ( x_max(1:n) );

    constraint = sum ( x(1:n) .* ( x_prod ./ x_max(1:n) ) );

    if ( x_prod < constraint )
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

        constraint = sum ( x(1:n) .* ( x_prod ./ x_max(1:n) ) );

        if ( constraint <= x_prod )
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
