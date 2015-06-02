function simplex_gm_rule_test04 ( )

%*****************************************************************************80
%
%% SIMPLEX_GM_RULE_TEST04 tests GM_RULE_SET.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_GM_RULE_TEST04\n' );
  fprintf ( 1, '  GM_RULE_SET determines the weights and abscissas\n' );
  fprintf ( 1, '  of a Grundmann-Moeller quadrature rule for\n' );
  fprintf ( 1, '  the DIM_NUM dimensional simplex,\n' );
  fprintf ( 1, '  using a rule of in index RULE,\n' );
  fprintf ( 1, '  which will have degree of exactness 2*RULE+1.\n' );

  dim_num = 3;
  rule = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we use DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  RULE = %d\n', rule );
  fprintf ( 1, '  DEGREE = %d\n', 2 * rule + 1 );

  point_num = gm_rule_size ( rule, dim_num );

  [ w, x ] = gm_rule_set ( rule, dim_num, point_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     POINT        W             X             Y             Z\n' );
  fprintf ( 1, '\n' );

  for point = 1 : point_num
    fprintf ( 1, '  %8d  %12f', point, w(point) );
    for dim = 1 : dim_num
      fprintf ( 1, '  %12f', x(dim,point) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
