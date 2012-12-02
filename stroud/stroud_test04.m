function stroud_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests BALL_UNIT_F1_ND, BALL_UNIT_F3_ND.
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
  global FUNC_ND_INDEX;

  n_max = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  For integrals inside the unit ball in ND:\n' );
  fprintf ( 1, '  BALL_UNIT_F1_ND approximates the integral;\n' );
  fprintf ( 1, '  BALL_UNIT_F3_ND approximates the integral.\n' );
  fprintf ( 1, '\n' );

  for n = 2 : n_max

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1, '  Unit ball volume = %f\n', ball_unit_volume_nd ( n ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Rule:      F1          F3\n' );
    fprintf ( 1, '    F(X)\n' );
    fprintf ( 1, '\n' );

    for i = 1 : 12

      FUNC_ND_INDEX = i;

      result1 = ball_unit_f1_nd ( 'function_nd', n );
      result2 = ball_unit_f3_nd ( 'function_nd', n );

      fname = function_nd_name ( i );

      fprintf ( 1, '  %7s  %12f  %12f\n', fname, result1, result2 );

    end

  end

  return
end
