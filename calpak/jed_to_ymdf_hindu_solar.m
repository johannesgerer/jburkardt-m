function [ y, m, d, f ] = jed_to_ymdf_hindu_solar ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_HINDU_SOLAR converts a JED to a Hindu solar YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2012
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
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, M, D, real F, the YMDF date.
%

%
%  Date = JF.
%
  jf = jed;
%
%  Date = JED_EPOCH + JF
%
  jed_epoch = epoch_to_jed_hindu_solar ( );
  jf = jf - jed_epoch;
%
%  Date = JED_EPOCH + Y years + JF
%
  y = floor ( jf / year_length_hindu_solar ( ) );
  jf = jf - floor ( y * year_length_hindu_solar ( ) );
%
%  Date = JED_EPOCH + Y years + ( M - 1 ) months + JF
%
  m = 1 + int ( jf / month_length_hindu_solar ( ) );
  jf = jf - floor ( ( m - 1 ) * month_length_hindu_solar ( ) );
%
%  Date = JED_EPOCH + Y years + ( M - 1 ) months + ( D - 1 ) days + f
%
  d = ( floor ) ( jf ) + 1;
  f = jf - ( d - 1 );

  return
end
