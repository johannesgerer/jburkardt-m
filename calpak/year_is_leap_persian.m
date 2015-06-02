function value = year_is_leap_persian ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_PERSIAN returns TRUE if the Persian year was a leap year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nachum Dershowitz, Edward Reingold,
%    Calendrical Calculations,
%    Cambridge, 1997, page 58.
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, logical VALUE, TRUE if the year was a leap year,
%    FALSE otherwise.
%
  if ( y <= 0 )
    y2 = y - 473;
  else
    y2 = y - 474;
  end

  y3 = 474 + mod ( y2, 2820 );

  if ( mod ( 682 * ( y3 + 38 ), 2816 ) < 682 )
    value = 1;
  else
    value = 0;
  end

  return
end
