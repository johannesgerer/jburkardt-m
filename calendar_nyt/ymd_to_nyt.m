function [ volume, issue ] = ymd_to_nyt ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_NYT converts a YMD date to an NYT date.
%
%  Discussion:
%
%    The New York Times began publication with Volume 1, Issue 1 on
%    Thursday, 18 September 1851.
%
%    The Volume number is incremented annually, on 18 September.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anonymous,
%    A Correction; Welcome to 51,254,
%    The New York Times,
%    01 January 2000, Volume 149, Issue 51254.
%
%    James Barron,
%    What's in a Number? 143 Years of News,
%    The New York Times,
%    14 March 1995, Volume 144, Issue 50000.
%
%    The New York Times,
%    Page One, 1896-1996, A Special Commemorative Edition Celebrating the
%    100th Anniversary of the Purchase of the New York Times by Adolph S Ochs,
%    Galahad Books, 1996,
%    ISBN: 0-88365-961-1,
%    LC: D411.P25.
%
%    The New York Times,
%    The Complete First Pages, 1851-2008,
%    Black Dog & Leventhal Publishers, 2008,
%    ISBN13: 978-1-57912-749-7,
%    LC: D351.N53.
%
%  Parameters:
%
%    Input, integer Y, M, D, the YMD date.
%
%    Output, integer VOLUME, ISSUE, the New York Times
%    volume and issue.
%
  f = 0.0;

  jed = ymdf_to_jed_common ( y, m, d, f );

  [ volume, issue ] = jed_to_nyt ( jed );

  return
end
