function jed = ymdf_to_jed_hindu_solar ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_HINDU_SOLAR converts a Hindu solar YMDF date to a JED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Reingold, Nachum Dershowitz, Stewart Clamen,
%    Calendrical Calculations, II: Three Historical Calendars,
%    Software - Practice and Experience,
%    Volume 23, Number 4, pages 383-404, April 1993.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  jed_epoch = epoch_to_jed_hindu_solar ( );

  jed = jed_epoch + ...
      ( d - 1 ) ...
    + ( m - 1 ) * month_length_hindu_solar ( ) ...
    + y * year_length_hindu_solar ( ) ...
    + f;

  return
end
