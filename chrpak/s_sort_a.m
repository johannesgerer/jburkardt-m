function s = s_sort_a ( s )

%*****************************************************************************80
%
%% S_SORT_A sorts a string into ascending order.
%
%  Discussion:
%
%    The string is assumed to be short, and so a simple bubble sort is used.
%
%    ALL the characters are sorted, including blanks and punctuation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be sorted.
%
%    Output, string S, the sorted string.
%
  s_length = length ( s );

  for i = 1 : s_length - 1

    c = s(i);
    j = i;

    for k = i + 1 : s_length
      if ( s(k) < s(j) )
        j = k;
      end
    end

    s(i) = s(j);
    s(j) = c;

  end

  return
end
