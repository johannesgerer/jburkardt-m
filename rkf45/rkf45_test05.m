function rkf45_test05 ( )

%*****************************************************************************80
%
%% RKF45_TEST05 solves a vector ODE.
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
  neqn = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'RKF45_TEST05\n' );
  fprintf ( 1, '  Solve a vector equation using R8_RKF45\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y''(1) =  Y(2)\n' );
  fprintf ( 1, '  Y''(2) = -Y(1)\n' );

  abserr = sqrt ( eps );
  relerr = sqrt ( eps );

  flag = 1;

  t_start = 0.0;
  t_stop = 2.0 * 3.14159265;

  n_step = 12;

  t = 0.0;
  t_out = 0.0;

  y(1) = 1.0;
  y(2) = 0.0;
  yp = r8_f2 ( t, y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  FLAG       T          Y(1)          Y(2)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '%4d  %12f  %12f  %12f\n', flag, t, y(1), y(2) );

  for i_step = 1 : n_step

    t = ( ( n_step - i_step + 1 ) * t_start ...
        + (          i_step - 1 ) * t_stop ) ...
        / ( n_step              );

    t_out = ( ( n_step - i_step ) * t_start ...
            + (          i_step ) * t_stop ) ...
            / ( n_step          );

    [ y, yp, t, flag ] = r8_rkf45 ( @r8_f2, neqn, y, yp, t, t_out, relerr, ...
      abserr, flag );

    fprintf ( 1, '%4d  %12f  %12f  %12f\n', flag, t, y(1), y(2) );

  end

  return
end
