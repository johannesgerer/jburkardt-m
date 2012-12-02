function dunavant_test05 ( )

%*****************************************************************************80
%
%% DUNAVANT_TEST05 plots the Dunavant points in the unit triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2006
%
%  Author:
%
%    John Burkardt
%
  rule_max = 10;
  node_num = 3;
  node_show = 1;
  node_xy = [ ...
    0.0, 0.0; ...
    1.0, 0.0; ...
    0.0, 1.0 ]';
  point_show = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DUNAVANT_TEST05\n' );
  fprintf ( 1, '  This routine creates an EPS plot of each\n' );
  fprintf ( 1, '  set of Dunavant points.\n' );
  fprintf ( 1, '\n' );

  file_name = 'dunavant_rule_00.eps';

  for rule = 1 : rule_max

    file_name = file_name_inc ( file_name );

    order_num = dunavant_order_num ( rule );

    [ xy, w ] = dunavant_rule ( rule, order_num );

    triangle_points_plot ( file_name, node_xy, node_show, order_num, ...
      xy, point_show );

    fprintf ( 1, '  Rule %d plotted in "%s".\n', rule, file_name );

  end

  return
end
