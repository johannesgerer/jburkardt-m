function y2 = y_roman_to_julian ( y )

%*****************************************************************************80
%
%% Y_ROMAN_TO_JULIAN converts a Roman year to a Julian year.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, the Roman year.
%
%    Output, integer Y2, the corresponding Julian year.
%
  y2 = y - 753;

  if ( y2 <= 0 )
    y2 = y2 - 1;
  end

  return
end
