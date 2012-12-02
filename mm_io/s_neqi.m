function value = s_neqi ( s1, s2 )

%*****************************************************************************80
%
%% S_NEQI is TRUE if two strings are not equal.
%
%  Discussion:
%
%    The comparison ignores case and trailing blanks.
%
%  Example:
%
%    S_NEQI ( 'Anjana', 'ANJANA' ) is FALSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, the result of the comparison.
%
  FALSE = 0;
  TRUE = 1;

  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  value = TRUE;

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = TRUE;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = TRUE;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = TRUE;
      return
    end
  end

  value = FALSE;

  return
end
