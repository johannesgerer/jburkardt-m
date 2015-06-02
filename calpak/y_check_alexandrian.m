function [ y, ierror ] = y_check_alexandrian ( y )

%*****************************************************************************80
%
%% Y_CHECK_ALEXANDRIAN checks an Alexandrian year.
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
%    Input/output, integer Y, the year, which must be positive.
%
%    Output, integer IERROR, is 0 if Y is legal, and 1 otherwise.
%
  if ( 0 < y )
    ierror = 0;
  else
    ierror = 1;
  end

  return
end
