function [ yn, mn, dn, fn, ierror ] = ymdf_dif_ymdf_common ( y1, m1, d1, f1, ...
  y2, m2, d2, f2, yn, mn, dn, fn, ierror )

%*****************************************************************************80
%
%% YMDF_DIF_YMDF_COMMON gets the YMDF difference between two Common YMDF dates.
%
%  Discussion:
%
%    This difference is not well defined.  A reasonable way to define this
%    difference is:
%
%      Use Y1, M1, D1, F1 as a base,
%
%      Increment Y1 by 1 repeatedly, until your date is less than
%      a year before Y2/M2/D2/F2.
%
%      Increment M1 by 1 repeatedly, until your date is less than a
%      month before Y2/M2/D2/F2.
%
%      Increment D1 by 1 repeatedly, until your data is less than a
%      day before Y2/M2/D2/F2.
%
%      Measure the fractional day difference.
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
%    Input, integer Y1, M1, D1, real F1, the
%    first YMDF date.
%
%    Input, integer Y2, M2, D2, real F2, the
%    second YMDF date.
%
%    Output, integer YN, MN, DN, real FN,
%    the difference in years, months, days, and fractional days from the
%    first date to the second.
%
%    Output, integer IERROR, is 1 if either date is illegal,
%    0 otherwise.
%

%
%  Check the dates.
%
  [ y1, m1, d1, f1, ierror ] = ymdf_check_common ( y1, m1, d1, f1 );

  if ( ierror ~= 0 )
    return
  end

  [ y2, m2, d2, f2, ierror ] = ymdf_check_common ( y2, m2, d2, f2 );

  if ( ierror ~= 0 )
    return
  end
%
%  Compare the dates.
%
  cmp = ymdf_compare ( y1, m1, d1, f1, y2, m2, d2, f2 );
%
%  We swap dates, if necessary, so that date 1 is never greater
%  than date 2.
%
  if ( cmp == '=' )
    yn = 0;
    mn = 0;
    dn = 0;
    fn = 0.0;
    return
  elseif ( cmp == '>' )
    [ y1, m1, d1, f1, y2, m2, d2, f2 ] = ymdf_swap ( y1, m1, d1, f1, ...
      y2, m2, d2, f2 );
  end
%
%  Year difference.
%
  yn = y2 - y1;
%
%  Month difference.
%
  y3 = y2;

  if ( m2 < m1 )
    yn = yn - 1;
    mn = m2 - m1 + 12;
    y3 = y2 - 1;
  else
    mn = m2 - m1;
  end

  m3 = m2;
%
%  Day difference.
%
  if ( d2 < d1 )
    mn = mn - 1;
    m3 = m2 - 1;
    if ( m3 == 0 )
      m3 = 12;
      y3 = y3 - 1;
    end
    dn = d2 - d1 + month_length_common ( y3, m3 );
  else
    dn = d2 - d1;
  end
%
%  Fractional difference.
%  THERE'S MORE TO THIS CODE, AFTER ALL, WHAT IF DN < 0?
%
  if ( f2 < f1 )
    dn = dn - 1;
  end

  fn = f2 - f1;

  return
end
