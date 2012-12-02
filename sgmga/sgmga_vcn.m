function [ x, more ] = sgmga_vcn ( n, w, x, q_min, q_max, more )

%*****************************************************************************80
%
%% SGMGA_VCN returns the next constrained vector.
%
%  Discussion:
%
%    This function is intended to replace the "naive" version, now called
%    SGMGA_VCN_NAIVE, which is too slow for high dimensional problems.
%
%    For nonnegative vectors X of dimension N, and nonnegative
%    weights W, we define:
%
%      Q = sum ( 1 <= I <= N ) W(I) * X(I)
%
%    and seek X satisfying the constraint:
%
%      Q_MIN < Q <= Q_MAX
%
%    This routine returns, one at a time exactly those X which satisfy
%    the constraint.  No attempt is made to return the X values in 
%    any particular order as far as Q goes.  
%
%  Example:
% 
%        W               4.0 3.0 5.0       
%      MIN     16.0       0   0   0
%      ---     ----      -----------
%        1     20.0       5   0   0
%        2     19.0       4   1   0
%        3     18.0       3   2   0
%        4     17.0       2   3   0
%        5     20.0       2   4   0
%        6     19.0       1   5   0
%        7     18.0       0   6   0
%        8     17.0       3   0   1
%        9     20.0       3   1   1
%       10     19.0       2   2   1
%       11     18.0       1   3   1
%       12     17.0       0   4   1
%       13     20.0       0   5   1
%       14     18.0       2   0   2
%       15     17.0       1   1   2
%       16     20.0       1   2   2
%       17     19.0       0   3   2
%       18     19.0       1   0   3
%       19     18.0       0   1   3
%       20     20.0       0   0   4
%      ---     ----      ----------
%      MAX     20.0       6   7   5         
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 May 2010
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
%    Input, integer N, the dimension of the vector.
%
%    Input, real W(N), the weights, which should be nonnegative.
%    At least one weight must be positive.
%
%    Input, integer X(DIM_NUM).  On first call, with
%    MORE = FALSE, the input value of X is not important.  On subsequent calls,
%    the input value of X should be the output value from the previous call.
%
%    Input, real Q_MIN, Q_MAX, the lower and upper
%    limits on the sum.
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
  persistent dir;
  persistent n2;
  persistent nstart;
  persistent xmax;
  persistent xmin;
%
%  Initialization for first call.
%
%  Allocate XMAX to remember the currently maximum possible value for each X.
%
%  Locate NSTART, the index of the first nonzero weight.
%  The algorithm is easier to program if the last index we look at
%  has a nonzero weight, so that it can always make up the remainder.
%
  if ( ~more )

    xmax = zeros ( n, 1 );
    nstart = - 1;

    for i = 1 : n
      if ( 0.0 < w(i) )
        nstart = i;
        break
      end
    end
%
%  Theoretically, we could even handle the case where all weights are zero.
%  That case is ruled out elsewhere in this software, so I will not try
%  to deal with it here for now.
%
    if ( nstart == - 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SGMGA_VCN - Fatal error!\n' );
      fprintf ( 1, '  No weight is positive.\n' );
      error ( 'SGMGA_VCN - Fatal error!' );
    end
%
%  Initialize X to zero, even the indices we ignore.
%
    x = zeros ( n, 1 );
%
%  N2 points to our current index of interest.
%
    n2 = n + 1;
    dir = - 1;

    more = 1;

  end
%
%  Look for the next solution vector X.
%
  while ( 1 )
%
%  If no more, the search is terminated.
%
    if ( ~more )

      break
%
%  DIR = -1, decrement N2, and, if possible, set X(N2) to XMIN.
%  DIR =  0, hold N2 at current value, and see if we can increment X(N2).
%
    elseif ( dir == - 1 || dir == 0 )

      if ( dir == - 1 )
        n2 = n2 - 1;
      end

      if ( w(n2) == 0.0 )

        xmin = 0;
        xmax(n2) = 0;

      elseif ( nstart < n2 )

        xmin = 0;
        xmax(n2) = floor ( ( q_max -  w(n2+1:n,1)' * x(n2+1:n,1) ) / w(n2) );

      elseif ( n2 == nstart && dir == - 1 )

        xmin = ceil ( ( q_min - w(n2+1:n,1)' * x(n2+1:n,1) ) / w(n2) );
        xmin = max ( xmin, 0 );
        if ( w(1:n2-1,1)' * x(1:n2-1,1) ...
           + w(n2) * xmin ...
           + w(n2+1:n,1)' * x(n2+1:n,1)  ...
          <= q_min )
          xmin = xmin + 1;
        end

        x(n2) = xmin;

        xmax(n2) = floor ( ( q_max -  w(n2+1:n,1)' * x(n2+1:n,1) ) / w(n2) );

      end

      if ( xmax(n2) < xmin )

        dir = + 1;

      else

        if ( n2 == nstart )

          if ( dir == - 1 )
            dir = 0;
            break
          elseif ( dir == 0 )
            x(n2) = x(n2) + 1;
            if ( x(n2) <= xmax(n2) )
              break
            else
              dir = + 1;
            end

          end

        else

          x(n2) = xmin;

        end

      end
%
%  DIR = + 1:
%  Try moving backwards to find an index N2 whose X we can increment.
%
    elseif ( dir == + 1 )

      while ( 1 )

        if ( n2 == n )
          dir = 0;
          more = 0;
          xmax = [];
          break;
        end

        n2 = n2 + 1;

        if ( 0.0 < w(n2) )

          if ( x(n2) < xmax(n2) )
            x(n2) = x(n2) + 1;
            dir = - 1;
            break
          end

        end
      end
    end
  end

  return
end