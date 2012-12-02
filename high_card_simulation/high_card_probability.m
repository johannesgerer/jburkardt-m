function p = high_card_probability ( n )

%*****************************************************************************80
%
%% HIGH_CARD_PROBABILITY determines winning probabilities for the high card game.
%
%  Discussion:
%
%    The high card game presents the player with a deck of cards, each
%    having an unknown value.  The player is allowed to go throught the
%    deck once, looking at the cards one at a time.  At any time, the player
%    may decide to take a particular card, winning that amount and stopping
%    the game.  If the player continues to the end, by default the last card
%    indicates the amount won.
%
%    An optimal strategy for selecting the highest card is as follows:
%    * look at, but do not select, the first k-1 cards;
%    * stop at the first card, from k to n, that is higher than the first k-1 cards.
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
%  Parameters:
%
%    Input, integer N, the number of cards.  
%
%    Output, real P(N).  P(K) is the probability that a strategy that skips
%    K-1 cards will win, given that the deck has N cards.
%
  p = zeros ( n, 1 );
  
  for r = 1 : n
    p(r) = ( 1 + ( r - 1 ) * sum ( 1 ./ ( r:n-1) ) ) / n;
  end

  return
end
