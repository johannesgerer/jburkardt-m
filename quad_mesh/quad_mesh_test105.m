function quad_mesh_test105 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST105 tests SAMPLE_Q4__MESH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST105\n' );
  fprintf ( 1, '  SAMPLE_Q4_MESH returns uniform sample points from\n' );
  fprintf ( 1, '  a Q4 mesh.\n' );

  [ node_num, element_num, hole_num ] = example1_q4_mesh_size ( );

  [ node_xy, element_node, element_neighbor ] = example1_q4_mesh ( node_num, ...
    element_num );

  sample_num = 20;

  seed = 123456789;

  [ sample_xy, sample_element, seed ] = sample_q4_mesh ( node_num, node_xy, ...
    element_num, element_node, sample_num, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '             X        Y     Element\n' );
  fprintf ( 1, '\n' );

  for sample = 1 : sample_num

    fprintf ( 1, '  %8d  %8f  %8f  %8d\n', ...
      sample, sample_xy(1:2,sample), sample_element(sample) );

  end

  return
end
