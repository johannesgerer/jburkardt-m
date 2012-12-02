function gr_test05 ( node_num, node_coordinates, edge_num, edge_nodes );

%*****************************************************************************80
%
%% GR_TEST05 tests GR_DEGREE.
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
  fprintf ( 1, 'GR_TEST05:\n' );
  fprintf ( 1, '  GR_DEGREE computes the node degrees.\n' );

  degree = gr_degree ( node_num, node_coordinates, ...
    edge_num, edge_nodes );

  i4vec_print ( node_num, degree, '  The degrees:' );

  return
end
