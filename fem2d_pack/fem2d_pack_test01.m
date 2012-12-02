function fem2d_pack_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests BANDWIDTH_MESH.
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  BANDWIDTH_MESH computes the geometric bandwidth:\n' );
  fprintf ( 1, '  of a finite element mesh.\n' );

  nelemx = 2;
  nelemy = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NELEMX = %d\n', nelemx );
  fprintf ( 1, '  NELEMY = %d\n', nelemy );

  element_order = 6;
  element_num = grid_element_num ( 'T6', nelemx, nelemy );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ELEMENT_ORDER = %d\n', element_order );
  fprintf ( 1, '  ELEMENT_NUM   = %d\n', element_num );

  element_node = grid_t6_element ( nelemx, nelemy );

  grid_print ( element_order, element_num, element_node );

  [ ml, mu, m ] = bandwidth_mesh ( element_order, element_num, ...
    element_node );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Lower bandwidth ML = %d\n', ml );
  fprintf ( 1, '  Upper bandwidth MU = %d\n', mu );
  fprintf ( 1, '  Total bandwidth M  = %d\n', m );

  return
end

