function sandia_rules_test25 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST25 tests LEVEL_TO_ORDER_EXPONENTIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    27 November 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST25\n' );
  fprintf ( 1, '  LEVEL_TO_ORDER_EXPONENTIAL uses an exponential rule to\n' );
  fprintf ( 1, '  determine the order of a rule from its level.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RULE/LEVEL   0     1     2     3     4     5     6     7     8     9    10\n' );
  fprintf ( 1, '\n' );

  dim_num = 11;

  for r = 1 : 10
  
    rule(1:dim_num) = r;
    level(1:dim_num) = 0 : dim_num - 1;
    order = level_to_order_exponential ( dim_num, level, rule );

    fprintf ( 1, '  %4d  ', r );

    for dim = 1 : dim_num
      fprintf ( 1, '  %4d', order(dim) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
