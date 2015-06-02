function value = year_is_leap_islamic ( y )

%*****************************************************************************80
%
%% YEAR_IS_LEAP_ISLAMIC returns TRUE if the Islamic year was a leap year.
%
%  Discussion:
%
%    In a 30 year cycle, there are 11 leap years, years 2, 5, 7, 10, 13,
%    16, 18, 21, 24, 26 and 29.  During these years, the 12th month has
%    30 days instead of 29.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, logical YEAR_IS_LEAP_ISLAMIC, TRUE if the year was a leap year,
%    FALSE otherwise.
%
  if ( i4_modp ( 11 * y + 14, 30 ) < 11 )
    value = 1;
  else
    value = 0;
  end

  return
end
