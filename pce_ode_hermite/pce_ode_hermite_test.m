function pce_ode_hermite_test ( )

%*****************************************************************************80
%
%% PCE_ODE_HERMITE_TEST tests PCE_ODE_HERMITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PCE_ODE_HERMITE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test PCE_ODE_HERMITE.\n' );

  pce_ode_hermite_test01 ( );
  pce_ode_hermite_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PCE_ODE_HERMITE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
