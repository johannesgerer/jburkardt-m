function high_card_simulation_test ( )

%*****************************************************************************80
%
%% HIGH_CARD_SIMULATION_TEST tests the HIGH_CARD_SIMULATION library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_SIMULATION_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the HIGH_CARD_SIMULATION library.\n' );

  high_card_simulation_test01 ( );
  high_card_simulation_test02 ( );
  high_card_simulation_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_SIMULATION_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



