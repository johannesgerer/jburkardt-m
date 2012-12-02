function pce_ode_hermite_test02 ( )

%*****************************************************************************80
%
%% PCE_ODE_HERMITE_TEST02 looks at convergence behavior for a fixed time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PCE_ODE_HERMITE_TEST02:\n' );
  fprintf ( 1, '  Examine convergence behavior as the PCE degree increases:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    u'' = - alpha * u,\n' );
  fprintf ( 1, '    u(0) = 1.\n' );

  ti = 0.0;
  tf = 2.0;
  nt = 2000;
  ui = 1.0;
  alpha_mu = 0.0;
  alpha_sigma = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial time         TI = %g\n', ti );
  fprintf ( 1, '  Final time           TF = %g\n', tf );
  fprintf ( 1, '  Number of time steps NT = %d\n', nt );
  fprintf ( 1, '  Initial condition    UI = %g\n', ui );
  fprintf ( 1, '  E(ALPHA)       ALPHA_MU = %g\n', alpha_mu );
  fprintf ( 1, '  STD(ALPHA)  ALPHA_SIGMA = %g\n', alpha_sigma );

  p = 0 : 5;
  ep = zeros ( 6, 1 );
  uexf = ui * exp ( tf.^2 / 2 );

  for np = 0 : 5

    [ t, u ] = pce_ode_hermite ( ti, tf, nt, ui, np, alpha_mu, alpha_sigma );
    ep(np+1) = abs ( uexf - u(nt+1,1) );

  end
%
%  Print error in expected value as a function of the PCE degree.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '    NP     Error(NP)     Log(Error(NP))\n' );
  fprintf ( 1, '\n' );
  for np = 0 : 5
    fprintf ( 1, '  %4d  %14.6g  %14.6g\n', np, ep(np+1), log ( ep(np+1) ) );
  end
%
%  Plot error in expected value as a function of the PCE degree.
%
  figure ( 2 )
  plot ( p, log ( ep ), 'bo-', 'Linewidth', 2, 'Markersize', 10 )
  grid on
  xlabel ( '<--- Degree --->' )
  ylabel ( '<--- Log(Error) --->' )
  title ( 'Convergence of expected value at T = 2, as a function of degree' )

  filename = 'convergence_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Convergence plotted in "%s".\n', filename );

  return
end
