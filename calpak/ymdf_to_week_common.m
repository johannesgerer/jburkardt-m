function iweek = ymdf_to_week_common ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEK_COMMON returns the week number for a Common YMDF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, is the date.
%
%    Output, integer IWEEK, is the week number of the date, with
%    1 for the first week, and 53 or 54 for the last.  A week begins
%    on Sunday.  The first and last weeks may be partial weeks.
%

%
%  Make a local copy of the input date.
%
  d2 = d;
  m2 = m;
  y2 = y;
  f2 = f;
%
%  Check the input date.
%
  ierror = ymdf_check_common ( y2, m2, d2, f2 );

  if ( ierror ~= 0 )
    iweek = 0;
    return
  end
%
%  Find the number of days between Y/1/1 and Y/M1/D1.
%
  d1 = 1;
  m1 = 1;
  y1 = y;
  f1 = 0.0;

  [ days, ierror ] = ymdf_dif_common ( y1, m1, d1, f1, y2, m2, d2, f2 );
%
%  Find the day of the week of Y/1/1.
%
  iday1 = ymdf_to_weekday_common ( y1, m1, d1, f1 );
%
%  Find the day of the week of Y/M2/D2.
%
  iday2 = ymdf_to_weekday_common ( y2, m2, d2, f2 );
%
%  Expand the week containing Y/1/1 to begin on Sunday.
%
  ndays = floor ( days ) + ( iday1 - 1 );
%
%  Expand the week containing Y/M2/D2 to end on Saturday.
%
  ndays = ndays + ( 8 - iday2 );
%
%  Now NDAYS should be an exact multiple of 7, and IWEEK is easy.
%
  iweek = floor ( ndays / 7 );

  return
end
