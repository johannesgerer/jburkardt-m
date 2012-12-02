function s = s_low ( s )

%*****************************************************************************80
%
%% S_LOW replaces all uppercase letters by lowercase ones.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be transformed.
%
%    Output, string S, a lowercase copy of the input string.
%
  nchar = s_len_trim ( s );

  for i = 1 : nchar
    s(i) = ch_low ( s(i) );
  end

  return
end
