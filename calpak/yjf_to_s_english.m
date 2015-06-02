function s = yjf_to_s_english ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_S_ENGLISH writes an English YJF date into a string.
%
%  Format:
%
%    BC OS YYYY/JJJ.FF
%    AD OS YYYY/JJJ.FF
%    AD NS YYYY/JJJ.FF
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
%    Output, string S, a representation of the date.
%

%
%  Copy the input.
%
  y2 = y;
  j2 = j;
  f2 = f;
%
%  Check the input.
%
  [ y2, j2, f2, ierror ] = yjf_check_english ( y2, j2, f2 );

  if ( ierror ~= 0 )
    s = '?';
    return
  end

  if ( y2 < 0 )
    s = 'BC OS ';
    s1 = sprintf ( '%d', - y2 );
  elseif ( y < 1752 || ( y == 1752 && j < 278 ) )
    s = 'AD OS ';
    s1 = sprintf ( '%d', y2 );
  else
    s = 'AD NS ';
    s1 = sprintf ( '%d', y2 );
  end

  s = [ s, s1 ];

  s1 = sprintf ( '/%d', j2 );
  s = [ s, s1 ];

  s1 = sprintf ( '%2.2f', f );
  s = [ s, s1(2:end) ];

  return
end
