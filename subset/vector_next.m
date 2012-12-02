function [ x, more ] = vector_next ( n, x_min, x_max, x, more )

%*****************************************************************************80
%
%% VECTOR_NEXT returns the "next" integer vector between two ranges.
%
%  Discussion:
%
%    We consider all integer vectors of dimension N satisfying:
%
%      X_MIN(1:N) <= X(1:N) <= X_MAX(1:N).
%
%    This routine returns, one at a time, and in right-to-left
%    lexicographic order, all these vectors.
%
%  Example:
%
%    N = 3
%    X_MIN:   2   2   0
%    X_MAX:   4   3   1
%
%    #  X(1)  X(2)  X(3)
%
%    1    2     2     0
%    2    3     2     0
%    3    4     2     0
%    4    2     3     0
%    5    3     3     0
%    6    4     3     0
%    7    2     2     1
%    8    3     2     1
%    9    4     2     1
%   10    2     3     1
%   11    3     3     1
%   12    4     3     1
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
%    Input, integer X_MIN(N), X_MAX(N), the minimum and maximum
%    values allowed in each component.
%
%    Input, integer X(N).  On first call, with
%    MORE = FALSE, the input value of X is not important.  On subsequent calls,
%    the input value of X should be the output value from the previous call.
%
%    Input, logical MORE.  On input, if the user has set MORE
%    FALSE, the user is requesting the initiation of a new sequence
%    of values.  If MORE is TRUE, then the user is requesting "more"
%    values in the current sequence.
%
%    Output, integer X(N).  If MORE = TRUE, the value of X will be the "next"
%    vector in the reverse lexicographical list of vectors.  However, on
%    output with MORE = FALSE, the vector X is meaningless, because there
%    are no more vectors in the list.
%
%    Output, logical MORE.  If MORE is TRUE,
%    then another value was found and returned in X, but if MORE is
%    FALSE, then there are no more values in the sequence, and X is
%    NOT the next value.
%
  if ( ~more )

    x(1:n) = x_min(1:n);
    more = 1;

  else

    i = 1;

    while ( 1 )

      if ( x(i) < x_max(i) )
        x(i) = x(i) + 1;
        break
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
