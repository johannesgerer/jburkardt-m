function cmp = ymd_compare ( y1, m1, d1, y2, m2, d2 )

%*****************************************************************************80
%
%% YMD_COMPARE compares two YMD dates.
%
%  Discussion:
%
%    The comparison should work for a pair of dates in any calendar.
%
%    No check is made that the dates are actually legitimate.  It is
%    assumed that the calling routine has already ensured that the
%    dates are properly "normalized".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, M1, D1, the first YMD date.
%
%    Input, integer Y2, M2, D2, the second YMD date.
%
%    Output, character CMP:
%    '<' if date 1 precedes date 2;
%    '=' if date 1 equals date 2;
%    '>' if date 1 follows date 2;
%
  cmp = '?';
%
%  Compare years...
%
  if ( y1 < y2 )
    cmp = '<';
  elseif ( y1 > y2 )
    cmp = '>';
  else
%
%  ...if necessary, compare months in equal years...
%
    if ( m1 < m2 )
      cmp = '<';
    elseif ( m1 > m2 )
      cmp = '>';
    else
%
%  ...if necessary, compare days in equal months...
%
      if ( d1 < d2 )
        cmp = '<';
      elseif ( d1 > d2 )
        cmp = '>';
      else
        cmp = '=';
      end

    end

  end

  return
end
