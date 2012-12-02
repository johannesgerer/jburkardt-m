function s = s_inc_c ( s )

%*****************************************************************************80
%
%% S_INC_C "increments" the characters in a string.
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
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string whose
%    alphabetic successor is desired.
%
%    Output, string S, S has been replaced by its successor. 
%
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
        break;
      end

    elseif ( s(iloc) == 'z' )

      s(iloc) = 'a';
      ihi = iloc - 1;

      if ( ihi <= 0 )
        break;
      end

    else

      s(iloc) = s(iloc) + 1;
      break;

    end

  end

  return
end
