function stroud_test25 ( )

%*****************************************************************************80
%
%% TEST25 tests PYRAMID_UNIT_0**3D, PYRAMID_UNIT_VOLUME_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_3D_INDEX;

  order = [ 1, 5, 6, 8, 8, 9, 13, 18, 27, 48 ];
  rule_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST25\n' );
  fprintf ( 1, '  For the unit pyramid, we approximate integrals with:\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O01_3D, a 1 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O05_3D, a 5 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O06_3D, a 6 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O08_3D, an 8 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O08b_3D, an 8 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O09_3D, a 9 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O13_3D, a 13 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O18_3D, a 18 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O27_3D, a 27 point rule.\n' );
  fprintf ( 1, '  PYRAMID_UNIT_O48_3D, a 48 point rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PYRAMID_UNIT_VOLUME_3D computes the volume of a unit pyramid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', pyramid_unit_volume_3d ( ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    F(X)    PYRAMID_3D\n' );
  fprintf ( 1, '\n' );

  num = function_3d_num ( );

  for jlo = 1 : 5 : num

    jhi = min ( jlo + 4, function_3d_num );

    fprintf ( 1, '  Order' );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      fname = function_3d_name ( j );
      fprintf ( 1, '   %s    ', fname );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(1) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o01_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(2) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o05_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(3) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o06_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(4) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o08_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(5) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o08b_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(6) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o09_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(7) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o13_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(8) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o18_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(9) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o27_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '  %5d', order(10) );
    for j = jlo : jhi
      FUNC_3D_INDEX = j;
      result = pyramid_unit_o48_3d ( 'function_3d' );
      fprintf ( 1, '%14.6e', result );
    end
    fprintf ( 1, '\n' );

    fprintf ( 1, '\n' );

  end

  return
end

