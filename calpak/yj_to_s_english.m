function s = yj_to_s_english ( y, j )

%*****************************************************************************80
%
%% YJ_TO_S_ENGLISH writes an English YJ date into a string.
%
%  Format:
%
%    BC OS YYYY/JJJ
%    AD OS YYYY/JJJ
%    AD NS YYYY/JJJ
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, J, the YJ date.
%
%    Output, string S, the representation of the date.
%
  if ( y < 0 ) then
    s = sprintf ( 'BC OS %d', - y );
  elseif ( y < 1752 || ( y == 1752 && j < 278 ) )
    s = sprintf ( 'AD OS %d', y );
  else
    s = sprintf ( 'AD NS %d', y );
  end if

  return
end
