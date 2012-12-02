function [ y, m, d, ierror ] = ymd_check_common ( y, m, d )

%*****************************************************************************80
%
%% YMD_CHECK_COMMON checks a Common YMD date.
%
%  Discussion:
%
%    Certain simple errors in dates will be corrected, such as
%      "31 September 1996"
%    which will become
%      "1 October 1996".
%
%    The routine also knows that in the Common calendar, the dates
%    5 October 1582 through 14 October 1582 are illegal.
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
%    Input, integer Y, integer M, integer D, the YMD date.
%
%    Output, integer Y, integer M, integer D, the YMD date,
%    which may be corrected if necessary and possible.
%
%    Output, integer IERROR, is 0 if the date is legal.
%
  ierror = 0;
%
%  Check the year.
%
  if ( y == 0 )
    ierror = 1;
    return
  end
%
%  Check the month.
%
  [ y, m ] = month_borrow_common ( y, m );

  [ y, m ] = month_carry_common ( y, m );
%
%  Check the day.
%
  [ y, m, d ] = day_borrow_common ( y, m, d );

  [ y, m, d ] = day_carry_common ( y, m, d );
%
%  Now make sure that the date does not fall in the
%  Julian-to-Gregorian calendar switchover limbo.
%
  if ( y == 1582 )
    if ( m == 10 )
      if ( 5 <= d & d <= 14 )
        ierror = 1;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'YMD_CHECK_COMMON - Warning!\n' );
        fprintf ( 1, '  Illegal date:\n' );
        s = ymd_to_s_numeric ( y, m, d );
        fprintf ( 1, '%s\n', s );
      end
    end
  end

  return
end
