function s = s_adjustl ( s )

%*****************************************************************************80
%
%% S_ADJUSTL flushes a string left.
%
%  Discussion:
%
%    Both blanks and tabs are treated as "white space".
%
%    This routine is similar to the FORTRAN90 ADJUSTL routine.
%
%  Example:
%
%    Input             Output
%
%    '     Hello'      'Hello     '
%    ' Hi there!  '    'Hi there!   '
%    'Fred  '          'Fred  '
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 January 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be shifted left.
%
%    Output, string S, has been shifted left.
%
  TAB = char ( 9 );
%
%  Check the length of the string to the last nonblank.
%  If nonpositive, return.
%
  len = s_len_trim ( s );

  if ( len <= 0 )
    return
  end
%
%  Find NONB, the location of the first nonblank, nontab.
%
  nonb = 0;

  for i = 1 : len

    if ( s(i) ~= ' ' && s(i) ~= TAB )
      nonb = i;
      break
    end

  end

  if ( nonb == 0 )
    s = ' ';
    return
  end
%
%  Shift the string left.
%
  if ( 1 < nonb )
    for i = 1 : len + 1 - nonb
      s(i) = s(i+nonb-1);
    end
  end
%
%  Blank out the end of the string.
%
  s(len+2-nonb:len) = ' ';

  return
end
