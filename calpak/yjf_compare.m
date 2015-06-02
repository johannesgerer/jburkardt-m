function cmp = yjf_compare ( y1, j1, f1, y2, j2, f2 )

%*****************************************************************************80
%
%% YJF_COMPARE compares two YJF dates.
%
%  Discussion:
%
%    The routine is "generic" and does not assume a particular calendar.
%    However, it does assume that the calendar dates are "normalized".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y1, J1, real F1,
%    the first YJF date.
%
%    Input, integer Y2, J2, real F2,
%    the second YJF date.
%
%    Output, character CMP:
%    '<' if date 1 precedes date 2;
%    '=' if date 1 equals date 2;
%    '>' if date 1 follows date 2;
%
  if ( y1 < y2 )
    cmp = '<';
  elseif ( y1 > y2 )
    cmp = '>';
  else

    if ( j1 < j2 )
      cmp = '<';
    elseif ( j1 > j2 )
      cmp = '>';
    else

      if ( f1 < f2 )
        cmp = '<';
      elseif ( f1 > f2 )
        cmp = '>';
      else
        cmp = '=';
      end

    end

  end

  return
end
