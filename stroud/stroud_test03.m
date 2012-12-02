function stroud_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests BALL_UNIT_07_3D, BALL_UNIT_14_3D, BALL_UNIT_15_3D.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  For integrals in the unit ball in 3D:\n' );
  fprintf ( 1, '  BALL_UNIT_07_3D uses a formula of degree 7;\n' );
  fprintf ( 1, '  BALL_UNIT_14_3D uses a formula of degree 14;\n' );
  fprintf ( 1, '  BALL_UNIT_15_3D uses a formula of degree 15.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Unit ball volume = %f\n', ball_unit_volume_nd ( 3 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Rule:      #7             #14           #15\n' );
  fprintf ( 1, '    F(X)\n' );
  fprintf ( 1, '\n' );

  num = function_3d_num ( );

  for i = 1 : num

    FUNC_3D_INDEX = i;

    result1 = ball_unit_07_3d ( 'function_3d' );
    result2 = ball_unit_14_3d ( 'function_3d' );
    result3 = ball_unit_15_3d ( 'function_3d' );

    fname = function_3d_name ( i );

    fprintf ( 1, '  %7s  %12f  %12f  %12f\n', ...
      fname, result1, result2, result3 );

  end

  return
end
