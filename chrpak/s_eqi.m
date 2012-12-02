function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = 0;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = 0;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = 0;
      return
    end
  end

  value = 1;

  return
end
