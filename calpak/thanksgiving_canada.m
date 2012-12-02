function [ m, d ] = thanksgiving_canada ( y )

%*****************************************************************************80
%
%% THANKSGIVING_CANADA computes Canadian Thanksgiving for a Common year.
%
%  Discussion:
%
%    Canadian Thanksgiving occurs on the second Monday in October.
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
%  Determine the day of the week for 8 October, the earliest day
%  that Thanksgiving can occur.
%
  m = 10;
  d = 8;
  f = 0.0;

  w = ymdf_to_weekday_common ( y, m, d, f );
%
%  If W = 2 means this day is Monday, and day D is Thanksgiving.
%  Otherwise, figure out how to increment W to 2;
%  The same increment makes D the correct day number.
%
  if ( w < 2 )
    d = d + 2 - w;
  elseif ( 2 < w )
    d = d + 2 + 7 - w;
  end

  return
end
