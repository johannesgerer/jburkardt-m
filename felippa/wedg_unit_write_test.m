function wedg_unit_write_test ( degree_max )

%*****************************************************************************80
%
%% WEDG_UNIT_WRITE_TEST tests some wedge quadrature rules to files.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  rule_num = 7;
  line_order_array(1:7) = [ 1, 2, 2, 3, 2, 3, 4 ];
  trig_order_array(1:7) = [ 1, 3, -3, 6, -6, 7, 12 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WEDG_UNIT_WRITE_TEST\n' );
  fprintf ( 1, '  For the unit wedge,\n' );
  fprintf ( 1, '  write some rules to a file\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   Rule  Trig    Line   Total  W_File X_File\n' );
  fprintf ( 1, '         Order   Order  Order\n' );
  fprintf ( 1, '\n' );

  for rule = 1 : rule_num

    if ( rule == 1 )
      w_filename = 'wedge_felippa_1x1_w.txt';
      x_filename = 'wedge_felippa_1x1_x.txt';
    elseif ( rule == 2 )
      w_filename = 'wedge_felippa_3x2_w.txt';
      x_filename = 'wedge_felippa_3x2_x.txt';
    elseif ( rule == 3 )
      w_filename = 'wedge_felippa_3bx2_w.txt';
      x_filename = 'wedge_felippa_3bx2_x.txt';
    elseif ( rule == 4 )
      w_filename = 'wedge_felippa_6x3_w.txt';
      x_filename = 'wedge_felippa_6x3_x.txt';
    elseif ( rule == 5 )
      w_filename = 'wedge_felippa_6bx2_w.txt';
      x_filename = 'wedge_felippa_6bx2_x.txt';
    elseif ( rule == 6 )
      w_filename = 'wedge_felippa_7x3_w.txt';
      x_filename = 'wedge_felippa_7x3_x.txt';
    elseif ( rule == 7 )
      w_filename = 'wedge_felippa_12x4_w.txt';
      x_filename = 'wedge_felippa_12x4_x.txt';
    end

    line_order = line_order_array(rule);
    trig_order = trig_order_array(rule);

    order = line_order * abs ( trig_order );

    [ w, x ] = wedg_unit_rule ( line_order, trig_order );
    r8mat_write ( w_filename, 1, order, w );
    r8mat_write ( x_filename, dim_num, order, x );
    fprintf ( 1, '  %6d  %6d  %6d  %6d  %s  %s\n', ...
      rule, trig_order, line_order, order, w_filename, x_filename );

  end


  return
end
