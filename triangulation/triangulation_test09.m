function triangulation_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests TRIANGLE_ORDER3_PHYSICAL_TO_REFERENCE, TRIANGLE_ORDER3_REFERENCE_TO_PHYSICAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 December 2006
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  t = [ ...
    1.0, 1.0; ...
    3.0, 1.0; ...
    2.0, 5.0 ]';

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  For an order 3 triangle,\n' );
  fprintf ( 1, '  TRIANGLE_ORDER3_PHYSICAL_TO_REFERENCE\n' );
  fprintf ( 1, '    maps a physical point to a reference point.\n' );
  fprintf ( 1, '  TRIANGLE_ORDER3_REFERENCE_TO_PHYSICAL\n' );
  fprintf ( 1, '    maps a reference point to a physical point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   (  XSI    ETA ) ==> ( X      Y  ) ==> ( XSI2    ETA2 )\n' );
  fprintf ( 1, '\n' );

  [ ref(1:2,1:n), seed ] = triangle_reference_sample ( n, seed );

  phy = triangle_order3_reference_to_physical ( t, n, ref );

  ref2 = triangle_order3_physical_to_reference ( t, n, phy );

  for j = 1 : n

    fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', ...
      ref(1:2,j), phy(1:2,j), ref2(1:2,j) );

  end

  return
end
