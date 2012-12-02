function order = level_to_order_exponential_slow ( dim_num, level, rule )

%*****************************************************************************80
%
%% LEVEL_TO_ORDER_EXPONENTIAL_SLOW: slow exponential growth
%
%  Discussion:
%
%    We seek a sequence of quadrature rules with two opposing constraints:
%    * a measured rise in polynomial precision with increasing level;
%    * a control on the increase in (new) points per level;
%
%    Essentially, we are trying to keep some of the advantages of nesting,
%    while moderating the cost of the explosive growth in order that occurs
%    due to the repeated order doubling of nesting.
%
%    We wish the number of points at a given level L to be "about" 2 * L + 1,
%    but we also wish the rules to be completely nested.
%
%    One way to do this is to start with a nested family of rules, whose
%    order will tend to grow exponentially (doubling from one to the next),
%    but simply to REPEAT each rule as many times as possible.  We move to
%    the next rule only when the desired precision 2 * L + 1 exceeds the
%    precision of the current rule.
%
%    For both the Clenshaw Curtis and Fejer Type 2 rules, the order and
%    precision are the same if te order is odd.   That is, an 11 point rule
%    will integrate exactly all polynomials up to and including degree 11.
%
%    For Gauss Patterson rules, the relationship between order and precision
%    is somewhat more complicated.  For that rule, we take the philosophy
%    that at each level L, we wish to choose the rule of smallest order
%    so that the precision of 2 * L + 1 is guaranteed.
%
%     L    2*L+1  CC Order    F2 Order    GP Order/Precision
%
%     0        1         1           1        1/1
%     1        3         3           3        3/5
%     2        5         5           7        3/5
%     3        7         9           7        7/11
%     4        9         9          15        7/11
%     5       11        17          15        7/11
%     6       13        17          15       15/23
%     7       15        17          15       15/23
%     8       17        17          31       15/23
%     9       19        33          31       15/23
%    10       21        33          31       15/23
%    11       23        33          31       15/23
%    12       25        33          31       31/47
%    13       27        33          31       31/47
%    14       29        33          31       31/47
%    15       31        33          31       31/47
%    16       33        33          63       31/47
%    17       35        65          63       31/47
%    18       37        65          63       31/47
%    19       39        65          63       31/47
%    20       41        65          63       31/47
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Knut Petras,
%    Smolyak Cubature of Given Polynomial Degree with Few Nodes
%    for Increasing Dimension,
%    Numerische Mathematik,
%    Volume 93, Number 4, February 2003, pages 729-753.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL(DIM_NUM), the 1D levels.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested rule.
%     2, "F2",  Fejer Type 2, Open Fully Nested rule.
%     3, "GP",  Gauss Patterson, Open Fully Nested rule.
%     4, "GL",  Gauss Legendre, Open Weakly Nested rule.
%     5, "GH",  Gauss Hermite, Open Weakly Nested rule.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested rule.
%     7, "LG",  Gauss Laguerre, Open Non Nested rule.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested rule.
%     9, "GJ",  Gauss Jacobi, Open Non Nested rule.
%    10, "GW",  Golub Welsch, (presumed) Open Non Nested rule.
%    11, "CC_SE", Clenshaw Curtis Slow Exponential, Closed Fully Nested rule.
%    12, "F2_SE", Fejer Type 2 Slow Exponential, Closed Fully Nested rule.
%    13, "GP_SE", Gauss Patterson Slow Exponential, Closed Fully Nested rule.
%    14, "CC_ME", Clenshaw Curtis Moderate Exponential, Closed Fully Nested rule.
%    15, "F2_ME", Fejer Type 2 Moderate Exponential, Closed Fully Nested rule.
%    16, "GP_ME", Gauss Patterson Moderate Exponential, Closed Fully Nested rule.
%    17, "CCN", Clenshaw Curtis Nested, Linear, Closed Fully Nested rule.
%
%    Output, integer ORDER(DIM_NUM), the 1D orders (number of points).
%
  order = zeros ( dim_num, 1 );

  if ( any ( level(1:dim_num) < 0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEVEL_TO_ORDER_EXPONENTIAL_SLOW - Fatal error!\n' );
    fprintf ( 1, '  Some entry of LEVEL is negative.\n' );
    error ( 'LEVEL_TO_ORDER_EXPONENTIAL_SLOW - Fatal error!' );
  end

  for dim = 1 : dim_num

    if ( rule(dim) == 1 || ...
         rule(dim) == 11 || ...
         rule(dim) == 14 || ...
         rule(dim) == 17 )

      if ( level(dim) == 0 )
        o = 1;
      else
        o = 2;
        while ( o < 2 * level(dim) + 1 )
          o = 2 * ( o - 1 ) + 1;
        end
      end

    elseif ( rule(dim) == 3 || ...
             rule(dim) == 13 || ...
             rule(dim) == 16 )

      if ( level(dim) == 0 )
        o = 1;
      else
        p = 5;
        o = 3;
        while ( p < 2 * level(dim) + 1 )
          p = 2 * p + 1;
          o = 2 * o + 1;
        end
      end

    else

      o = 1;
      while ( o < 2 * level(dim) + 1 )
        o = 2 * o + 1;
      end

    end

    order(dim) = o;

  end

  return
end
