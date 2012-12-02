function [ x, more ] = sgmga_vcn_ordered ( dim_num, level_weight, x_max, x, ...
  q_min, q_max, more )

%*****************************************************************************80
%
%% SGMGA_VCN_ORDERED returns the "next" constrained vector, with ordering.
%
%  Discussion:
%
%    We consider vectors X of dimension DIM_NUM satisfying:
%
%      0 <= X(1:DIM_NUM) <= X_MAX(1:DIM_NUM).
%
%    and define
%
%      Q = sum ( 1 <= I <= DIM_NUM ) LEVEL_WEIGHT(I) * X(I)
%
%    and seek X's satisfying the constraint:
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
%    This function returns, one at a time exactly those X which satisfy
%    the constraint.
%
%    A weak ordering is imposed on the solution vectors.  This function 
%    subdivides the range Q_MIN through Q_MAX into subintervals of width 1, so 
%    that the X vectors returned are roughly sorted (or at least binned) 
%    by Q value.
%
%  Example:
%
%    If the weights are also integral, then the X vectors are in fact sorted 
%    by Q value:
%
%    LEVEL_WEIGHT:          1.000000        1.000000
%
%     Q_MIN:        0.000000
%     Q_MAX:        2.000000
%     X_MAX:                         2         2
%
%          1        1.000000         1         0
%          2        1.000000         0         1
%          3        2.000000         2         0
%          4        2.000000         1         1
%          5        2.000000         0         2
%
%    When the weights are not integral, then the X values are only BINNED
%    by Q value, that is, we first get all X's with Q values between Q_MIN
%    and Q_MIN+1, then Q_MIN+1 to Q_MIN+2 and so on, as demonstrated here:
%
%    LEVEL_WEIGHT:             1.5               1
%    Q_MIN:  0.5
%    Q_MAX:  3
%    X_MAX:                           2         3
%
%           1             1.5         1         0
%           2               1         0         1
%           3             2.5         1         1
%           4               2         0         2
%           5               3         2         0
%           6               3         0         3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2009
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
%    Input, integer X_MAX(DIM_NUM), the maximum values allowed in each 
%    component of X.
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
  persistent q_min2;
  persistent q_max2;
%
%  On first call, initialize the subrange.
%
  if ( ~more )
    q_min2 = q_min;
    q_max2 = min ( q_min + 1.0, q_max );
  end
%
%  Call a lower level function to search the subrange.
%
  while ( 1 )

    [ x, more ] = sgmga_vcn ( dim_num, level_weight, x, q_min2, q_max2, more );
%
%  If another solution was found, return it.
%
    if ( more )
      return
    end
%
%  If the current subrange is exhausted, try to move to the next one.
%
    if ( q_max2 < q_max )
      q_min2 = q_max2;
      q_max2 = min ( q_max2 + 1.0, q_max );
%
%  If there are no more subranges, we're done.
%
    else
      break
    end

  end

  return
end
