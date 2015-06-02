function [ y2, m2, d2 ] = ymd_inc_ymd_common ( y1, m1, d1, yn, mn, dn )

%*****************************************************************************80
%
%% YMD_INC_YMD_COMMON increments a Common YMD date by a YMD increment.
%
%  Discussion:
%
%    You often see on old gravestones statements like
%
%      "Joe Blow died on May 8 1784 aged 38 Years, 7 Months and 5 Days."
%
%    It's not exactly clear how to interpret such a statement, since
%    we can't actually convert 38 Years, 7 Months and 5 Days to a number
%    of days.  (Years and months vary in their day length).  However,
%    we can assume that what was meant was, if you take the year, month
%    and day of Joe Blow's birthday, and you:
%
%      add 38 to the year,
%      add 7 to the month, and if you go past December, subtract 12 and
%        increment the year,
%      add 5 to the day, and if you go past the length of the month,
%        increment the month and decrement the day appropriately.
%
%    Notice, in particular, that if you do the operations in the reverse
%    order, you may get a different answer, since what you do with a large
%    day value depends on the month you assume you are working in.
%
%    Just warning you that this is a poorly posed problem.
%
%    Thanks to Charlie Cullen for pointing out this little problem to me.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, the YMD date.
%
%    Input, integer YN, MN, DN, the increment to the YMD date.
%
%    Output, integer Y2, M2, D2, the incremented YMD date.
%

%
%  TEMPORARY
%
  f1 = 0.0;
  fn = 0.0;

  y2 = y1 + yn;
  m2 = m1 + mn;
  d2 = d1 + dn;
  f2 = f1 + fn;

  [ y2, m2, d2, f2, ierror ] = ymdf_check_common ( y2, m2, d2, f2 );

  if ( ierror ~= 0 )
    y2 = 0;
    m2 = 0;
    d2 = 0;
    f2 = 0.0;
    return
  end

  return
end
