function sandia_rules_test23 ( r )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST23 tests LEVEL_GROWTH_TO_ORDER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST23\n' );
  fprintf ( 1, '  LEVEL_GROWTH_TO_ORDER uses level, rule and growth information\n' );
  fprintf ( 1, '  to determine the order of a 1D rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We are examining rule %d\n', r );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     LEVEL   0     1     2     3     4     5     6     7     8     9    10\n' );
  fprintf ( 1, 'GROWTH\n' );

  dim_num = 11;

  rule(1:dim_num) = r;

  for g = 0 : 6
  
    if ( r == 3 || r == 10 )
      if ( g == 1 || g == 2 || g == 3 )
        continue
      end
    end

    growth(1:dim_num) = g;
    level(1:dim_num) = 0 : dim_num - 1;
    order = level_growth_to_order ( dim_num, level, rule, growth );

    fprintf ( 1, '  %4d  ', g );

    for dim = 1 : dim_num
      fprintf ( 1, '  %4d', order(dim) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
