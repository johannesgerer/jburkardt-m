function s = s_behead_substring ( s, sub )

%*****************************************************************************80
%
%% S_BEHEAD_SUBSTRING "beheads" a string, removing a given substring.
%
%  Discussion:
%
%    Initial blanks in the string are removed first.
%
%    Then, if the initial part of the string matches the substring,
%    that part is removed and the remainder shifted left.
%
%    Initial blanks in the substring are NOT ignored.
%
%    Capitalization is ignored.
%
%    If the substring is equal to the string, then the resultant
%    string is returned as a single blank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be transformed.
%
%    Input, string SUB, the substring to be removed from
%    the beginning of the string.
%
%    Output, string S, the string to be transformed.
%

%
%  Remove leading blanks from the string.
%
  s = s_adjustl ( s );
%
%  Get lengths.
%
  s_len = s_len_trim ( s );
  sub_len = s_len_trim ( sub );

  if ( s_len < sub_len )
    return
  end
%
%  If the string begins with the substring, chop it off.
%
  if ( s_eqi ( s(1:sub_len), sub(1:sub_len) ) )

    if ( sub_len < s_len )
      s = s(sub_len+1:s_len);
      s = s_adjustl ( s );
    else
      s = ' ';
    end

  end

  return
end
