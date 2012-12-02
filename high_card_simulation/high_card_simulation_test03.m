function high_card_simulation_test03 ( )

%*****************************************************************************80
%
%% HIGH_CARD_SIMULATION_TEST03 plots the results for a deck of 100 cards.
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
  deck_size = 100;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_SIMULATION_TEST03\n' );
  fprintf ( 1, '  HIGH_CARD_PROBABILITY computes the exact probability of \n' );
  fprintf ( 1, '  winning a high card game with a deck of %d cards\n', deck_size );
  fprintf ( 1, '  assuming we skip the first K-1 cards and select the next card\n' );
  fprintf ( 1, '  that is bigger.\n' );

  p = high_card_probability ( deck_size );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    K   Prob(K)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : deck_size
    fprintf ( 1, '  %3d  %8g\n', i, p(i) )
  end

  plot ( 0:deck_size-1, p, 'r', 'Linewidth', 2 )
  grid on
  title ( 'Exact chance of winning per given skip number' )
  xlabel ( 'Number of cards to skip before choice' )
  ylabel ( 'Chance of correct choice.' )

  print ( '-dpng', 'high_card_simulation_test03.png' )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data plotted in "high_card_simulation_test03.png".\n' );

  return
end
