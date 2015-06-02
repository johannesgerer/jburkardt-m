function s = ymdf_to_s_hebrew ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_HEBREW "prints" a Hebrew YMDF date into a string.
%
%  Format:
%
%    DayNumber.Fraction MonthName YearNumber AM
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, string S, a representation of the date.
%
  sm = month_to_month_name_hebrew ( y, m );
  s = sprintf ( '%05.2f %s %d AM', d + f, sm, y );

  return
end
