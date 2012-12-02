function [ y, m, d ] = nyt_to_ymd ( volume, issue )

%*****************************************************************************80
%
%% NYT_TO_YMD converts an NYT date to a YMD date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer VOLUME, ISSUE, the New York Times
%    volume and issue.
%
%    Output, integer Y, M, D, the year, month and day.
%
  jed = nyt_to_jed ( volume, issue );

  [ y, m, d, f ] = jed_to_ymdf_common ( jed );

  return
end
