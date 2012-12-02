function s = s_reverse ( s )

%*****************************************************************************80
%
%% S_REVERSE reverses the characters in a string.
%
%  Example:
%
%    Input        Output
%
%    ' Cat'       'taC '
%    'Goo gol  '  'log ooG  '
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
%    Input, string S, the string to reverse.
%
%    Output, string S, the reversed string.
%
  nchar = s_len_trim ( s );

  for i = 1 : floor ( nchar / 2 )
    j = nchar + 1 - i;
    t = s(i);
    s(i) = s(j);
    s(j) = t;
  end

  return
end
