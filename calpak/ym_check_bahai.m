function [ y, m, ierror ] = ym_check_bahai ( y, m )

%*****************************************************************************80
%
%% YM_CHECK_BAHAI checks a Bahai YM date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, the YM date.
%
%    Output, integer IERROR, is 0 if no error was found in the
%    date, and 1 otherwise.
%

%
%  Check the year.
%
  [ y, ierror ] = y_check_bahai ( y );

  if ( ierror ~= 0 )
    return
  end

  if ( m < 1 || year_length_months_bahai ( y ) < m )
    ierror = 1;
    return
  end

  return
end
