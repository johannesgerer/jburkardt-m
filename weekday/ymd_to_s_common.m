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
%    28 April 2010
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
  if ( 0 <= y )
    s = 'CE ';
    s1 = sprintf ( '%4d', y );
    s = [ s, s1 ];
  else
    s = 'BCE ';
    s1 = sprintf ( '%4d',  - y );
    s = [ s, s1 ];
  end

  if ( m < 10 )
    s1 = sprintf ( '/0%1d', m );
  else
    s1 = sprintf ( '/%2d', m );
  end
  s = [ s, s1 ];

  if ( d < 10 )
    s1 = sprintf ( '/0%1d', d );
  else
    s1 = sprintf ( '/%2d', d );
  end
  s = [ s, s1 ];

  return
end
