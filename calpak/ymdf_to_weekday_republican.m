function w = ymdf_to_weekday_republican ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_REPUBLICAN returns the weekday of a Republican YMDF date.
%
%  Discussion:
%
%    The Republican calendar used a 10 day week.
%    There was a final "month" of 5 or 6 days.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, the day of the week of the date.
%    The days are numbered from Sunday through Saturday, 1 through 7.
%
  w = i4_wrap ( d, 1, 10 );

  return
end