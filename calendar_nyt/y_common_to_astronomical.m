function y2 = y_common_to_astronomical ( y )

%*****************************************************************************80
%
%% Y_COMMON_TO_ASTRONOMICAL converts a Common year to an Astronomical year.
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
%    Input, integer Y, the Common year.
%
%    Output, integer Y2, the Astronomical year.
%
  if ( y < 0 )
    y2 = y + 1;
  elseif ( y == 0 )
    y2 = - i4_huge ( );
  else
    y2 = y;
  end

  return
end
