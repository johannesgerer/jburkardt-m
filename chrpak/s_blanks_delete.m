function s = s_blanks_delete ( s )

%*****************************************************************************80
%
%% S_BLANKS_DELETE replaces consecutive blanks by one blank.
%
%  Discussion:
%
%    The remaining characters are left justified and right padded with blanks.
%    TAB characters are converted to spaces.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be transformed.
%
%    Output, string S, the transformed string.
%
  s_length = length ( s );
  s2 = [];

  TAB = 9;

  j = 0;
  newchr = ' ';

  for i = 1 : s_length

    oldchr = newchr;
    newchr = s(i);

    if ( newchr == TAB )
      newchr = ' ';
    end

    if ( oldchr ~= ' ' || newchr ~= ' ' )
      j = j + 1;
      s2(j) = newchr
    end

  end

  s = s2;

  return
end

