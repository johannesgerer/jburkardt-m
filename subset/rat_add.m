function [ top, bot, ierror ] = rat_add ( top1, bot1, top2, bot2 )

%*****************************************************************************80
%
%% RAT_ADD adds two rational values.
%
%  Discussion:
%
%    The routine computes
%
%      TOP/BOT = TOP1/BOT1 + TOP2/BOT2
%
%    while trying to avoid integer overflow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TOP1, BOT1, the first value to add.
%
%    Input, integer TOP2, BOT2, the second value to add.
%
%    Output, integer TOP, BOT, the sum.
%
%    Output, integer IERROR.
%    0, no error occurred.
%    1, an error occurred.  The addition of the two values
%    requires a numerator or denominator larger than the
%    maximum legal integer.
%
  i_max = i4_huge ( );

  ierror = 0;

  if ( top1 == 0 )
    top = top2;
    bot = bot2;
    return
  elseif ( top2 == 0 )
    top = top1;
    bot = bot1;
    return
  end
%
%  Compute the greatest common factor of the two denominators,
%  and factor it out.
%
  bot3 = i4_gcd ( bot1, bot2 );
  bot1 = bot1 / bot3;
  bot2 = bot2 / bot3;
%
%  The fraction may now be formally written as:
%
%    (top1*bot2 + top2*bot1) / (bot1*bot2*bot3)
%
%  Check the tops for overflow.
%
  if ( i_max < abs ( top1 * bot2 ) )
    ierror = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_ADD - Fatal error!\n' );
    fprintf ( 1, '  Overflow of top of rational sum.\n' );
    top = 0;
    error ( 'RAT_ADD - Fatal error!' );
  end

  top1 = top1 * bot2;

  if ( i_max < abs ( top2 * bot1 ) )
    ierror = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_ADD - Fatal error!\n' );
    fprintf ( 1, '  Overflow of top of rational sum.\n' );
    top = 0;
    error ( 'RAT_ADD - Fatal error!' );
  end

  top2 = top2 * bot1;

  if ( i_max < abs ( top1 + top2 ) )
    ierror = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_ADD - Fatal error!\n' );
    fprintf ( 1, '  Overflow of top of rational sum.\n' );
    top = 0;
    error ( 'RAT_ADD - Fatal error!' );
  end

  top = top1 + top2;
%
%  Check the bottom for overflow.
%
  if ( i_max < abs ( bot1 * bot2 * bot3 ) )
    ierror = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_ADD - Fatal error!\n' );
    fprintf ( 1, '  Overflow of bottom of rational sum.\n' );
    bot = 1;
    error ( 'RAT_ADD - Fatal error!' );
  end

  bot = bot1 * bot2 * bot3;
%
%  Put the fraction in lowest terms.
%
  itemp = i4_gcd ( top, bot );
  top = top / itemp;
  bot = bot / itemp;
%
%  The bottom should be positive.
%
  if ( bot < 0 )
    bot = -bot;
    top = -top;
  end

  return
end
