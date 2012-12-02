function rkf45_test04 ( )

%*****************************************************************************80
%
%% RKF45_TEST04 solves a scalar ODE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 June 2006
%
%  Author:
%
%    John Burkardt
%
  neqn = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RKF45_TEST04\n' );
  fprintf ( 1, '  Solve a scalar equation using R8_RKF45:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y'' = 0.25 * Y * ( 1 - Y / 20 )\n' );

  abserr = sqrt ( eps );
  relerr = sqrt ( eps );

  flag = 1;

  t_start = 0.0;
  t_stop = 20.0;

  n_step = 5;

  t_out = 0.0;
  t = t_out;
  y = [ 1.0 ];
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

    [ y, yp, t, flag ] = r8_rkf45 ( @r8_f1, neqn, y, yp, t, t_out, relerr, ...
      abserr, flag );

    fprintf ( 1, '%4d  %12f  %12f  %12f  %12f  %12e\n', ...
      flag, t, y(1), yp(1), r8_y1x ( t ), y(1) - r8_y1x ( t ) );
  end

  return
end
