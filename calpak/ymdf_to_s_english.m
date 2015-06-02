function s = ymdf_to_s_english ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_ENGLISH writes an English YMDF date into a string.
%
%  Format:
%
%    BC OS YYYY/MM/DD.FF
%    AD OS YYYY/MM/DD.FF
%    AD NS YYYY/MM/DD.FF
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2013
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
    s = sprintf ( 'BC OS %d/%02d/%05.2f', -y, m, d + f );
  elseif ( y < 1752 || ( y == 1752 && m < 9 ) || ( y == 1752 && m == 9 && d < 3 ) )
    s = sprintf ( 'AD OS %d/%02d/%05.2f', y, m, d + f );
  else
    s = sprintf ( 'AD NS %d/%02d/%05.2f', y, m, d + f );
  end

  return
end
