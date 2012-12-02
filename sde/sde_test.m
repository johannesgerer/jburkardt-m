function sde_test ( )

%*****************************************************************************80
%
%% SDE_TEST test the SDE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SDE_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SDE library.\n' );

  seed = 123456789;

  bpath ( seed );
  bpath_vectorized ( seed );
  bpath_average (seed );

  chain ( seed );

  em ( seed );
  emstrong ( seed );

  method = 0;
  emweak ( seed, method );
  
  method = 1;
  emweak ( seed, method );

  milstrong ( seed );

  stab_asymptotic ( seed );
  stab_meansquare ( seed );

  stochastic_integral_ito_test ( );
  stochastic_integral_strat_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SDE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
