function [ y, m, d, h, n, s, ierror ] = ymdhms_check_common ( y, m, d, h, n, s )

%*****************************************************************************80
%
%% YMDHMS_CHECK_COMMON checks a Common YMDHMS date.
%
%  Discussion:
%
%    The routine will correct certain simple errors in dates, such as
%      "11:03:42 31 September 1996"
%    which will become
%      "11:03:42 1 October 1996".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, D, H, N, S.
%    These items have the obvious meanings.
%    The routine may change any of these values to more reasonable values.
%
%    Output, integer IERROR, is 0 if no error was detected in the
%    date, and 1 otherwise.
%

%
%  Check that the second is between 0 and 59.
%  N may get bumped up or down.
%
  [ y, m, d, h, n, s ] = second_borrow_common ( y, m, d, h, n, s );

  [ y, m, d, h, n, s ] = second_carry_common ( y, m, d, h, n, s );
%
%  Check that the minute is between 0 and 59.
%  H may get bumped up or down.
%
  [ y, m, d, h, n ] = minute_borrow_common ( y, m, d, h, n );

  [ y, m, d, h, n ] = minute_carry_common ( y, m, d, h, n );
%
%  Check that the hour is between 0 and 23.
%  D may get bumped up or down.
%
  [ y, m, d, h ] = hour_borrow_common ( y, m, d, h );

  [ y, m, d, h ] = hour_carry_common ( y, m, d, h );
%
%  Now make adjustments to D, M, and Y.
%
  [ y, m, d, ierror ] = ymd_check_common ( y, m, d );

  return
end