function triangulation_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests NS_ADJ_COL_SET, NS_ADJ_COUNT and NS_ADJ_ROW_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2006
%
%  Author:
%
%    John Burkardt
%
  node_num = 15;
  triangle_num = 4;
  triangle_order = 6;
  variable_num = 36;

  file_name = 'ns_triangulation.eps';
  node_p_variable = [ ...
    3, -1,  8, -1, 13,  ...
   -1, -1, -1, -1,  ...
   24, -1, 29,  ...
   -1, -1,  ...
   36 ];
  node_u_variable = [ ...
    1,  4,  6,  9, 11,  ...
   14, 16, 18, 20,  ...
   22, 25, 27,  ...
   30, 32,  ...
   34 ];
  node_v_variable = [ ...
    2,  5,  7, 10, 12,  ...
   15, 17, 19, 21,  ...
   23, 26, 28,  ...
   31, 33,  ...
   35 ];
  node_xy = [ ...
   0.0, 0.0;  ...
   0.0, 1.0;  ...
   0.0, 2.0;  ...
   0.0, 3.0;  ...
   0.0, 4.0;  ...
   1.0, 0.0;  ...
   1.0, 1.0;  ...
   1.0, 2.0;  ...
   1.0, 3.0;  ...
   2.0, 0.0;  ...
   2.0, 1.0;  ...
   2.0, 2.0;  ...
   3.0, 0.0;  ...
   3.0, 1.0;  ...
   4.0, 0.0 ]';
  triangle_neighbor = [ ...
    -1,  2, -1;  ...
     3,  1,  4;  ...
     2, -1, -1;  ...
    -1, -1,  2 ]';
  triangle_node = [ ...
     1, 10,  3,  6,  7,  2;  ...
    12,  3, 10,  8,  7, 11;  ...
     3, 12,  5,  8,  9,  4;  ...
    10, 15, 12, 13, 14, 11 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  For an order 3/order 6 Taylor Hood triangulation\n' );
  fprintf ( 1, '  for Navier Stokes velocity and pressure,\n' );
  fprintf ( 1, '  NS_ADJ_COUNT counts variable adjacencies\n' );
  fprintf ( 1, '    and sets up the sparse compressed column\n' );
  fprintf ( 1, '    column pointer array.\n' );
  fprintf ( 1, '  NS_ADJ_COL_SET sets up the sparse compressed column\n' );
  fprintf ( 1, '    COL vector.\n' );
  fprintf ( 1, '  NS_ADJ_ROW_SET sets up the sparse compressed column\n' );
  fprintf ( 1, '    ROW vector.\n' );
%
%  Plot the example.
%
  node_show = 2;
  triangle_show = 2;

  triangulation_order6_plot ( file_name, node_num, node_xy, ...
    triangle_num, triangle_node, node_show, triangle_show );
%
%  Get the count of the variable adjacencies.
%  We don't really need to make this call, since the next
%  call does the calculation as part of getting ADJ_COL.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of variables is %d\n', variable_num );

  adj_num = ns_adj_count ( node_num, triangle_num, variable_num, ...
    triangle_node, triangle_neighbor, node_u_variable, node_v_variable, ...
    node_p_variable );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  As computed by NS_ADJ_COUNT,\n' );
  fprintf ( 1, '  Number of variable adjacency entries is %d\n', adj_num );
%
%  Get the count of the variable adjacencies and the COL vector.
%
  [ adj_num, adj_col ] = ns_adj_col_set ( node_num, triangle_num, ...
    variable_num, triangle_node, triangle_neighbor, node_u_variable, ...
    node_v_variable, node_p_variable );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  As computed by NS_ADJ_COL_SET,\n' );
  fprintf ( 1, '  Number of variable adjacency entries is %d\n', adj_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variable adjacency pointers:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variable     First      Last    Number\n' );
  fprintf ( 1, '\n' );

  for variable = 1 : variable_num

    num = adj_col(variable+1) - adj_col(variable);

    fprintf ( 1, '  %8d  %8d  %8d  %8d\n', ...
      variable, adj_col(variable), adj_col(variable+1)-1, num );

  end
%
%  Get the variable adjacencies.
%
  adj_row = ns_adj_row_set ( node_num, triangle_num, variable_num, ...
    triangle_node, triangle_neighbor, node_u_variable, node_v_variable, ...
    node_p_variable, adj_num, adj_col );
%
%  This is a huge array.  We only print out the beginning and end.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Variable adjacency row entries:\n' );
  fprintf ( 1, '  (Partial printout only)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Entry     Row       Col\n' );
  fprintf ( 1, '\n' );

  for variable = 1 : variable_num

    rlo = adj_col(variable);
    rhi = adj_col(variable+1)-1;

    if ( variable <= 3 | variable_num - 3 <= variable )

      fprintf ( 1, '\n' );

      for r = rlo : rhi
        fprintf ( 1, '  %8d  %8d  %8d\n', r, adj_row(r), variable );
      end

    end

    if ( variable == 3 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  (SKIPPING MANY MANY ENTRIES...)\n' );
      fprintf ( 1, '\n' );
    end

  end

  return
end
