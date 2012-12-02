function gr_test07 ( node_num, node_coordinates, edge_num, edge_nodes );

%*****************************************************************************80
%
%% GR_TEST07 tests GR_INCIDENCE_MATRIX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 January 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GR_TEST07:\n' );
  fprintf ( 1, '  GR_INCIDENCE_MATRIX computes the incidence matrix.\n' );

  incidence_matrix = gr_incidence_matrix ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  i4mat_print ( edge_num, node_num, incidence_matrix, ...
    '  The incidence matrix:' );

  return
end
