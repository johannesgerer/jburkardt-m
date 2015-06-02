function quad_mesh_display_test ( )

%*****************************************************************************80
%
%% QUAD_SURFACE_DISPLAY_TEST tests the QUAD_SURFACE_DISPLAY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_SURFACE_DISPLAY_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the QUAD_SURFACE_DISPLAY library,\n' );
  fprintf ( 1, '  which can plot a 3D surface defined by a quadrilateral mesh.\n' );

  node_xy = load ( 'node_xy.txt' )';
  quad_node = load ( 'quad_node.txt' )';
  value_xy = load ( 'value_xy.txt' );

  node_num = size ( node_xy, 2 );
  quad_num = size ( quad_node, 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', node_num );
  fprintf ( 1, '  Number of quadrilaterals = %d\n', quad_num );

  quad_surface_display ( node_num, node_xy, quad_num, quad_node, value_xy );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_SURFACE_DISPLAY_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
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
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
