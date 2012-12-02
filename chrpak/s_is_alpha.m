function value = s_is_alpha ( s )

%*****************************************************************************80
%
%% S_IS_ALPHA returns TRUE if the string contains only alphabetic characters.
%
%  Discussion:
%
%    Here, alphabetic characters are 'A' through 'Z' and 'a' through 'z'.
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
%    Input, string S, the string to be checked.
%
%    Output, logical VALUE, is TRUE if the string contains only
%    alphabetic characters.
%
  for i = 1 : length ( s )

    if ( ~ch_is_alpha ( s(i) ) )
      value = 0;
      return
    end

  end
 
  value = 1;

  return
end
