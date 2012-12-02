function ierror = y_check_gregorian ( y )

%*****************************************************************************80
%
%% Y_CHECK_GREGORIAN checks a Gregorian year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year, which must not be 0.
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
