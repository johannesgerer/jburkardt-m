function s = ymd_to_s_alexandrian ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_S_ALEXANDRIAN "prints" an Alexandrian YMD date into a string.
%
%  Format:
%
%    DayNumber MonthName YearNumber AX
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
  sm = month_to_month_name_eg_civil ( m );

  s = sprintf ( '%d %s %d AX', d, sm, y );

  return
end
