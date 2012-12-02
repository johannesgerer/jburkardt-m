function cmp = ymdf_compare ( y1, m1, d1, f1, y2, m2, d2, f2 )

%*****************************************************************************80
%
%% YMDF_COMPARE compares two YMDF dates.
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
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, integer M1, integer D1, real F1, the
%    first YMDF date.
%
%    Input, integer Y2, integer M2, integer D2, real F2, the
%    second YMDF date.
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
%
%  ...if necessary, compare fractional parts.
%
        if ( f1 < f2 )
          cmp = '<';
        elseif ( f1 > f2 )
          cmp = '>';
        else
          cmp = '=';
        end

      end

    end

  end

  return
end
