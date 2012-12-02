function tet_mesh_test002 ( )

%*****************************************************************************80
%
%% TET_MESH_TEST002 tests TETRAHEDRON_ORDER4_PHYSICAL_TO_REFERENCE, TETRAHEDRON_ORDER4_REFERENCE_TO_PHYSICAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2006
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  t = [ ...
    5.0, 0.0, 0.0; ...
    8.0, 0.0, 0.0; ...
    5.0, 2.0, 0.0; ...
    6.0, 1.0, 2.0 ]';

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TET_MESH_TEST002\n' );
  fprintf ( 1, '  For an order 4 tetrahedron,\n' );
  fprintf ( 1, '  TETRAHEDRON_ORDER4_PHYSICAL_TO_REFERENCE\n' );
  fprintf ( 1, '    maps a physical point to a reference point.\n' );
  fprintf ( 1, '  TETRAHEDRON_ORDER4_REFERENCE_TO_PHYSICAL \n' );
  fprintf ( 1, '    maps a reference point to a physical point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '     ( R, S, T )          ==>  ( X, Y, Z )           ==> ( R2, S2, T2 )\n' );
  fprintf ( 1, '\n' );

  [ ref, seed ] = tetrahedron_reference_sample ( n, seed );

  phy = tetrahedron_order4_reference_to_physical ( t, n, ref );
  ref2 = tetrahedron_order4_physical_to_reference ( t, n, phy );

  for j = 1 : n

    fprintf ( 1, '  %8f  %8f  %8f    %8f  %8f  %8f    %8f  %8f  %8f\n', ...
      ref(1:3,j), phy(1:3,j), ref2(1:3,j) );

  end

  return
end
