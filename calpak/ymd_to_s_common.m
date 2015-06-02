function s = ymd_to_s_common ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_S_COMMON writes a Common YMD date into a string.
%
%  Format:
%
%    CE YYYY/MM/DD
%    BCE YYYY/MM/DD
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, the YMD date.
%
%    Output, string S, a representation of the date.
%
  if ( y < 0 )
    s = sprintf ( 'BCE %d/%02d/%02d', -y, m, d );
  else
    s = sprintf ( ' CE %d/%02d/%02d', y, m, d );
  end

  return
end
