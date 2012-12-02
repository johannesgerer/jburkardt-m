function bti_test03 ( )

%*****************************************************************************80
%
%% BTI_TEST03 tests BURGERS_TIME_INVISCID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BTI_TEST03\n' );
  fprintf ( 1, '  Test BURGERS_TIME_INVISCID\n' );

  method = 3;
  nx = 81;
  nt = 200;
  t_max = 2.0;
  bc = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Method: 3, Lax Friedrichs.\n' );
  fprintf ( 1, '  Initial condition: expansion\n' );
  fprintf ( 1, '  Number of space nodes = %d\n', nx );
  fprintf ( 1, '  Number of time steps = %d\n', nt );
  fprintf ( 1, '  Final time T_MAX = %g\n', t_max );
  fprintf ( 1, '  Boundary condition = %d\n', bc );

  U = burgers_time_inviscid ( method, @ic_expansion, nx, nt, t_max, bc );

  x = linspace ( -1.0, +1.0, nx );

  figure ( 3 )

  plot ( x, U(1:50:(nt+1),:), 'Linewidth', 3 )
  grid on
  xlabel ( '<-- X -->' )
  ylabel ( '<-- U(X,T) -->' )
  title ( 'Burgers, inviscid, initial expansion, Lax Friedrichs' )

  filename = 'bti_test03.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saved plot as "%s"\n', filename );

  return
end
