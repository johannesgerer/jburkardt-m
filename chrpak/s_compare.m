function order = s_compare ( s1, s2 )

%*****************************************************************************80
%
%% S_COMPARE compares two strings.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, integer ORDER:
%    -1, S1 < S2.
%     0, S1 = S2
%    +1, S1 > S2
%
  s1_len = s_len_trim ( s1 );
  s2_len = s_len_trim ( s2 );

  order = 0;

  for i = 1 : min ( s1_len, s2_len )
    if ( s1(i) < s2(i) )
      order = -1;
      return
    elseif ( s2(i) < s1(i) )
      order = +1;
      return
    end

  end
%
%  If one string is actually longer than the other, and nonblank,
%  it must come after the other.
%
  if ( s1_len < s2_len )
    order = -1;
    return
  elseif ( s2_len < s1_len )
    order = +1;
    return
  end

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end

