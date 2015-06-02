function jed = ymdf_to_jed_julian2 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_JED_JULIAN2 converts a Julian YMDF date to a JED.
%
%  Example:
%
%          Y  M  D          JED
%    --------------     -------
%    BC 4713  1  1            0
%    AD    1  1  1      1721424
%    AD 1844  5 11      2394710
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, real JED, the Julian Ephemeris Date.
%
  y2 = y;
  m2 = m;
  d2 = d;

  [ y2, m2, d2, ierror ] = ymd_check_julian ( y2, m2, d2 );

  if ( ierror ~= 0 )
    jed = -1.0;
    return
  end
%
%  Account for the missing year 0 by moving negative years up one.
%
  y3 = y_common_to_astronomical ( y2 );
%
%  The JED is the number of days in years past, plus the number of days in
%  the previous months this year, plus the number of days.
%
  t = floor ( ( 1461 * ( y3 + 4715 ) ) / 4 );
  jed = t - 1095 + days_before_month_julian ( y2, m2 ) + d2 - 1 - 0.5 + f;

  return
end