function year_length_english ( y )

%*****************************************************************************80
%
%% YEAR_LENGTH_ENGLISH returns the number of days in an English year.
%
%  Discussion:
%
%    The "English" calendar is meant to be the calendar which is Julian before
%    the transition date, and Gregorian afterwards.
%
%    1752 was a special year with only 355 days instead of 366.
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
    fprintf ( 1, '\n' );
    fprintf ( 1, 'YEAR_LENGTH_ENGLISH - Fatal error!\n' );
    fprintf ( 1, '  Illegal Y = 0.\n' );
    error ( 'YEAR_LENGTH_ENGLISH - Fatal error!' );
  end

  if ( y == 1752 )
    value = 355;
  elseif ( year_is_leap_english ( y ) )
    value = 366;
  else
    value = 365;
  end

  return
end
