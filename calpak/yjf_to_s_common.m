function s = yjf_to_s_common ( y, j, f )

%*****************************************************************************80
%
%% YJF_TO_S_COMMON writes a Common YJF date into a string.
%
%  Format:
%
%    CE Y/J.F
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2013
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
  [ y2, j2, f2, ierror ] = yjf_check_common ( y2, j2, f2 );

  if ( ierror ~= 0 )
    s = '?';
    return
  end

  if ( 0 <= y2 )
    s = 'CE ';
    s1 = sprintf ( '%d', y2 );
  else
    s = 'BCE ';
    s1 = sprintf ( '%d', - y2 );
  end

  s = [ s, s1 ];

  s1 = sprintf ( '/%d', j2 );
  s = [ s, s1 ];

  s1 = sprintf ( '%2.2f', f );
  s = [ s, s1(2:end) ];

  return
end
