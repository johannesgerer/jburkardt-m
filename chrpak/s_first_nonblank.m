function pos = s_first_nonblank ( s )

%*****************************************************************************80
%
%% S_FIRST_NONBLANK returns the location of the first nonblank.
%
%  Discussion:
%
%    If all characters are blanks, a 0 is returned.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be examined.
%
%    Output, integer POS, the location of the first
%    nonblank character in the string, or 0 if all are blank.
%
  s_length = length ( s );

  for i = 1 : s_length

    if ( s(i) ~= ' ' )
      pos = i;
      return
    end

  end

  pos = 0;

  return
end
