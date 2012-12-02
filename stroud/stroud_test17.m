function stroud_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests CONE_UNIT_3D, CONE_VOLUME_3D.
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

  r = 1.0E+00
  h = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  CONE_UNIT_3D approximates integrals in a unit cone.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', cone_volume_3d ( r, h ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    F(X)    CONE_3D\n' );
  fprintf ( 1, '\n' );

  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    result = cone_unit_3d ( 'function_3d' );

    fname = function_3d_name ( i );

    fprintf ( 1, '  %s  %12f\n', fname, result );

  end

  return
end
