function value = year_length_common ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_COMMON returns the number of days in a Common year.
%
%  Discussion:
%
%    The "common" calendar is meant to be the calendar which is Julian up to
%    day JED = 2299160, and Gregorian from day JED = 2299161 and after.
%
%    If Y is 0, then the routine returns 0, reflecting the fact that
%    there was officially no year 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year to be checked.
%
%    Output, integer VALUE, the number of
%    days in the year.
%
  if ( y == 0 ) 
    value = 0;
  elseif ( y == 1582 )
    value = 355;
  elseif ( year_is_leap_common ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end
