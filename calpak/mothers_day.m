function [ m, d ] = mothers_day ( y )

%*****************************************************************************80
%
%% MOTHERS_DAY computes the date of Mother's Day (US) for a Common year.
%
%  Discussion:
%
%    Mother's Day occurs on the second Sunday in May.
%
%  Example:
%
%    Input:
%
%      Y = 2003
%
%    Output:
%
%      M = 5
%      D = 11
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer M, D, the month and day of Mother's Day.
%

%
%  Determine the day of the week for 8 May, the earliest day
%  that Mother's day can occur.
%
  m = 5;
  d = 8;
  f = 0.0;

  w = ymdf_to_weekday_common ( y, m, d, f );
%
%  W = 1 means this day is Sunday, and day D is Mother's day.
%  Otherwise, figure out how to increment W to 8 (Sunday again);
%  The same increment makes D the correct day number.
%
  if ( w ~= 1 )
    d = d + 8 - w;
  end

  return
end
