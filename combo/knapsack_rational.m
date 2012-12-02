function [ x, mass, profit ] = knapsack_rational ( n, mass_limit, p, w )

%*****************************************************************************80
%
%% KNAPSACK_RATIONAL solves the rational knapsack problem.
%
%  Discussion:
%
%    The rational knapsack problem is a generalization of the 0/1 knapsack
%    problem.  It is mainly used to derive a bounding function for the
%    0/1 knapsack problem.
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
%    By contrast, the rational knapsack problem allows the values X(I)
%    to be any value between 0 and 1.  A solution for the rational knapsack
%    problem is known.  Arrange the objects in order of their "profit density"
%    ratios P(I)/W(I), and then take in order as many of these as you can.
%    If you still have "room" in the weight constraint, then you should
%    take the maximal fraction of the very next object, which will complete
%    your weight limit, and maximize your profit.
%
%    If should be obvious that, given the same data, a solution for
%    the rational knapsack problem will always have a profit that is
%    at least as high as for the 0/1 problem.  Since the rational knapsack
%    maximum profit is easily computed, this makes it a useful bounding
%    function.
%
%    Note that this routine assumes that the objects have already been
%    arranged in order of the "profit density".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2011
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
%    The entries of P are assumed to be nonnegative.
%
%    Input, real W(N), the "weight" or cost of each object.
%    The entries of W are assumed to be nonnegative.
%
%    Output, real X(N), the choice function for the objects.
%    0.0, the object was not taken.
%    1.0, the object was taken.
%    R, where 0 < R < 1, a fractional amount of the object was taken.
%
%    Output, real MASS, the total mass of the objects taken.
%
%    Output, real PROFIT, the total profit of the objects taken.
%
  x = zeros(n,1);
  mass = 0.0;
  profit = 0.0;

  for i = 1 : n

    if ( mass_limit <= mass )
      x(i) = 0.0;
    elseif ( mass + w(i) <= mass_limit )
      x(i) = 1.0;
      mass = mass + w(i);
      profit = profit + p(i);
    else
      x(i) = ( mass_limit - mass ) / w(i);
      mass = mass_limit;
      profit = profit + p(i) * x(i);
    end

  end

  return
end
