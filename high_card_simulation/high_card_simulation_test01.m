function high_card_simulation_test01 ( )

%*****************************************************************************80
%
%% HIGH_CARD_SIMULATION_TEST01 varies the skip number.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2012
%
%  Author:
%
%    John Burkardt
%
  deck_size = 100;
  trial_num = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_SIMULATION_TEST01\n' );
  fprintf ( 1, '  Using %d cards and %d trials, estimate the chances of\n', deck_size, trial_num );
  fprintf ( 1, '  picking the high card by skipping a given number of initial cards.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Skip   Deck Size    Chance of Winning\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    skip_num = 1 + floor ( ( i - 1 ) * deck_size / 10 );

    p = high_card_simulation ( deck_size, skip_num, trial_num );

    fprintf ( 1, '  %3d  %3d  %12g\n', skip_num, deck_size, p );

  end

  return
end
