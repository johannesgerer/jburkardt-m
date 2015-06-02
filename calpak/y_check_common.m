function [ y, ierror ] = y_check_common ( y )

%*****************************************************************************80
%
%% Y_CHECK_COMMON checks a Common year.
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
%    Input/output, integer Y, the year, which must not be 0.
%
%    Output, integer IERROR, is 0 if Y is legal, and 1 otherwise.
%
  if ( y ~= 0 )
    ierror = 0;
  else
    ierror = 1;
  end

  return
end
