function [ y, m, d, ierror ] = ymd_check_english ( y, m, d )

%*****************************************************************************80
%
%% YMD_CHECK_ENGLISH checks an English YMD date.
%
%  Discussion:
%
%    Certain simple errors in dates will be corrected, such as
%      "31 September 1996"
%    which will become
%      "1 October 1996".
%
%    The routine also knows that in the English calendar, the dates
%    3 September 1752 through 13 September 1752 are illegal.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, the YMD date, which may
%    be corrected if necessary and possible.
%
%    Output, integer IERROR, is 0 if the date is legal.
%

%
%  Check the month.
%
  [ y, m, ierror ] = ym_check_english ( y, m );

  if ( ierror ~= 0 )
    return
  end
%
%  Check the day.
%
  [ y, m, d ] = day_borrow_english ( y, m, d );

  [ y, m, d ] = day_carry_english ( y, m, d );
%
%  Now make sure that the date does not fall in the
%  Julian-to-Gregorian calendar switchover limbo.
%
  if ( y == 1752 )
    if ( m == 9 )
      if ( 3 <= d && d <= 13 )
        ierror = 1;
        fprintf ( 1, '\n' );
        fprintf ( 1, 'YMD_CHECK_ENGLISH - Warning!\n' );
        fprintf ( 1, '  Illegal date.\n' );
        s = ymd_to_s_numeric ( y, m, d );
        fprintf ( 1, '  %s\n', s );
      end
    end
  end

  return
end
