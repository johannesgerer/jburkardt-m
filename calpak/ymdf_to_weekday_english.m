function w = ymdf_to_weekday_english ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_ENGLISH returns the weekday of an English YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, is the week day number of the date, with
%    1 for Sunday, through 7 for Saturday.
%
  jed = ymdf_to_jed_english ( y, m, d, f );

  [ w, f2 ] = jed_to_weekday ( jed );

  return
end