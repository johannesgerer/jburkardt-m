function [ s, ierror ] = s_inc ( s )

%*****************************************************************************80
%
%% S_INC "increments" a string.
%
%  Discussion:
%
%    The routine tries to produce the next string, in dictionary order,
%    following the input value of a string.  Digits, spaces, and other
%    nonalphabetic characters are ignored.  Case is respected; in other
%    words, the case of every alphabetic character on input will be the
%    same on output.
%
%    The following error conditions can occur:
%
%      There are no alphabetic characters in the string.  No
%      incrementing is possible.
%
%      All alphabetic characters are equal to 'Z' or 'z'.  In this
%      case, an error value is returned, but the string is also "wrapped
%      around" so that all alphabetic characters are "A" or "a".
%
%    If the word "Tax" were input, the successive outputs would be
%    "Tay", "Taz", "Tba", "Tbb", ...  If the input word "January 4, 1989"
%    were input, the output would be "Januarz 4, 1989".
%
%    This routine could be useful when trying to create a unique file
%    name or variable name at run time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character ( len = * ) S, the string whose
%    alphabetic successor is desired.
%
%    Output, character ( len = * ) S, if IERROR = 0,
%    S has been replaced by its successor.  If IERROR = 2,
%    S will be "wrapped around" so that all alphabetic
%    characters equal "A" or "a".
%
%    Output, integer IERROR, an error flag.
%    0, no error.
%    1, no alphabetic characters occur in the string.
%    2, all alphabetic characters are "Z" or "z".  S is wrapped around so
%       that all alphabetic characters are "A" or "a".
%
  ierror = 0;
  ilo = 1;
  ihi = s_len_trim ( s );
%
%  Find the last alphabetic character in the string.
%
  while ( 1 )

    iloc = s_alpha_last ( s(ilo:ihi) );
%
%  If there is no alphabetic character, we can't help.
%
    if ( iloc == 0 )
      ierror = 1;
      break;
    end

    if ( s(iloc) == 'Z' )

      s(iloc) = 'A';
      ihi = iloc - 1;

      if ( ihi <= 0 )
        ierror = 2;
        break;
      end

    elseif ( s(iloc) == 'z' )

      s(iloc) = 'a';
      ihi = iloc - 1;

      if ( ihi <= 0 )
        ierror = 2;
        break;
      end

    else

      s(iloc) = s(iloc) + 1;
      break;

    end

  end

  return
end
