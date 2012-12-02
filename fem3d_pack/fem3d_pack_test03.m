function fempack_test03 ( )

%*****************************************************************************80
%
%% FEMPACK_TEST03 tests PHYSICAL_TO_REFERENCE_TET4 and REFERENCE_TO_PHYSICAL_TET4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 August 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  t = [ ...
    1.0,  2.0,  3.0; ...
    4.0,  1.0,  2.0; ...
    2.0,  4.0,  4.0; ...
    3.0,  2.0,  5.0 ]';

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEMPACK_TEST03\n' );
  fprintf ( 1, '  For an order 4 tetrahedron,\n' );
  fprintf ( 1, '  PHYSICAL_TO_REFERENCE_TET4 maps a physical point to\n' );
  fprintf ( 1, '    a reference point.\n' );
  fprintf ( 1, '  REFERENCE_TO_PHYSICAL_TET4 maps a reference point to\n' );
  fprintf ( 1, '    a physical point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ( R       S       T ) ==> ( X       Y       Z ) ' );
  fprintf ( 1, '==> ( R2      S2      T2 )\n' );
  fprintf ( 1, '\n' );

  [ ref, seed ] = reference_tet4_uniform ( n, seed );

  phy = reference_to_physical_tet4 ( t, n, ref );
  ref2 = physical_to_reference_tet4 ( t, n, phy );

  for j = 1 : n

    fprintf ( 1, '  %8.4f%8.4f%8.4f  %8.4f%8.4f%8.4f  %8.4f%8.4f%8.4f\n', ...
      ref(1:3,j), phy(1:3,j), ref2(1:3,j) );
  end

  return
end
