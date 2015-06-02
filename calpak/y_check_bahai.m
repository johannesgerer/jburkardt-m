function [ y, ierror ] = y_check_bahai ( y )

%*****************************************************************************80
%
%% Y_CHECK_BAHAI checks a Bahai year.
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
  if ( y <= 0 )
    ierror = 1;
  else
    ierror = 0;
  end

  return
end
