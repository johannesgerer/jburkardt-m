function high_card_display ( m, p )

%*****************************************************************************80
%
%% HIGH_CARD_DISPLAY plots the statistics for a high card simulation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of cards in the deck.
%
%    Input, real P(M), the estimated probability of picking the correct
%    high card by discarding so many cards and taking the next card that
%    is higher.
%
  plot ( 0:m-1, p, 'b' )
  grid on
  title ( 'Chance of winning per given skip number' )
  xlabel ( 'Number of cards to skip before choice' )
  ylabel ( 'Chance of correct choice.' )

  filename = 'high_card.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data plotted in "%s".\n', filename );

  return
end
