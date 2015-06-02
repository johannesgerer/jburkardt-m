function nsm3d_test01 ( prefix )

%*****************************************************************************80
%
%% NSM3D_TEST01 examines a mesh from the NAVIER_STOKES_MESH3D data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 May 2013
%
%  Author:
%
%    John Burkardt
%
  mesh_filename = sprintf ( '%s.mat', prefix );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NSM3D_TEST01:\n' );
  fprintf ( 1, '  "%s"\n', mesh_filename );

  [ nodeco, elnode, bdynde ] = mesh3d_extract ( mesh_filename );
%
%  NODECO has an unused 4th dimension.  Suppress it.
%
  nodeco = nodeco(:,1:3);
  [ node_num, node_dim ] = size ( nodeco );
  [ element_num, element_order ] = size ( elnode );
  [ bdynde_num, ~ ] = size ( bdynde );

  fprintf ( 1, '  NODECO = %d nodes x %d spatial dimensions,\n', ...
    node_num, node_dim );
  fprintf ( 1, '  ELNODE = %d elements x %d nodes per element,\n', ...
    element_num, element_order );
  fprintf ( 1, '  BDYNDE = %d boundary nodes\n', bdynde_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Dim       Min          Max\n' );
  fprintf ( 1, '\n' );
  for j = 1 : node_dim
    xmin = min ( nodeco(:,j) );
    xmax = max ( nodeco(:,j) );
    fprintf ( 1, '  %d  %12f  %12f\n', j, xmin, xmax );
  end
%
%  Write the nodes to a file.
%
  node_filename = sprintf ( '%s_nodes.txt', prefix );
  nodeco = nodeco';
  r8mat_write ( node_filename, node_dim, node_num, nodeco );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the node file "%s".\n', node_filename );

  element_filename = sprintf ( '%s_elements.txt', prefix );
  elnode = elnode';
  i4mat_write ( element_filename, element_order, element_num, elnode );
  fprintf ( 1, '  Created the element file "%s".\n', element_filename );

  return
end

