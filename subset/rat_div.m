function [ top, bot, ierror ] = rat_div ( top1, bot1, top2, bot2 )

%*****************************************************************************80
%
%% RAT_DIV divides one rational value by another.
%
%  Discussion:
%
%    The routine computes
%
%      TOP / BOT = ( TOP1 / BOT1 ) / ( TOP2 / BOT2 ).
%
%    while avoiding integer overflow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer TOP1, BOT1, the numerator.
%
%    Input, integer TOP2, BOT2, the denominator.
%
%    Output, integer TOP, BOT, the result.
%
%    Output, integer IERROR.
%    0, no error occurred.
%    1, an error occurred.  One of the quantities BOT1, BOT2,
%    or TOP2 is zero, or the result of the division
%    requires a numerator or denominator larger than the
%    maximum legal integer.
%
  ierror = 0;
  top = 0;
  bot = 1;

  i_max = i4_huge ( );

  if ( bot1 == 0 | top2 == 0 | bot2 == 0 )
    ierror = 1;
    return
  end

  if ( top1 == 0 )
    top = 0;
    bot = 1;
    return
  end
%
%  Implicitly invert the divisor fraction here.  The rest of
%  the code will be a multiply operation.
%
  jbot1 = bot1;
  jbot2 = top2;
  jtop1 = top1;
  jtop2 = bot2;
%
%  Get rid of all common factors in top and bottom.
%
  itemp = i4_gcd ( jtop1, jbot1 );
  jtop1 = jtop1 / itemp;
  jbot1 = jbot1 / itemp;
  itemp = i4_gcd ( jtop1, jbot2 );
  jtop1 = jtop1 / itemp;
  jbot2 = jbot2 / itemp;
  itemp = i4_gcd ( jtop2, jbot1 );
  jtop2 = jtop2 / itemp;
  jbot1 = jbot1 / itemp;
  itemp = i4_gcd ( jtop2, jbot2 );
  jtop2 = jtop2 / itemp;
  jbot2 = jbot2 / itemp;
%
%  The fraction (TOP1*BOT2)/(BOT1*TOP2) is in lowest terms.
%
%  Check the top for overflow.
%
  if ( i_max < abs ( jtop1 * jtop2 ) )
    ierror = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_DIV - Fatal error!\n' );
    fprintf ( 1, '  Overflow of top of rational fraction.\n' );
    itop = 0;
    error ( 'RAT_DIV - Fatal error!' );
  end

  top = jtop1 * jtop2;
%
%  Check the bottom BOT1*TOP2 for overflow.
%
  if ( i_max < abs ( jbot1 * jbot2 ) )
    ierror = 1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RAT_DIV - Fatal error!\n' );
    fprintf ( 1, '  Overflow of bottom of rational fraction.\n' );
    bot = 1;
    error ( 'RAT_DIV - Fatal error!' );
  end

  bot = jbot1 * jbot2;
%
%  The bottom should be positive.
%
  if ( bot < 0 )
    bot = -bot;
    top = -top;
  end

  return
end
