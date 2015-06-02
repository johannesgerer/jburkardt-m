function s = ymdhms_to_s_common ( y, m, d, h, n, second )

%*****************************************************************************80
%
%% YMDHMS_TO_S_COMMON "prints" a Common YMDHMS date into a string.
%
%  Format:
%
%    CE YYYY/MM/DD HH:MM:SS
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, H, N, SECOND, the YMDHMS date.
%
%    Output, string S, contains a representation of the date.
%
  if ( y < 0 )
    s = sprintf ( 'BCE %d/%02d/%02d %02d:%02d:%02d', -y, m, d, h, n, second );
  else
    s = sprintf ( 'CE %d/%02d/%02d %02d:%02d:%02d', y, m, d, h, n, second );
  end

  return
end