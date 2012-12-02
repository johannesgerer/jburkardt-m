function [ y, m, d, f, ierror ] = ymdf_check_common ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_CHECK_COMMON checks a Common YMDF date.
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
%    Input, integer Y, integer M, integer D, real  F, the
%    YMDF date.
%
%    Output, integer Y, integer M, integer D, real F, the
%    YMDF date, which may be corrected if necessary and possible.
%
%    Output, integer IERROR, is 0 if the date is legal.
%
  ierror = 0;

  [ y, m, d, ierror ] = ymd_check_common ( y, m, d );

  if ( ierror ~= 0 )
    return
  end

  [ y, m, d, f ] = frac_borrow_common ( y, m, d, f );

  [ y, m, d, f ] = frac_carry_common ( y, m, d, f );

  return
end
