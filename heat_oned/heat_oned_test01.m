function heat_oned_test01 ( )

%*****************************************************************************80
%
%% HEAT_ONED_TEST01 runs Jeff Borggaard's test case.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HEAT_ONED_TEST01:\n' );
  fprintf ( 1, '  Run Jeff Borggaard''s test case.\n' );
%
%  Set up the problem.
%
  mu = 0.1;
  h = 100.0;
  rho = 40.0;
  degree = 2;
  xa = 0.0;
  xb = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Viscosity parameter MU = %g\n', mu );
  fprintf ( 1, '  Heat transfer coefficient H = %g\n', h );
  fprintf ( 1, '  Mesh density RHO = %g\n', rho );
  fprintf ( 1, '  Requesting finite elements of degree %d\n', degree );
  fprintf ( 1, '  Spatial interval is [%g,%g].\n', xa, xb ); 

  [ A, B, M, n_nodes, x ] = heat_oned_setup ( mu, h, rho, degree, xa, xb );
%
%  Compute the solution over time.
%
  t_initial = 0.0;
  t_step    = 0.001;
  t_save    = 0.01;
  t_final   = 5.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial time =   %g\n', t_initial );
  fprintf ( 1, '  Final time =     %g\n', t_final );
  fprintf ( 1, '  Time step =      %g\n', t_step );
  fprintf ( 1, '  Data save step = %g\n', t_save );

  w_save = heat_oned ( A, B, M, n_nodes, x, t_initial, t_final, t_step, t_save );
%
%  Plot the results.
%
  t_plot = [ t_initial : t_save : t_final ];

  figure ( 1 )
  mesh ( t_plot, x, w_save )
  xlabel ( '<---Time--->' )
  ylabel ( '<---X--->' )
  zlabel ( '<--U(X,T)-->' )
  title ( 'U(X,T) as computed by HEAT\_ONED' )

  filename = 'heat_oned_test01.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Plot saved as "%s".\n', filename );

  return
end
