function high_card_simulation_test02 ( )

%*****************************************************************************80
%
%% HIGH_CARD_SIMULATION_TEST02 plots the results for a deck of 100 cards.
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
  trial_num = 1000;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_SIMULATION_TEST02\n' );
  fprintf ( 1, '  Using %d cards and %d trials, compute the chances of\n', deck_size, trial_num );
  fprintf ( 1, '  picking the high card with a skip of 0 through 99.\n' );

  p = zeros ( deck_size, 1 );

  for skip_num = 0 : deck_size - 1

    p(skip_num+1) = high_card_simulation ( deck_size, skip_num, trial_num );

  end

  plot ( 0:deck_size-1, p, 'b', 'Linewidth', 2 )
  grid on
  title ( 'Estiamted chance of winning per given skip number' )
  xlabel ( 'Number of cards to skip before choice' )
  ylabel ( 'Chance of correct choice.' )

  print ( '-dpng', 'high_card_simulation_test02.png' )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data plotted in "high_card_simulation_test02.png".\n' );

  return
end
