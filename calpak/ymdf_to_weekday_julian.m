function w = ymdf_to_weekday_julian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_JULIAN computes the weekday of a Julian YMDF date.
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
  jed = ymdf_to_jed_julian ( y, m, d, f );

  [ w, f2 ] = jed_to_weekday ( jed );

  return
end