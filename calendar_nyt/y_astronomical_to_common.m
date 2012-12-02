function y2 = y_astronomical_to_common ( y )

%*****************************************************************************80
%
%% Y_ASTRONOMICAL_TO_COMMON converts an Astronomical year to a Common year.
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
%    Input, integer Y, the astronomical year.
%
%    Output, integer Y2, the Common year.
%
  if ( y <= 0 )
    y2 = y - 1;
  else
    y2 = y;
  end

  return
end
