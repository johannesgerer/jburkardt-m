function gm_rule_test06 ( )

%*****************************************************************************80
%
%% TEST06 tests GM_RULE_SET.
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
  fprintf ( 1, 'TEST06\n' );
  fprintf ( 1, '  GM_RULE_SET determines the weights and abscissas\n' );
  fprintf ( 1, '  of a Grundmann-Moeller quadrature rule for\n' );
  fprintf ( 1, '  the DIM_NUM dimensional simplex,\n' );
  fprintf ( 1, '  using a rule of in index RULE,\n' );
  fprintf ( 1, '  which will have degree of exactness 2*RULE+1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we write a rule to a file.\n' );
  fprintf ( 1, '\n' );

  dim_num = 3;
  rule = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we use DIM_NUM = %d\n', dim_num );
  fprintf ( 1, '  RULE = %d\n', rule );
  fprintf ( 1, '  DEGREE = %d\n', 2 * rule + 1 );

  point_num = gm_rule_size ( rule, dim_num );

  [ w, x ] = gm_rule_set ( rule, dim_num, point_num );

  w_file = sprintf ( 'gm%d_%dd_w.txt', rule, dim_num );

  w_unit = fopen ( w_file, 'wt' );

  for point = 1 : point_num
    fprintf ( w_unit, '%f20.16\n', w(point) );
  end

  fclose ( w_unit );

  x_file = sprintf ( 'gm%d_%dd_x.txt', rule, dim_num );

  x_unit = fopen ( x_file, 'wt' );

  for point = 1 : point_num
    for dim = 1 : dim_num
      fprintf ( x_unit, '%20.16f', x(dim,point) );
    end
    fprintf ( x_unit, '\n' );
  end

  fclose ( x_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote rule %d to "%s" and "%s".\n', rule, w_file, x_file );

  return
end
