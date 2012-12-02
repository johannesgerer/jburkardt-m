function [ x, more ] = sgmga_vcn_naive ( dim_num, level_weight, x_max, x, ...
  q_min, q_max, more )

%*****************************************************************************80
%
%% SGMGA_VCN_NAIVE returns the next constrained vector.
%
%  Discussion:
%
%    This function uses a naive algorithm, which quickly becomes unsuitable
%    for higher dimensions.  The function SGMGA_VCN is an attempt at a more
%    efficient calculation of the same quantities.
%
%    We consider vectors X of dimension DIM_NUM satisfying:
%
%      0 <= X(1:DIM_NUM) <= X_MAX(1:DIM_NUM).
%
%    and define
%
%      Q = sum ( 1 <= I <= DIM_NUM ) LEVEL_WEIGHT(I) * X(I)
%
%    and seek X satisfying the constraint:
%
%      Q_MIN < Q <= Q_MAX
%
%    For sparse grid applications, we compute
%
%      LEVEL_WEIGHT_MIN_POS = minimum positive entry in LEVEL_WEIGHT
%
%    and assume there is an underlying LEVEL used to index the sets of 
%    constrained vectors, and that 
%
%      Q_MAX = LEVEL * LEVEL_WEIGHT_MIN_POS
%      Q_MIN = LEVEL - LEVEL_WEIGHT_MIN_POS * sum ( LEVEL_WEIGHT(:) )
%      X_MAX(I) = LEVEL * LEVEL_WEIGHT_MIN_POS / LEVEL_WEIGHT(I)
%
%    This routine returns, one at a time exactly those X which satisfy
%    the constraint.  No attempt is made to return the X values in 
%    any particular order as far as Q goes.  
%
%  Example:
%
%    LEVEL_WEIGHT:          1.000000        1.000000
%
%    Q_MIN:        0.000000
%    Q_MAX:        2.000000
%    X_MAX:                         2         2
%
%         1        1.000000         1         0
%         2        2.000000         2         0
%         3        1.000000         0         1
%         4        2.000000         1         1
%         5        2.000000         0         2
%
%    LEVEL_WEIGHT:          1.000000        2.000000
%
%    Q_MIN:       -1.000000
%    Q_MAX:        2.000000
%    X_MAX:                         2         1
%
%         1        0.000000         0         0
%         2        1.000000         1         0
%         3        2.000000         2         0
%         4        2.000000         0         1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    An Anisotropic Sparse Grid Stochastic Collocation Method for Partial 
%    Differential Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2411-2442.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of components in the vector.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the anisotropic weights.
%
%    Input, integer X_MAX(DIM_NUM), the maximum
%    values allowed in each component of X.
%
%    Input, integer X(DIM_NUM).  On first call, with
%    MORE = FALSE, the input value of X is not important.  On subsequent calls,
%    the input value of X should be the output value from the previous call.
%
%    Input, real Q_MIN, Q_MAX, the lower and upper limits on the sum.
%
%    Input, logical MORE.  On input, if the user has set MORE
%    FALSE, the user is requesting the initiation of a new sequence
%    of values.  If MORE is TRUE, then the user is requesting "more"
%    values in the current sequence. 
%
%    Output, integer X(DIM_NUM).
%    On output, (with MORE = TRUE), the value of X will be the "next"
%    vector in the reverse lexicographical list of vectors that satisfy
%    the condition.  However, on output with MORE = FALSE, the vector
%    X is meaningless, because there are no more vectors in the list.
%
%    Output, logical MORE.  If MORE is TRUE on output,
%    then another value was found and returned in X, but if MORE is
%    FALSE, then there are no more values in the sequence, and X is
%    NOT the next value.
%
  if ( ~more )

    more = 1;

    x = zeros ( dim_num, 1 );

    q = level_weight(1:dim_num)' * x(1:dim_num);

    if ( q_min < q && q <= q_max )
      return
    end

  end

  while ( 1 )

    i = 1;

    while ( 1 )

      if ( x(i) < x_max(i) )
        break
      end

      if ( dim_num <= i )
        more = 0;
        return
      end

      i = i + 1;

    end

    x(i) = x(i) + 1;
    x(1:i-1) = 0;

    q = level_weight(1:dim_num)' * x(1:dim_num);

    if ( q_min < q && q <= q_max )
      break
    end

  end

  return
end
