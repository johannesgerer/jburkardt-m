function [ y, m, d, f ] = jed_to_ymdf_gregorian2 ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_GREGORIAN2 converts a JED to a Gregorian YMDF date.
%
%  Discussion:
%
%    The theory behind this routine is very clean.  The Gregorian
%    calendar has cycles of 1, 4, 100 and 400 years, and we can
%    analyze a date by determining where it lies within these cycles.
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
  g1 = 365;
  g4 = 1461;
  g100 = 36524;
  g400 = 146097;

  jed_epoch = epoch_to_jed_gregorian ( );

  j = floor ( jed - jed_epoch );
  f1 = ( jed - jed_epoch ) - j;

  d0 = j;
  n400 = 0;

  while ( d0 < 0 )
    d0 = d0 + g400;
    n400 = n400 - 1;
  end

  n400 = n400 + floor ( d0 / g400 );
  d1 = i4_modp ( d0, g400 );

  n100 = floor ( d1 / g100 );
  d2 = i4_modp ( d1, g100 );

  n4 = floor ( d2 / g4 );
  d3 = i4_modp ( d2, g4 );

  n1 = floor ( d3 / g1 );
  d4 = i4_modp ( d3, g1 );

  if ( n100 == 4 || n1 == 4 )
    j1 = 366;
    y1 = 400 * n400 + 100 * n100 + 4 * n4 + n1;
  else
    j1 = d4 + 1;
    y1 = 400 * n400 + 100 * n100 + 4 * n4 + n1 + 1;
  end
%
%  Any year before 1 AD must be moved one year further back, since
%  this calendar does not include a year 0.
%
  y1 = y_astronomical_to_common ( y1 );

  [ y, m, d, f ] = yjf_to_ymdf_gregorian ( y1, j1, f1 );

  return
end
