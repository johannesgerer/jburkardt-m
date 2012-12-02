function auto_cell = automobile_read ( input_filename )

%*****************************************************************************80
%
%% AUTOMOBILE_READ reads data from the automobile dataset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A Frank, A Asuncion,
%    UCI Machine Learning Repository,
%    http://archive.ics.uci.edu/ml,
%    School of Information and Computer Science,
%    University of California, Irvine, California.
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Output, cell array AUTO_CELL(205,26), the information from the file.
%
  auto_cell = cell ( 205, 26 );
%
%  Open the file.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'AUTOMOBILE_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'AUTOMOBILE_READ - Error!' );
  end
%
%  Read the records.
%
  i = 0;

  while ( 1 )

    line = fgets ( input_unit );

    if ( line == -1 )
      break
    end
%
%  Read the I-th record.
%
    i = i + 1;
%
%  Replace commas by spaces, so the line consists of 26 "words".
%
    line = s_replace_ch ( line, ',', ' ' );
%
%  Replace ? by -1, so missing values are marked.
%
    line = s_replace_ch_by_s ( line, '?', '-1' );
%
%  Read the 26 words, using an integer format for the first word,
%  a real format for others, and a string format for others.
%
    done = 1;

    for j = 1 : 26
      [ w, done ] = word_next_read ( line, done );
      if ( j == 1 )
        auto_cell{i,j} = sscanf ( w, '%d' );
      elseif ( j == 2 || j == 10 || j == 12 || j == 13 || j == 14 || j == 17 || ...
               j == 19 || j == 20 || j == 21 || j == 22 || j == 23 || j == 24 || ...
               j == 25 || j == 26 )
        auto_cell{i,j} = sscanf ( w, '%f' );
      else
        auto_cell{i,j} = w;
      end
    end

  end

  fclose ( input_unit );

  if ( i ~= 205 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'AUTOMOBILE_READ - Warning!\n' );
    fprintf ( 1, '  The data file should contain 205 records.\n' );
    fprintf ( 1, '  This program found %d records.\n', i );
  end

  return
end
function s = s_replace_ch ( s, c1, c2 )

%*****************************************************************************80
%
%% S_REPLACE_CH replaces all occurrences of one character by another.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, character S(*), the string.
%
%    Input, character C1, C2, the character to be replaced, and the
%    replacement character.
%
  for i = 1 : length ( s )
    if ( s(i) == c1 )
      s(i) = c2;
    end
  end

  return
end
function s_new = s_replace_ch_by_s ( s_old, c, s_rep )

%*****************************************************************************80
%
%% S_REPLACE_CH_BY_S replaces all occurrences of a character by a string.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S_OLD, the string to be modified.
%
%    Input, character C, the character to be replaced.
%
%    Input, string S_REP, the replacement string.
%
%    Output, string S_NEW, the modified string.
%
  n_old = length ( s_old );
  n_rep = length ( s_rep );
  
  i_new = 1;
  
  for i_old = 1 : n_old

    if ( s_old(i_old) ~= c )
      s_new(i_new) = s_old(i_old);
      i_new = i_new + 1;
    else
      s_new(i_new:i_new+n_rep-1) = s_rep;
      i_new = i_new + n_rep;
    end

  end

  return
end
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
%    13 December 2005
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
    lenc = length ( s );

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
    if ( s(ilo) ~= ' ' && s(ilo) ~= tab )
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
  if ( s(ilo) == '"' || ...
       s(ilo) == '(' || ...
       s(ilo) == ')' || ...
       s(ilo) == '{' || ...
       s(ilo) == '}' || ...
       s(ilo) == '[' || ...
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
