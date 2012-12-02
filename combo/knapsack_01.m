function [ x, mass, profit ] = knapsack_01 ( n, mass_limit, p, w )

%*****************************************************************************80
%
%% KNAPSACK_01 solves the 0/1 knapsack problem.
%
%  Discussion:
%
%    The 0/1 knapsack problem is as follows:
%
%      Given:
%        a set of N objects,
%        a profit P(I) and weight W(I) associated with each object,
%        and a weight limit MASS_LIMIT,
%      Determine:
%        a set of choices X(I) which are 0 or 1, that maximizes the profit
%          P = Sum ( 1 <= I <= N ) P(I) * X(I)
%        subject to the constraint
%          Sum ( 1 <= I <= N ) W(I) * X(I) <= MASS_LIMIT.
%
%    This routine assumes that the objects have already been sorted
%    in order of decreasing "profit density", P(I)/W(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 July 2000
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, real MASS_LIMIT, the weight limit of the
%    chosen objects.
%
%    Input, real P(N), the "profit" or value of each object.
%    P is assumed to be nonnegative.
%
%    Input, real W(N), the "weight" or cost of each object.
%    W is assumed to be  nonnegative.
%
%    Output, real X(N), the choice function for the objects.
%    0, the object was not taken.
%    1, the object was taken.
%
%    Output, real MASS, the total mass of the objects taken.
%
%    Output, real PROFIT, the total profit of the objects taken.
%

%
%  Initialize the "best so far" data.
%
  x_best = zeros ( n, 1 );
  profit_best = 0.0;
  mass_best = 0;
%
%  Begin the backtracking solution.
%
  maxstack = 100;
  stacks = zeros ( maxstack, 1 );
  x = zeros ( n, 1 );
  indx = 0;
  k = 1;
  nstack = 0;
  ncan = 0;

  while ( 1 )

    [ x, indx, k, nstack, stacks, ncan ] = r8vec_backtrack ( n, ...
      x, indx, k, nstack, stacks, ncan );
%
%  Got a new candidate.  Compare it to the best so far.
%
    if ( indx == 1 )

      profit = p(1:n)' * x(1:n);
      mass = w(1:n)' * x(1:n);

      if ( profit_best < profit || ...
         ( profit == profit_best && mass < mass_best ) )
        profit_best = profit;
        mass_best = mass;
        x_best(1:n) = x(1:n);
      end
%
%  Need candidates for X(K).
%
%  X(K) = 1 is possible if:
%
%    * adding W(K) to our mass doesn't put us over our mass limit;
%    * and adding P(K) to our current profit, and taking the best we
%      could get using rational X for the remainder would put us over
%      our current best.
%
%  X(K) = 0 is always possible.
%
    elseif ( indx == 2 )

      ncan(k) = 0;

      mass_1 = w(1:k-1)' * x(1:k-1) + w(k);

      if ( mass_1 <= mass_limit )

        mass_remaining = mass_limit - mass_1;

        profit_1 = p(1:k-1)' * x(1:k-1) + p(k);

        if ( k < n )
          [ x(k+1:n), mass_2, profit_2 ] = knapsack_rational ( n - k, ...
            mass_remaining, p(k+1:n), w(k+1:n) );
        else
          profit_2 = 0.0;
        end

        if ( profit_best < profit_1 + profit_2 )
          if ( maxstack <= nstack )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'KNAPSACK_01 - Fatal error!\n' );
            fprintf ( 1, '  Exceeded stack space.\n' );
            return
          end
          ncan(k) = ncan(k) + 1;
          nstack = nstack + 1;
          stacks(nstack) = 1.0;
        end

      end

      if ( maxstack <= nstack )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'KNAPSACK_01 - Fatal error!\n' );
        fprintf ( 1, '  Exceeded stack space.\n' );
        return
      end

      ncan(k) = ncan(k) + 1;
      nstack = nstack + 1;
      stacks(nstack) = 0.0;
%
%  Done.  Return the best solution.
%
    else

      profit = profit_best;
      mass = mass_best;
      x(1:n) = x_best(1:n);
      break

    end

  end

  return
end
