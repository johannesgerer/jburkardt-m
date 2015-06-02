function s = ymdf_to_s_common ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_COMMON writes a Common YMDF date into a string.
%
%  Format:
%
%    CE YYYY/MM/DD.FF
%    BCE YYYY/MM/DD.FF
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
%    Input, integer Y, M, D, real F, the YMDF date.
%
%    Output, string S, a representation of the date.
%
  if ( y < 0 )
    s = sprintf ( 'BCE %d/%02d/%05.2f', -y, m, d + f );
  else
    s = sprintf ( 'CE %d/%02d/%05.2f', y, m, d + f );
  end

  return
end
