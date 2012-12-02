function coef = sgmga_vcn_coef ( dim_num, level_weight, x, q_max )

%*****************************************************************************80
%
%% SGMGA_VCN_COEF returns the "next" constrained vector's coefficient.
%
%  Discussion:
%
%    The related code "SGMGA_VCN_COEF_NAIVE" represents a "naive" approach to
%    this calculation.  This code carries out the same calculation, but tries
%    to avoid the potential explosion in work that is exponential in the
%    spatial dimension for the naive approach.
%
%    We are considering nonnegative integer vectors X of dimension DIM_NUM 
%    for which the functional
%
%      Q(X) = sum ( 1 <= I <= DIM_NUM ) LEVEL_WEIGHT(I) * X(I)
%
%   satisfies the "Q" constraint:
%
%      Q_MIN < Q(X) <= Q_MAX
%
%    where LEVEL_WEIGHT is a vector of (essentially) positive weights.
%    Some, but not all of the entries of LEVEL_WEIGHT might be zero;
%    in that case, the corresponding values of X never vary, and do not
%    play a part in the following computation.
%
%    Supposing we have a suitable vector X, we now wish to count the
%    number of distinct vectors Y which also satisfy the Q constraint
%    as well as the following "binary" constraint:
%
%      Y(I) = X(I) + B(I)
%
%    where every entry of B is 0 or 1.
%
%    Clearly, there are 2^DIM_NUM vectors Y which satisfy the binary
%    constraint, and a naive calculation would simply generate each
%    possible Y, evaluate Q(Y), and if Y satisfies the Q constraint,
%    add it to the count.
%
%    But if we are considering even moderately large values of DIM_NUM,
%    say 20 <= DIM_NUM, then the mere task of generating all possible
%    Y vectors is burdensome.  If there are in fact likely to be only
%    a few satisfactory Y vectors, (which depends on the values of
%    Q_MIN, Q_MAX, and LEVEL_WEIGHT, of course) then it may be possible to
%    find and count them more rapidly.
%
%    This function attempts a more rapid computation by carrying out the
%    search in a particular order, and realizing that, in certain cases,
%    if a particular value Y* does not satisfy the Q constraint, then
%    a consecutive sequence of Y's following Y* also cannot satisfy the
%    constraint, and hence the search can jump over them.
%
%  Example:
%
%    DIM_NUM = 3
%    LEVEL_WEIGHT    3.0  2.0  1.0
%    Q_MAX    6.0
%
%    U = unsigned count
%    S =   signed count returned as COEF
%
%    #   U  S   X1 X2 X3
%
%    1   8  0    0  0  0
%    2   7  1    0  0  1
%    3   6  0    0  0  2
%    4   5 -1    0  0  3
%    5   3 -1    0  0  4
%    6   2  0    0  0  5
%    7   1  1    0  0  6
%    8   6  0    0  1  0
%    9   5 -1    0  1  1
%   10   3 -1    0  1  2
%   11   2  0    0  1  3
%   12   1  1    0  1  4
%   13   3 -1    0  2  0
%   14   2  0    0  2  1
%   15   1  1    0  2  2
%   16   1  1    0  3  0
%   17   5 -1    1  0  0
%   18   3 -1    1  0  1
%   19   2  0    1  0  2
%   20   1  1    1  0  3
%   21   2  0    1  1  0
%   22   1  1    1  1  1
%   23   1  1    2  0  0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2010
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the weights.
%
%    Input, integer X(DIM_NUM), satisfies the Q constraint.
%
%    Input, real Q_MAX, the Q constraint maximum.
%
%    Output, real COEF, the combinatorial coefficient.
%

%
%  Force column vectors.
%
  level_weight = level_weight ( : );
  x = x ( : );

  coef = 0.0;
  b(1:dim_num,1) = 0;

  while ( 1 )
%
%  Generate the next binary perturbation.
%
    i = 0;

    while ( i < dim_num )

      i = i + 1;
%
%  If LEVEL_WEIGHT(I) == 0, B(I) is fixed at 0.  Next I.
%
      if ( level_weight(i) == 0.0 )
%
%  If B(I) is 1, set it to 0.  Next I.
%
      elseif ( b(i) == 1 )

        b(i) = 0;
%
%  B(I) is 0.  Convert it to 1.
%
      else

        b(i) = 1;

        while ( 1 )
%
%  Does X + B satisfy the Q_MAX constraint?
%
          if ( level_weight' * ( x + b ) <= q_max )
            break
          end
%
%  If Q(X+B) now exceeds QMAX, B is rejected.  But we can also skip
%  all perturbations which agree with B through the I-th position.
%  To skip to the next "interesting" candidate, we essentially carry
%  out binary addition between B and a vector B' which has a single 1
%  in the I-th position.
%
          b(i) = 0;

          while ( i < dim_num )

            i = i + 1;

            if ( level_weight(i) == 0.0 )

            elseif ( b(i) == 1 )
              b(i) = 0;
            else
              b(i) = 1;
              break
            end

          end

        end

        break

      end

    end

    b_sum = sum ( b(1:dim_num) );
%
%  X+B is another solution to be counted.
%
    coef = coef + 1 - 2 * mod ( b_sum, 2 );
%
%  We're done if we've got back to 0.
%
    if ( b_sum == 0 )
      break
    end

  end

  return
end
