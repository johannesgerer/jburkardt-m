function [ top, bot ] = rat_mul ( top1, bot1, top2, bot2 )

%*****************************************************************************80
%
%% RAT_MUL multiplies two fractions.
%
%  Discussion:
%
%    The routine computes
%
%      TOP / BOT = ( TOP1 / BOT1 ) * ( TOP2 / BOT2 ).
%
%    while avoiding integer overflow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TOP1, BOT1, the first factor.
%
%    Input, integer TOP2, BOT2, the second factor.
%
%    Output, integer TOP, BOT, the product.
%
  i_max = i4_huge ( );

  if ( top1 == 0 | top2 == 0 )
    top = 0;
    bot = 1;
    return
  end
%
%  Get rid of all common factors in top and bottom.
%
  temp = i4_gcd ( top1, bot1 );
  top1 = top1 / temp;
  bot1 = bot1 / temp;
  temp = i4_gcd ( top1, bot2 );
  top1 = top1 / temp;
  bot2 = bot2 / temp;
  temp = i4_gcd ( top2, bot1 );
  top2 = top2 / temp;
  bot1 = bot1 / temp;
  temp = i4_gcd ( top2, bot2 );
  top2 = top2 / temp;
  bot2 = bot2 / temp;
%
%  The fraction (TOP1*TOP2)/(BOT1*BOT2) is in lowest terms.
%
%  Check the top TOP1*TOP2 for overflow.
%
  if ( i_max < abs ( top1 * top2 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_MUL - Fatal error!\n' );
    fprintf ( 1, '  Overflow of top of rational product.\n' );
    error ( 'RAT_MUL - Fatal error!' );
  end

  top = top1 * top2;
%
%  Check the bottom BOT1*BOT2 for overflow.
%
  if ( i_max < abs ( bot1 * bot2 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_MUL - Fatal error!\n' );
    fprintf ( 1, '  Overflow of bottom of rational product.\n' );
    error ( 'RAT_MUL - Fatal error!' );
  end

  bot = bot1 * bot2;
%
%  The bottom should be positive.
%
  if ( bot < 0 )
    bot = -bot;
    top = -top;
  end

  return
end
