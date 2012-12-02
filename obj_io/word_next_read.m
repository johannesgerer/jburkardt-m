function [ word, done ] = word_next_read ( s, done )

%*****************************************************************************80
%
%% WORD_NEXT_READ "reads" words from a string, one at a time.
%
%  Special cases:
%
%    The following characters are considered to be a single word,
%    whether surrounded by spaces or not:
%
%      " ( ) { } [ ]
%
%    Also, if there is a trailing comma on the word, it is stripped off.
%    This is to facilitate the reading of lists.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, a string, presumably containing words
%    separated by spaces.
%
%    Input, logical DONE.
%    TRUE, if we are beginning a new string;
%    FALSE, if we are continuing to process the current string.
%
%    Output, string WORD.
%    If DONE is FALSE, then WORD contains the "next" word read.
%    If DONE is TRUE, then WORD is blank, because there was no more to read.
%
%    Output, logical DONE.
%      FALSE if another word was read,
%      TRUE if no more words could be read.
%
  persistent lenc;
  persistent next;
  
  tab = char ( 9 );
%
%  We "remember" LENC and NEXT from the previous call.
%
%  An input value of DONE = TRUE signals a new line of text to examine.
%
  if ( done )

    next = 1;
    done = 0;
    lenc = s_len_trim ( s );

    if ( lenc <= 0 )
      done = 1;
      word = ' ';
      return
    end

  end
%
%  Beginning at index NEXT, search the string for the next nonblank,
%  which signals the beginning of a word.
%
  ilo = next;
%
%  ...S(NEXT:) is blank.  Return with WORD = ' ' and DONE = TRUE.
%
  while ( 1 )

    if ( lenc < ilo )
      word = ' ';
      done = 1;
      next = lenc + 1;
      return
    end
%
%  If the current character is blank, skip to the next one.
%
    if ( s(ilo) ~= ' ' & s(ilo) ~= tab )
      break
    end

    ilo = ilo + 1;

  end
%
%  ILO is the index of the next nonblank character in the string.
%
%  If this initial nonblank is a special character,
%  then that's the whole word as far as we're concerned,
%  so return immediately.
%
  if ( s(ilo) == '"' | ...
       s(ilo) == '(' | ...
       s(ilo) == ')' | ...
       s(ilo) == '{' | ...
       s(ilo) == '}' | ...
       s(ilo) == '[' | ...
       s(ilo) == ']' )

    word = s(ilo);
    next = ilo + 1;
    return

  end
%
%  Now search for the last contiguous character that is not a
%  blank, TAB, or special character.
%
  next = ilo + 1;

  while ( next <= lenc )

    if ( s(next) == ' ' )
      break;
    elseif ( s(next) == tab )
      break;
    elseif ( s(next) == '"' )
      break;
    elseif ( s(next) == '(' )
      break;
    elseif ( s(next) == ')' )
      break;
    elseif ( s(next) == '{' )
      break;
    elseif ( s(next) == '}' )
      break;
    elseif ( s(next) == '[' )
      break;
    elseif ( s(next) == ']' )
      break;
    end

    next = next + 1;

  end

  if ( s(next-1) == ',' ) 
    word = s(ilo:next-2);
  else
    word = s(ilo:next-1);
  end

  return
end
