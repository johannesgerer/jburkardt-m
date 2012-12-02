function w = doomsday_gregorian ( y, m, d )

%*****************************************************************************80
%
%% DOOMSDAY_GREGORIAN: weekday given any date in Gregorian calendar.
%
%  Discussion:
%
%    This procedure does not include any procedure to switch to the Julian
%    calendar for dates early enough that that calendar was used instead.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Conway,
%    Tomorrow is the Day After Doomsday,
%    Eureka,
%    Volume 36, October 1973, pages 28-31.
%
%  Parameters:
%
%    Input, integer Y, M, D, the year, month and day of the date.
%    Note that the year must be positive.
%
%    Output, integer W, the weekday of the date.
%
  anchor = [ 1, 6, 4, 3 ];
  mdoom = [ 3, 28, 0, 4, 9, 6, 11, 8, 5, 10, 7, 12 ];
%
%  Refuse to handle Y <= 0.
%
  if ( y <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DOONSDAY_GREGORIAN - Fatal error!\n' );
    fprintf ( 1, '  Y <= 0.\n' );
    error ( 'DOOMSDAY_GREGORIAN - Fatal error!' );
  end
%
%  Determine the century C.
%
  c = floor ( y / 100 );
%
%  Determine the last two digits of the year, YY
%
  yy = mod ( y, 100 );
%
%  Divide the last two digits of the year by 12.
%
  yy = mod ( y, 100 );
  yy12d = floor ( yy / 12 );
  yy12r = mod ( yy, 12 );
  yy12r4d = floor ( yy12r / 4 );
  drd = yy12d + yy12r + yy12r4d;
  drdr = mod ( drd, 7 );
  ydoom = anchor( mod ( c-1, 4 ) + 1 ) + drdr;
  ydoom = i4_wrap ( ydoom, 1, 7 );
%
%  If M = 1 or 2, and leap year, add 1.
%
  if ( ( m == 1 || m == 2 ) && year_is_leap_gregorian ( y ) )
    l = 1;
  else
    l = 0;
  end

  w = ydoom + ( d -  mdoom(m) - l );
  w = i4_wrap ( w, 1, 7 );

  return
end
