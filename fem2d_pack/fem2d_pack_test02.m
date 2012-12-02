function fem2d_pack_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests BANDWIDTH_VAR, NS_T6_VAR_COUNT, NS_T6_VAR_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  For the Navier Stokes variables associated with\n' );
  fprintf ( 1, '  a mesh of T6 elements,\n' );
  fprintf ( 1, '  NS_T6_VAR_COUNT counts variables,\n' );
  fprintf ( 1, '  NS_T6_VAR_SET sets them,\n' );
  fprintf ( 1, '  BANDWIDTH_VAR computes the variable bandwidth.\n' );

  nelemx = 2;
  nelemy = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NELEMX = %d\n', nelemx );
  fprintf ( 1, '  NELEMY = %d\n', nelemy );

  element_order = 6;
  element_num = grid_element_num ( 'T6', nelemx, nelemy );
  node_num = grid_node_num ( 'T6', nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ELEMENT_ORDER = %d\n', element_order );
  fprintf ( 1, '  ELEMENT_NUM   = %d\n', element_num );
  fprintf ( 1, '  NODE_NUM      = %d\n', node_num );

  element_node = grid_t6_element ( nelemx, nelemy );

  grid_print ( element_order, element_num, element_node )

  [ var_node, var_num ] = ns_t6_var_count ( element_num, element_node, ...
    node_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of variables VAR_NUM = %d\n', var_num );

  i4vec_print ( node_num+1, var_node, '  VAR_NODE pointer vector:' );

  var = ns_t6_var_set ( element_num, element_node, node_num, var_node, ...
    var_num )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Node    U_Var    V_Var    P_Var\n' );
  fprintf ( 1, '\n' );

  for node = 1 : node_num

    ilo = var_node(node);
    ihi = var_node(node+1)-1;

    fprintf ( 1, '  %8d    ', node );
    for i = ilo : ihi
      fprintf ( 1, '  %8d', var(i) );
    end
    fprintf ( 1, '\n' );

  end

  [ ml, mu, m ] = bandwidth_var ( element_order, element_num, ...
    element_node, node_num, var_node, var_num, var );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
  fprintf ( 1, '  Total bandwidth M  = %d\n', m  );

  return
end
