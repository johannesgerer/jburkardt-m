function value = s_s_subanagram ( s1, s2 )

%*****************************************************************************80
%
%% S_S_SUBANAGRAM determines if S2 is a "subanagram" of S1.
%
%  Discussion:
%
%    S2 is an anagram of S1 if S2 can be formed by permuting the letters
%    of S1
%
%    S2 is an subanagram of S1 if S2 can be formed by selecting SOME of
%    the letters of S1 and permuting them.
%
%    Blanks (trailing or otherwise), punctuation, and capitalization
%    are all significant, so be sure to input exactly the information
%    you want to check.
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
%    Input, string S1, the master string.
%
%    Input, string S2, the second string.
%
%    Output, logical VALUE is TRUE if S2 is a subanagram of S1.
%
  value = 0;
%
%  Sort both.
%
  s1 = s_sort_a ( s1 );
  s2 = s_sort_a ( s2 );

  s1_length = length ( s1 );
  s2_length = length ( s2 );

  i1 = 0;

  for i2 = 1 : s2_length

    while ( 1 )

      i1 = i1 + 1;
%
%  Ran out of S1 before finishing.  No match is possible.
%
      if ( s1_length < i1 )
        return;
      end
%
%  The current character in S1 is already greater than the character in S2.
%  No match is possible.
%
      if ( s2(i2) < s1(i1) )
        return
      end
%
%  Found an exact match for current character.  Keep going.
%
      if ( s1(i1) == s2(i2) )
        break
      end
%
%  Didn't find a match, but one might be possible if we increase I1.
%
    end

  end
%
%  We matched every character of S2 with something in S1.
%
  value = 1;

  return
end
