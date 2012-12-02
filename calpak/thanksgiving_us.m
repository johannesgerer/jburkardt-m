function [ m, d ] = thanksgiving_us ( y )

%*****************************************************************************80
%
%% THANKSGIVING_US computes the date of Thanksgiving (US) for a Common year.
%
%  Discussion:
%
%    Thanksgiving (US) occurs on the fourth Thursday in November.
%
%  Example:
%
%    Input:
%
%      Y = 2002
%
%    Output:
%
%      M = 11
%      D = 28
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year.
%
%    Output, integer M, D, the month and day of Thanksgiving.
%

%
%  Determine the day of the week for 22 November, the earliest day
%  that Thanksgiving can occur.
%
  m = 11;
  d = 22;
  f = 0.0;

  w = ymdf_to_weekday_common ( y, m, d, f );
%
%  W = 5 means this day is Thursday, and day D is Thanksgiving.
%  Otherwise, figure out how to increment W to 5;
%  The same increment makes D the correct day number.
%
  if ( w < 5 )
    d = d + 5 - w;
  elseif ( 5 < w )
    d = d + 12 - w;
  end

  return
end
