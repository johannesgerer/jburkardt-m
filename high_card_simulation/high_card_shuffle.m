function sequence = high_card_shuffle ( n )

%*****************************************************************************80
%
%% HIGH_CARD_SHUFFLE generates a sequence of numeric "cards" for a game.
%
%  Discussion:
%
%    In this game, you know that the deck contains N cards.  You win by 
%    choosing the highest card in the deck.  You don't know what this card
%    is, and you must choose your card by saying "stop" as, one by one,
%    the cards of the deck are exposed.  
%
%    A random guesser would get the high card with probability 1/N.
%
%    An intelligent guesser can do much better.
%
%    It is the goal of this program so "shuffle" a deck of cards suitable
%    for this game.  The problem is that we know the highest card in an
%    ordinary deck.  Let's replace the cards by integers.  Then if we know
%    in advance the range of the cards (say, they must lie between 1 and 
%    1,000), it may be true that we can guess the card that is the maximum.
%
%    However, this program produces a sequence of integer card values for
%    which no information can be gained from the values.  It does this
%    by regarding the card values as binary integers between 1 and 2^N - 1.
%    We can make a perfectly information-free sequence as follows:
%
%      Card 1 sets bit N-1 to 1.
%      Card 2 sets bit N-2 to 1, bit  N-1 randomly.
%      ...
%      Card I sets bit N-I to 1, bits N-1 down to N-I+1 randomly.
%      ...
%      Card N sets bit N-N to 1, bits N-1 down to 1 randomly.
%
%    The I-th card has equal probability to fall in any of the I intervals
%    defined by the I-1 previous cards.  So, knowing the previous cards tells
%    you absolutely nothing about where the next card will fall, and each
%    card is, at the moment you see it, as good a guess for the maximum as
%    the unseen cards.
%
%    For example, the command "high_card_shuffle(7)" might yield
%
%      64    96    80     8     4    82    29
%    or
%      64    32    16    24    12    58    73
%    or
%      64    96    48     8   100    26    93
%    or
%      64    96    16    56    76   122    71
%
%    in which the highest card is #2, #7, #5, or #6 respectively.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of cards.  N probably needs to be less than 32.
%
%    Output, integer SEQUENCE(N), a set of N integer values that can be used
%    as the cards in the high card guessing game.
%
  if ( 32 <= n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HIGH_CARD_SHUFFLE - Fatal error!\n' );
    fprintf ( 1, '  This program can only handle N < 32.\n' );
    error ( 'HIGH_CARD_SHUFFLE - Fatal error!' );
  end

  for i = 1 : n
    c = 2^(n-i);
    k = randi ( 2, i - 1, 1 ) - 1;
    for j = 1 : i - 1
      c = c + k(j) * 2^(n-i+j);
    end
    sequence(i) = c;
  end

  return
end
