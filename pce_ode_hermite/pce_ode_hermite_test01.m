function pce_ode_hermite_test01 ( )

%*****************************************************************************80
%
%% PCE_ODE_HERMITE_TEST01 runs a test problem with PCE_ODE_HERMITE.
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
  fprintf ( 1, 'PCE_ODE_HERMITE_TEST01:\n' );
  fprintf ( 1, '  Call PCE_ODE_HERMITE to compute a polynomial chaos expansion\n' );
  fprintf ( 1, '  for the ODE:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    u'' = - alpha * u,\n' );
  fprintf ( 1, '    u(0) = 1.\n' );

  ti = 0.0;
  tf = 2.0;
  nt = 200;
  ui = 1.0;
  np = 4;
  alpha_mu = 0.0;
  alpha_sigma = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial time         TI = %g\n', ti );
  fprintf ( 1, '  Final time           TF = %g\n', tf );
  fprintf ( 1, '  Number of time steps NT = %d\n', nt );
  fprintf ( 1, '  Initial condition    UI = %g\n', ui );
  fprintf ( 1, '  Expansion degree     NP = %d\n', np );
  fprintf ( 1, '  E(ALPHA)       ALPHA_MU = %g\n', alpha_mu );
  fprintf ( 1, '  STD(ALPHA)  ALPHA_SIGMA = %g\n', alpha_sigma );

  [ t, u ] = pce_ode_hermite ( ti, tf, nt, ui, np, alpha_mu, alpha_sigma );
%
%  Evaluate the exact expected value function.
%
  uex = ui * exp ( t.^2 / 2 );
%
%  Compare the first computed component against the exact expected value.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, ' i  T(i)  E(U(T(i)))    U(T(i),0)\n' );
  fprintf ( 1, '\n' );
  for i = 0 : 10 : nt
    fprintf ( 1, '  %4d  %6.3f  %14.6g  %14.6g  %14.6g\n', ...
      i, t(i+1), uex(i+1), u(i+1,1), abs ( uex(i+1) - u(i+1,1) ) );
  end
%
%  Plot the first computed component against the exact expected value function.
%
  figure ( 1 )
  plot ( t, u(:,1), t, uex )
  grid on
  xlabel ( '<--- T --->' )
  ylabel ( '<--- U --->' )
  title ( 'PCE Expected Value Versus Exact Expected Value' )

  filename = 'expected_value_plot.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected value comparison plotted in "%s".\n', filename );

  return
end
