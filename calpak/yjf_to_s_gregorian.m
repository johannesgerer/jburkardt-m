function s = yjf_to_s_gregorian ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_S_GREGORIAN writes a Gregorian YJF date into a string.
%
%  Format:
%
%    AD YYYY/JJJ.FF
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
%    Input, integer Y, J, real F, the YJF date.
%
%    Output, string S, the representation of the date.
%
  [ y, j, ierror ] = yj_check_gregorian ( y, j );

  if ( ierror ~= 0 )
    s = '?';
    return
  end

  if ( y < 0 )
    s = sprintf ( 'BC %d/%d/%f', -y, j, f );
  else
    s = sprintf ( 'AD %d/%d/%f', y, j, f );
  end

  return
end