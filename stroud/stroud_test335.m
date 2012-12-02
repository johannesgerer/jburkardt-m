function stroud_test335 ( )

%*****************************************************************************80
%
%% TEST335 tests SPHERE_SHELL_03_ND.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST335\n' );
  fprintf ( 1, '  For integrals inside a spherical shell in ND:\n' );
  fprintf ( 1, '  SPHERE_SHELL_03_ND approximates the integral.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We compare these results with those computed by\n' );
  fprintf ( 1, '  from the difference of two ball integrals:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  BALL_F1_ND approximates the integral;\n' );
  fprintf ( 1, '  BALL_F3_ND approximates the integral.\n' );
  fprintf ( 1, '\n' );

  for j = 1 : 2

    if ( j == 1 )
      r1 = 0.0;
      r2 = 1.0;
      xc(1:n_max) = 0.0;
    else
      r1 = 2.0;
      r2 = 3.0;
      xc(1:n_max) = [ 1.0, -1.0, 2.0 ];
    end

    for n = 2 : n_max

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Spatial dimension N = %d\n', n );
      fprintf ( 1, '  Sphere center:\n' );
      for i = 1 : n
        fprintf ( 1, '  %12f', xc(i) );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Inner sphere radius = %f\n', r1 );
      fprintf ( 1, '  Outer sphere radius = %f\n', r2 );
      fprintf ( 1, '  Spherical shell volume = %f\n', ...
        sphere_shell_volume_nd ( n, r1, r2 ) );
      fprintf ( 1, '\n' );
      fprintf ( 1, '\n' );
      fprintf ( 1, '    Rule:      #3       F1(R2)-F1(R1)  F3(R2)-F3(R1)\n' );
      fprintf ( 1, '    F(X)\n' );
      fprintf ( 1, '\n' );

      for i = 1 : num

        FUNC_ND_INDEX = i;

        result1 = sphere_shell_03_nd ( 'function_nd', n, xc, r1, r2 );

        result3 = ball_f1_nd ( 'function_nd', n, xc, r1 );
        result4 = ball_f1_nd ( 'function_nd', n, xc, r2 );
      
        result5 = ball_f3_nd ( 'function_nd', n, xc, r1 );
        result6 = ball_f3_nd ( 'function_nd', n, xc, r2 );

        fname = function_nd_name ( i );

        fprintf ( 1, '  %s  %12f  %12f  %12f\n', ...
          fname, result1, result4-result3, result6-result5 );

      end

    end

  end

  return
end
