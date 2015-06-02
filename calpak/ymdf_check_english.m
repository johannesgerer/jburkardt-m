function [ y, m, d, f, ierror ] = ymdf_check_english ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_CHECK_ENGLISH checks an English YMDF date.
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
%    Input/output, integer Y, M, D, real F, the
%    YMDF date, which may be corrected if necessary and possible.
%
%    Output, integer IERROR, is 0 if the date is legal.
%
  [ y, m, d, ierror ] = ymd_check_english ( y, m, d );

  if ( ierror ~= 0 )
    return
  end

  [ y, m, d, f ] = frac_borrow_english ( y, m, d, f );

  [ y, m, d, f ] = frac_carry_english ( y, m, d, f );

  return
end
