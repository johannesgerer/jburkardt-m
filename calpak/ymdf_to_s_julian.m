function s = ymdf_to_s_julian ( y, m, d, f )

%*****************************************************************************80
%
%% YMDF_TO_S_JULIAN writes a Julian YMDF date into a string.
%
%  Format:
%
%    AD YYYY/MM/DD.FF
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2012
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

%
%  Copy the input.
%
  y2 = y;
  m2 = m;
  d2 = d;
%
%  Check the input.
%
  [ y2, m2, d2, ierror ] = ymd_check_julian ( y2, m2, d2 );

  if ( ierror ~= 0 )
    s = '?';
    return
  end

  if ( 0 <= y2 )
    s = 'AD ';
    s1 = sprintf ( '%d', y2 );
  else
    s = 'BC ';
    s1 = sprintf ( '%d', - y2 );
  end

  s = [ s, s1 ];

  s1 = sprintf ( '/%d', m2 );
  s = [ s, s1 ];

  s1 = sprintf ( '/%d', d2 );
  s = [ s, s1 ];

  s1 = sprintf ( '%2.2f', f );
  s = [ s, s1(2:end) ];

  return
end
