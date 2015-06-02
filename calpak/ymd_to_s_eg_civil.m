function s = ymd_to_s_eg_civil ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_S_EG_CIVIL "prints" an Egyptian Civil YMD date into a string.
%
%  Format:
%
%    DayNumber MonthName YearNumber EN
%
%  Discussion:
%
%    "EN" stands for the Era of Nabonassar, a Babylonian king who
%    acceded in 747 BC, used by the astronomer Ptolemy to assign
%    an artificial starting year for the Egyptian calendar.
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

  s = sprintf ( '%02d %s %04d EN', d, sm, y );

  return
end