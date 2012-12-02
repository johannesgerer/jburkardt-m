function p = card_game ( skip_num, trial_num )

%*****************************************************************************80
%
%% CARD_GAME estimates the probability of surviving a card game challenge.
%
%  Discussion:
%
%    You are given a deck of CARD_NUM cards.  (We'll assume CARD_NUM is 100.)
%
%    Your goal is to select the high card.  We can assume the cards are a permutation
%    of the integers from 1 to CARD_NUM.
%
%    However, your choice is made under the following rules:  You may turn over
%    one card at a time.  When a card is turned over, you may declare that to be
%    your choice, or else turn over another card.  If you have not chosen a card
%    by the end, then your choice is the final card.
%
%    If you have no idea what to do, and simply decide in advance to pick
%    a card "at random", that is, for example, you decide to pick the 15th card
%    before having seen any cards, then your probability of winning is 1/CARD_NUM.
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
%    Input, integer SKIP_NUM, the number of initial cards you will examine
%    but will NOT select.
%
%    Input, integer TRIAL_NUM, the number of times we will simulate this process.
%
%    Output, real P, the estimated probability that your strategy of skipping
%    SKIP_NUM cards and then selecting the next card that is bigger, will
%    result in choosing the highest card.
%
  correct = 0;
  card_num = 100;

  for trial = 1 : trial_num

    cards = permutation_random ( card_num );

    skip_max = max ( cards(1:skip_num) );
    true_max = max ( cards(1:card_num) );

    choice = cards(card_num);

    for card = skip_num + 1 : card_num
      if ( skip_max < cards(card) )
        choice = cards(card);
        break;
      end
    end

    if ( choice == true_max )
      correct = correct + 1;
    end

  end

  p = correct / trial_num;

  return
end
function p = permutation_random ( n )

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
