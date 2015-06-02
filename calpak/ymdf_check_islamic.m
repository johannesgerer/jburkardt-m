function [ y, m, d, f, ierror ] = ymdf_check_islamic ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_CHECK_ISLAMIC checks an Islamic YMDF date.
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
%    Input/output, integer Y, M, D, real F, the
%    YMDF date, which may be corrected if necessary and possible.
%
%    Output, integer IERROR, is 0 if the date is legal.
%
  ierror = 0;

  [ y, m, d, ierror ] = ymd_check_islamic ( y, m, d );

  if ( ierror ~= 0 )
    return
  end

  [ y, m, d, f ] = frac_borrow_islamic ( y, m, d, f );

  [ y, m, d, f ] = frac_carry_islamic ( y, m, d, f );

  return
end
