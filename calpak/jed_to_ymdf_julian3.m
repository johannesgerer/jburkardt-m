function [ y, m, d, f ] = jed_to_ymdf_julian3 ( jed )

%*****************************************************************************80
%
%% JED_TO_YMDF_JULIAN3 converts a JED to a Julian YMDF date.
%
%  Discussion:
%
%    The theory behind this routine is very clean.  The Julian
%    calendar has cycles of 1 and 4 years, and we can analyze a date
%    by determining where it lies within these cycles.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 July 2012
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
%    Output, integer Y, M, D, real F,
%    the YMDF date.
%
  cycle_length = 1461;
  year_length = 365;

  jed_epoch = epoch_to_jed_julian ( );

  j = floor ( jed - jed_epoch );
  f1 = ( jed - jed_epoch ) - j;

  if ( f1 < 0.0 )
    f1 = f1 + 1.0;
    j = j - 1;
  end

  d0 = j;
  n4 = 0;

  while ( d0 <= 0 )
    d0 = d0 + cycle_length;
    n4 = n4 - 1;
  end

  n4 = n4 + floor ( d0 / cycle_length );
  d1 = i4_modp ( d0, cycle_length );
  n1 = floor ( d1 / year_length );
  d2 = i4_modp ( d1, year_length );

  if ( n1 == 4 )
    j1 = 366;
    y1 = 4 * n4 + n1;
  else
    j1 = d2 + 1;
    y1 = 4 * n4 + n1 + 1;
  end
%
%  Any year before 1 AD must be moved one year further back, since
%  this calendar does not include a year 0.
%
  y1 = y_astronomical_to_common ( y1 );

  [ y, m, d, f ] = yjf_to_ymdf_julian ( y1, j1, f1 );

  return
end
