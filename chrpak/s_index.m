function value = s_index ( s, sub )

%*****************************************************************************80
%
%% S_INDEX seeks the first occurrence of a substring.
%
%  Discussion:
%
%    The function returns the location in the string at which the
%    substring SUB is first found, or 0 if the substring does not
%    occur at all.
%
%    The routine is trailing blank insensitive.  This is very
%    important for those cases where you have stored information in
%    larger variables.  If S is of length 80, and SUB is of
%    length 80, then if S = 'FRED' and SUB = 'RED', a match would
%    not be reported by the standard FORTRAN INDEX, because it treats
%    both variables as being 80 characters long!  This routine assumes that
%    trailing blanks represent garbage!
%
%    Because of the suppression of trailing blanks, this routine cannot be
%    used to find, say, the first occurrence of the two-character
%    string 'A '.  However, this routine treats as a special case the
%    occurrence where S or SUB is entirely blank.  Thus you can
%    use this routine to search for occurrences of double or triple blanks
%    in a string, for example.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be searched.
%
%    Input, string SUB, the substring to search for.
%
%    Output, integer VALUE.  0 if SUB does not occur in
%    the string.  Otherwise S(VALUE:VALUE+LENS-1) = SUB,
%    where LENS is the length of SUB, and is the first place
%    this happens.
%
  value = 0;

  llen1 = s_len_trim ( s );
  llen2 = s_len_trim ( sub );
%
%  In case S or SUB is blanks, use LENGTH.
%
  if ( llen1 == 0 )
    llen1 = length ( s );
  end

  if ( llen2 == 0 )
    llen2 = lenght ( sub );
  end

  if ( llen1 < llen2 )
    return
  end

  for i = 1 : llen1 + 1 - llen2

    if ( s(i:i+llen2-1) == sub(1:llen2) )
      value = i;
      return
    end

  end

  return
end
