function s = ymd_to_s_eg_lunar ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_S_EG_LUNAR "prints" an Egyptian Lunar YMD date into a string.
%
%  Format:
%
%    DayNumber MonthName YearNumber EL
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
%    Input, integer Y, M, D, the YMD date.
%
%    Output, string S, a representation of the date.
%
  sm = month_to_month_name_eg_lunar ( m );
  s = sprintf ( '%02d %s %04d EL', d, sm, y );

  return
end
