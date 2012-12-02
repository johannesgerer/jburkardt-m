function order = level_to_order_exponential ( dim_num, level, rule )

%*****************************************************************************80
%
%% LEVEL_TO_ORDER_EXPONENTIAL: exponential growth.
%
%  Discussion:
%
%    In exponential growth, from one level to the next, the number of points
%    essentially doubles.
%
%    Closed rules:
%
%      O(0) = 1
%      O(L) = 2^L + 1;
%
%      O = 1, 3, 5, 9, 17, 33, ...
%
%    Open rules:
%
%      O(L) = 2^(L+1) - 1;
%
%      O = 1, 3, 7, 15, 31, 63, ...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2011
%
%  Author:
%
%    John Burkardt
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

  for dim = 1 : dim_num

    if ( level(dim) < 0 )
      order = [];
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LEVEL_TO_ORDER_EXPONENTIAL - Fatal error!' );
      fprintf ( 1, '  Unexpected value of LEVEL(%d) = %d\n', dim, level(dim) );
      error ( 'LEVEL_TO_ORDER_EXPONENTIAL - Fatal error!' );
    elseif ( rule(dim) == 1 )
      if ( level(dim) == 0 )
        order(dim) = 1;
      else
        order(dim) = ( 2^level(dim) ) + 1;
      end
    elseif ( rule(dim) == 2 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 3 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 4 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 5 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 6 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 7 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 8 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 9 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 10 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 11 )
      if ( level(dim) == 0 )
        order(dim) = 1;
      else
        order(dim) = ( 2^level(dim) ) + 1;
      end
    elseif ( rule(dim) == 12 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 13 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 14 )
      if ( level(dim) == 0 )
        order(dim) = 1;
      else
        order(dim) = ( 2^level(dim) ) + 1;
      end
    elseif ( rule(dim) == 15 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 16 )
      order(dim) = 2^( level(dim) + 1 ) - 1;
    elseif ( rule(dim) == 17 )
      if ( level(dim) == 0 )
        order(dim) = 1;
      else
        order(dim) = ( 2^level(dim) ) + 1;
      end
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LEVEL_TO_ORDER_EXPONENTIAL - Fatal error!\n' );
      fprintf ( 1, '  Unexpected value of RULE = %d\n', rule(dim) );
      error ( 'LEVEL_TO_ORDER_EXPONENTIAL - Fatal error!' );
    end

  end

  return
end
