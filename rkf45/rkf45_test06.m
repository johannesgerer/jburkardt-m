function rkf45_test06 ( )

%*****************************************************************************80
%
%% RKF45_TEST06 solves a scalar ODE and uses one-step integration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 August 2010
%
%  Author:
%
%    John Burkardt
%
  neqn = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RKF45_TEST06\n' );
  fprintf ( 1, '  Solve a scalar equation using R8_RKF45\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y'' = 0.25 * Y * ( 1 - Y / 20 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the special SINGLE_STEP mode\n' );
  fprintf ( 1, '  which returns after every step.\n' );

  abserr = sqrt ( eps );
  relerr = sqrt ( eps );

  flag = -1;

  t_start = 0.0;
  t_stop = 20.0;

  n_step = 5;

  t = 0.0;
  t_out = 0.0;
  y(1) = 1.0;
  yp = r8_f1 ( t, y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  FLAG     T             Y            ' );
  fprintf ( 1, 'Y''           Y_Exact         Error\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '%4d  %12f  %12f  %12f  %12f  %12e\n', ...
    flag, t, y(1), yp(1), r8_y1x ( t ), y(1) - r8_y1x ( t ) );

  for i_step = 1 : n_step

    t = ( ( n_step - i_step + 1 ) * t_start  ...
        + (          i_step - 1 ) * t_stop ) ...
        / ( n_step              );

    t_out = ( ( n_step - i_step ) * t_start  ...
            + (          i_step ) * t_stop ) ...
            / ( n_step          );
%
%  As long as FLAG is negative, we are heading towards T_OUT, but
%  have not reached it.
%
    while ( flag < 0 )

      [ y, yp, t, flag ] = r8_rkf45 ( @r8_f1, neqn, y, yp, t, t_out, relerr, ...
        abserr, flag );

      fprintf ( 1, '%4d  %12f  %12f  %12f  %12f  %12e\n', ...
        flag, t, y(1), yp(1), r8_y1x ( t ), y(1) - r8_y1x ( t ) );

    end
%
%  FLAG is returned as +2 when we reach T_OUT.  Reset it to -2
%  to continue to the next T_OUT in one step mode.
%
    flag = -2;

  end

  return
end
