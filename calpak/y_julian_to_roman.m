function y2 = y_julian_to_roman ( y )

%*****************************************************************************80
%
%% Y_JULIAN_TO_ROMAN converts a Julian year to a Roman year.
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
%    Input, integer Y, the Julian year.
%
%    Output, integer Y2, the corresponding Roman year.
%
  ierror = y_check_julian ( y );

  if ( ierror ~= 0 )
    y2 = -1;
    return
  end

  if ( y < 0 )
    y = y + 1;
  end

  y2 = y + 753;

  return
end
