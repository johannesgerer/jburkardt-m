function day_list_common ( y1, m1, d1, y2, m2, d2 )

%*****************************************************************************80
%
%% DAY_LIST_COMMON prints a list of days between two dates.
%
%  Discussion:
%
%    Given the dates of September 25, 2005 and October 2, 2005,
%    the routine should print out:
%
%    Sun, Sep 25 2005 -
%    Mon, Sep 26 2005 -
%    Tue, Sep 27 2005 -
%    Wed, Sep 28 2005 -
%    Thu, Sep 29 2005 -
%    Fri, Sep 30 2005 -
%    Sat, Oct 01 2005 -
%    Sun, Oct 02 2005 -
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, the first date.
%
%    Input, integer Y2, M2, D2, the second date.
%
  y = y1;
  m = m1;
  d = d1;
  f = 0.0;

  cmp = '<';

  while ( cmp ~= '>' )

    w = ymdf_to_weekday_common ( y, m, d, f );

    w_name = weekday_to_name_common3 ( w );

    m_name = month_to_month_name_common3 ( m );

    fprintf ( 1, '%3s, %3s %02d %4d -\n', w_name, m_name, d, y );

    [ y, m, d, f ] = ymdf_next_common ( y, m, d, f );

    cmp = ymdf_compare ( y, m, d, f, y2, m2, d2, f );

  end

  return
end
