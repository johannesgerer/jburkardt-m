function value = year_is_leap_ethiopian ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_ETHIOPIAN returns TRUE if the Ethiopian year was a leap year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2013
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
    value = 0;
    return
  end

  if ( mod ( y, 4 ) == 3 )
    value = 1;
  else
    value = 0;
  end

  return
end
