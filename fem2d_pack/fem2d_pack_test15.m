function fem2d_pack_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests PHYSICAL_TO_REFERENCE_T3, REFERENCE_TO_PHYSICAL_T3.
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
  t = [ ...
    1.0, 1.0; ...
    3.0, 1.0; ...
    2.0, 5.0 ]';
  seed = 123456789;
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  For an order 3 triangle,\n' );
  fprintf ( 1, '  PHYSICAL_TO_REFERENCE_T3 maps a physical point to\n' );
  fprintf ( 1, '    a reference point.\n' );
  fprintf ( 1, '  REFERENCE_TO_PHYSICAL_T3 maps a reference point to\n' );
  fprintf ( 1, '    a physical point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      XSI       ETA  ==>  X         Y    ==>  XSI      ETA\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    for i = 1 : 2
      [ ref(i,j), seed ] = r8_uniform_01 ( seed );
    end
    if ( 1.0 < sum ( ref(1:2,j) ) )
      ref(1:2,j) = 1.0 - ref(1:2,j);
    end
  end 

  phy = reference_to_physical_t3 ( t, n, ref );
  ref2 = physical_to_reference_t3 ( t, n, phy );

  for j = 1 : n
    fprintf ( 1, '  %8f  %8f  %8f  %8f  %8f  %8f\n', ...
      ref(1:2,j), phy(1:2,j), ref2(1:2,j) );
  end

  return
end
