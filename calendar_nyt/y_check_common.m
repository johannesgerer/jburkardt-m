function value = y_check_common ( y )

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
%    08 December 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the year, which must not be 0.
%
%    Output, integer VALUE, is 0 if Y is legal, and 1 otherwise.
%
  if ( y ~= 0 )
    value = 0;
  else
    value = 1;
  end

  return
end
