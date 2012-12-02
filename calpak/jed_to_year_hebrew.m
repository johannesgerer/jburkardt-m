function y = jed_to_year_hebrew ( jed )

%*****************************************************************************80
%
%% JED_TO_YEAR_HEBREW: the year in the Hebrew calendar when a JED occurred.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Edward Richards,
%    Algorithm H,
%    Mapping Time, The Calendar and Its History,
%    Oxford, 1999, page 331.
%
%  Parameters:
%
%    Input, real JED, the Julian Ephemeris Date.
%
%    Output, integer Y, the year in the Hebrew calendar that
%    included the JED.  If the input JED is less than the epoch of the Hebrew
%    calendar, then Y is always returned as -1.
%
  jed_epoch = epoch_to_jed_hebrew ( );

  if ( jed < jed_epoch )
    y = -1;
    return
  end
%
%  Using integer arithmetic in this computation may cause overflow.
%
%  Compute the number of months elapsed up to the date.
%
  m = 1 + floor ( ( 25920.0 * ( jed - jed_epoch + 2.5 ) ) / 765433.0 );
%
%  Estimate the number of years represented by these months.
%
  y = 19 * floor ( m / 235 ) + floor ( ( 19 * ( i4_modp ( m, 235 ) - 2 ) ) / 235 ) + 1;
  y = max ( y, 1 );
%
%  Determine the JED of the first day of that year.
%
  jed2 = new_year_to_jed_hebrew ( y );
%
%  We might have been off by 1 year.
%
  if ( jed < jed2 )
    y = y - 1;
  end

  return
end
