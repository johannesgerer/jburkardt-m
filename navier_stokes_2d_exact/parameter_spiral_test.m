function parameter_spiral_test ( )

%*****************************************************************************80
%
%% PARAMETER_SPIRAL_TEST monitors solution norms for various values of NU, RHO.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/parameter_spiral_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PARAMETER_SPIRAL_TEST\n' );
  fprintf ( 1, '  Spiral Flow:\n' );
  fprintf ( 1, '  Monitor solution norms over time for various\n' );
  fprintf ( 1, '  values of NU, RHO.\n' );

  n = 1000;
  xy_lo = 0.0;
  xy_hi = 1.0;
  seed = 123456789;
  [ x, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
%
%  Vary RHO.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  RHO affects the pressure scaling.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     RHO         NU           T     ||U||       ||V||       ||P||\n' );
  fprintf ( 1, '\n' );

  nu = 1.0;
  rho = 1.0;

  for j = 1 : 3

    for k = 0 : 5

      t = k / 5.0;

      [ u, v, p ] = uvp_spiral ( nu, rho, n, x, y, t );

      u_norm = norm ( u ) / n;
      v_norm = norm ( v ) / n;
      p_norm = norm ( p ) / n;

      fprintf ( 1, '  %10.4g  %10.4g  %8.4f  %10.4g  %10.4g  %10.4g\n', ...
        rho, nu, t, u_norm, v_norm, p_norm );

    end

    fprintf ( 1, '\n' );
    rho = rho / 100.0;

  end
%
%  Vary NU.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  NU affects the time scaling.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     RHO         NU           T     ||U||       ||V||       ||P||\n' );
  fprintf ( 1, '\n' );

  nu = 1.0;
  rho = 1.0;
  
  for i = 1 : 4

    for k = 0 : 5

      t = k / 5.0;

      [ u, v, p ] = uvp_spiral ( nu, rho, n, x, y, t );

      u_norm = norm ( u ) / n;
      v_norm = norm ( v ) / n;
      p_norm = norm ( p ) / n;

      fprintf ( 1, '  %10.4g  %10.4g  %8.4f  %10.4g  %10.4g  %10.4g\n', ...
        rho, nu, t, u_norm, v_norm, p_norm );

    end

    fprintf ( 1, '\n' );

    nu = nu / 10.0;

  end

  return
end
