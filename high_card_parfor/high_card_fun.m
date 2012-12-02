function p = high_card_fun ( m, n )

%*****************************************************************************80
%
%% HIGH_CARD_FUN estimates the value of breaking the deck at location K.
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
%    Input, integer N, the number of trials.
%
%    Output, real P(M), the estimated probability of picking the correct
%    high card by discarding so many cards and taking the next card that
%    is higher.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HIGH_CARD_FUN\n' );
  fprintf ( 1, '  Using N=%d cards and T=%d trials,\n', m, n );
  fprintf ( 1, '  estimate the chances of correctly picking the highest card\n' );
  fprintf ( 1, '  by looking at cards 0 through K-1, and then taking the first\n' );
  fprintf ( 1, '  subsequent card that is bigger.\n' );

  p = zeros ( m, 1 );

  parfor i = 1 : m

    p(i) = high_card_simulation ( m, n, i - 1 );

  end

  return
end
function p = high_card_simulation ( deck_size, trial_num, skip_num )

%*****************************************************************************80
%
%% HIGH_CARD_SIMULATION simulates a game of choosing the highest card in a deck.
%
%  Discussion:
%
%    You are given a deck of DECK_SIZE cards.
%
%    Your goal is to select the high card.  For convenience, we can assume 
%    the cards are a permutation of the integers from 1 to DECK_SIZE, but in
%    fact the user mustn't see such values or else it's obvious which is the
%    largest card.
%
%    However, your choice is made under the following rules:  You may turn over
%    one card at a time.  When a card is turned over, you may declare that to be
%    your choice, or else turn over another card.  If you have not chosen a card
%    by the end, then your choice is the final card.
%
%    If you have no idea what to do, and simply decide in advance to pick
%    a card "at random", that is, for example, you decide to pick the 15th card
%    before having seen any cards, then your probability of winning is 1/DECK_SIZE.
%
%    The question is, can you do better than that?
%
%    Your strategy is as follows: always look at the first SKIP_NUM cards without
%    choosing them.  Then choose the very next card you encounter that is larger
%    than the cards you skipped.
%
%    Using this program, you can easily see that skipping 5 cards is much better
%    than picking one at random, skipping 10 is even better, and so on.  Of course,
%    you can't skip too many cards, and in fact, the results seem to be best for
%    somewhere around 30 to 35 cards skipped.  For problems like this, the
%    optimal value is somewhere around 1 / e, where E is the base of the natural
%    logarithm system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DECK_SIZE, the number of cards in the deck.
%    2 <= DECK_SIZE.  Default value is 52;
%
%    Input, integer TRIAL_NUM, the number of times we will simulate this process.
%    Default value is 100.
%
%    Input, integer SKIP_NUM, the number of initial cards you plan to examine
%    but will NOT select.  If SKIP_NUM is 0, you don't look at any cards first.
%    0 <= SKIP_NUM < DECK_SIZE.  Default value is DECK_SIZE/3.
%
%    Output, real P, the estimated probability that your strategy of skipping
%    SKIP_NUM cards and then selecting the next card that is bigger, will
%    result in choosing the highest card.
%
  if ( nargin < 3 )
    trial_num = 100;
  end

  if ( nargin < 2 )
    skip_num = deck_size / 3;
  end

  if ( nargin < 1 )
    deck_size = 52;
  end
%
%  Make sure we got integers.
%
  deck_size = floor ( deck_size );
  skip_num = floor ( skip_num );
  trial_num = floor ( trial_num );
%
%  Check values.
%
  if ( deck_size < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HIGH_CARD_SIMULATION - Fatal error!\n' );
    fprintf ( 1, '  DECK_SIZE must be at least 2.\n' );
    fprintf ( 1, '  Your value was %d\n', deck_size );
    error ( 'HIGH_CARD_SIMULATION - Fatal error!' );
  end

  if ( skip_num < 0 )
    skip_num = 0;
  end

  if ( deck_size <= skip_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HIGH_CARD_SIMULATION - Fatal error!\n' );
    fprintf ( 1, '  SKIP_NUM must be less than DECK_SIZE.\n' );
    fprintf ( 1, '  Your values were DECK_SIZE = %d, SKIP_NUM = %d\n', deck_size, skip_num );
    error ( 'HIGH_CARD_SIMULATION - Fatal error!' );
  end

  if ( trial_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HIGH_CARD_SIMULATION - Fatal error!\n' );
    fprintf ( 1, '  TRIAL_NUM must be at least 1.\n' );
    fprintf ( 1, '  Your value was %d\n', trial_num );
    error ( 'HIGH_CARD_SIMULATION - Fatal error!' );
  end

  correct = 0;

  for trial = 1 : trial_num

    cards = permutation_random ( deck_size );

    if ( 1 <= skip_num )
      skip_max = max ( cards(1:skip_num) );
    else
      skip_max = -Inf;
    end

    true_max = max ( cards(1:deck_size) );
%
%  In case you don't encounter a card larger than SKIP_MAX,
%  we'll assume you pick the last card in the deck, even though
%  you know it's a loser.
%
    choice = cards(deck_size);
%
%  Turn over the remaining cards in the deck, but stop
%  immediately when you find one bigger than SKIP_MAX.
%
    for card = skip_num + 1 : deck_size
      if ( skip_max < cards(card) )
        choice = cards(card);
        break;
      end
    end
%
%  Record successful choices.
%
    if ( choice == true_max )
      correct = correct + 1;
    end

  end
%
%  Estimate the probability.
%
  p = correct / trial_num;

  return
end
function p = permutation_random ( n )

%*****************************************************************************80
%
%% PERMUTATION_RANDOM returns a random permutation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects to permute.
%
%    Output, integer P(N), a permutation of the integers from 1 to N.
%
  p = ( 1 : n );

  for i = 1 : n - 1

    k = i4_random ( i, n );

    p1 = p(i);
    p(i) = p(k);
    p(k) = p1;

  end

  return
end
function value = i4_random ( lo, hi )

%*****************************************************************************80
%
%% I4_RANDOM returns a random integer between LO and HI.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LO, HI, the limits.
%
%    Output, integer VALUE, the random integer.
%
  r = ( hi + 1 - lo ) * rand ( );
  value = lo + floor ( r );

  return
end
