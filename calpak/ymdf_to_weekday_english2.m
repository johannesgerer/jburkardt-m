function w = ymdf_to_weekday_english2 ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_WEEKDAY_ENGLISH2 returns the weekday of an English YMDF date.
%
%  Discussion:
%
%    Lewis Carroll's method is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gary Meisters,
%    Lewis Carroll's Day-of-the-Week Algorithm,
%    Math Horizons, November 2002, pages 24-25.
%
%    Lewis Carroll (Charles Dodgson),
%    To Find the Day of the Week for Any Given Date,
%    Nature, 31 March 1887.
%
%    John Conway,
%    Tomorrow is the Day After Doomsday,
%    Eureka, 1973.
%
%  Parameters:
%
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, integer W, is the week day number of the date, with
%    1 for Sunday, through 7 for Saturday.
%
  m_table = [ 0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 12 ];
%
%  Dates of 2 September 1752 and earlier fall under one scheme.
%
  y1 = 1752;
  m1 = 9;
  d1 = 3;
  f1 = 0.0;

  cmp1 = ymdf_compare ( y, m, d, f, y1, m1, d1, f1 );
%
%  Dates of 14 September 1752 and later fall under another.
%
  y1 = 1752;
  m1 = 9;
  d1 = 13;
  f1 = 0.0;

  cmp2 = ymdf_compare ( y, m, d, f, y1, m1, d1, f1 );

  if ( cmp1 == '<' )

    cval = 18 - floor ( y / 100 );

  elseif ( cmp2 == '>' )

    cval = 2 * ( 3 - mod ( floor ( y / 100 ), 4 ) );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'YMDF_TO_WEEKDAY_ENGLISH2 - Fatal error!\n' );
    fprintf ( 1, '  The given date is illegal.\n' );
    error ( 'YMDF_TO_ENGLISH2 - Fatal error!' );

  end

  cc = floor ( y / 100 );
  yy = y - cc * 100;
  a = floor ( yy / 12 );
  b = yy - 12 * a;
  yval = a + b + floor ( b / 4 );

  mval = m_table(m);

  dval = d;

  if ( ( m == 1 || m == 2 ) && year_is_leap_english ( y ) )
    mval = mval + 6;
  end

  w = i4_modp ( cval + yval + mval + dval, 7 ) + 1;

  return
end