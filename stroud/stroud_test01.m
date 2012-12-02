function stroud_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests BALL_F1_ND, BALL_F3_ND.
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
  num = function_nd_num ( );

  xc = [ 1.0, -1.0, 2.0 ];
  r = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  For integrals in a ball in ND:\n' );
  fprintf ( 1, '  BALL_F1_ND approximates the integral;\n' );
  fprintf ( 1, '  BALL_F3_ND approximates the integral.\n' );
  fprintf ( 1, '\n' );

  for n = 2 : n_max

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Spatial dimension N = %d\n', n );
    fprintf ( 1, '  Ball center:\n' );
    for i = 1 : n
      fprintf ( 1, '%12f  ', xc(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Ball radius = %f\n', r );
    fprintf ( 1, '  Ball volume = %f\n', ball_volume_nd ( n, r ) );
    fprintf ( 1, '\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Rule:      F1          F3\n' );
    fprintf ( 1, '    F(X)\n' );
    fprintf ( 1, '\n' );

    for i = 1 : num

      FUNC_ND_INDEX = i;

      result1 = ball_f1_nd ( 'function_nd', n, xc, r );
      result2 = ball_f3_nd ( 'function_nd', n, xc, r );

      fname = function_nd_name ( i );

      fprintf ( 1, '  %7s  %12f  %12f\n', fname, result1, result2 );

    end

  end

  return
end
