function s = yj_to_s_common ( y, j )

%*****************************************************************************80
%
%% YJ_TO_S_COMMON writes a Common YJ date into a string.
%
%  Format:
%
%    CE YYYY/JJJ
%    BCE YYYY/JJJ
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 March 2013
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
  if ( y < 0 )
    s = sprintf ( 'BCE %d/%d', -y, d );
  else
    s = sprintf ( 'CE %d/%d', y, d );
  end

  return
end
