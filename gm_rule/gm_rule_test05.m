function gm_rule_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests GM_RULE_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 July 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  dim_num_test = [ 2, 3, 5, 10 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  GM_RULE_SET determines the weights and abscissas\n' );
  fprintf ( 1, '  of a Grundmann-Moeller quadrature rule for\n' );
  fprintf ( 1, '  the DIM_NUM dimensional simplex,\n' );
  fprintf ( 1, '  using a rule of in index RULE,\n' );
  fprintf ( 1, '  which will have degree of exactness 2*RULE+1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we compute various rules, and simply\n' );
  fprintf ( 1, '  report the number of points, and the sum of weights.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   DIM_NUM      RULE    POINT_NUM  WEIGHT SUM\n' );

  for test = 1 : test_num

    dim_num = dim_num_test(test);

    fprintf ( 1, '\n' );

    for rule = 0 : 5

      point_num = gm_rule_size ( rule, dim_num );

      [ w, x ] = gm_rule_set ( rule, dim_num, point_num );

      w_sum = sum ( w(1:point_num) );

      fprintf ( 1, '  %8d  %8d  %8d  %24.16f\n', ...
        dim_num, rule, point_num, w_sum );

    end

  end

  return
end
