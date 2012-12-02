function s = s_cap ( s )

%*****************************************************************************80
%
%% S_CAP replaces any lowercase letters by uppercase ones in a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character S(*), the string to be transformed.
%
%    Output, character S(*), the capitalized string.
%
  nchar = s_len_trim ( s );

  for i = 1 : nchar

    s(i) = ch_cap ( s(i) );

  end

  return
end
