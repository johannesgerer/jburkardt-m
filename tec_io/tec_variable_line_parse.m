function [ variable_num, variable_name_length, variable_name ] ...
  = tec_variable_line_parse ( line )

%*****************************************************************************80
%
%% TEC_VARIABLE_LINE_PARSE parses the "VARIABLES=" line of a TEC file.
%
%  Discussion:
%
%    The string begins with the substring "VARIABLES=" and is followed by
%    a sequence of variable names which may be quoted.  The names are
%    separated by spaces, commas or quotes.  Blanks may appear here and there.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string LINE, a string of characters, representing the
%    "VARIABLES=" line of the file.
%
%    Output, integer VARIABLE_NUM, the number of variable names found.
%
%    Output, integer VARIABLE_NAME_LENGTH, the length of the variable
%    names.
%
%    Output, string VARIABLE_NAME(*), the variable names, packed in
%    sequence.
%

%
%  Remove the initial "VARIABLES="
%
  line = s_behead_substring ( line, 'VARIABLES' );
  line = s_behead_substring ( line, '=' );
%
%  Replace single quotes, double quotes, commas and periods by blanks.
%
  line = s_replace_ch ( line, '''', ' ' );
  line = s_replace_ch ( line, '"', ' ' );
  line = s_replace_ch ( line, ',', ' ' );
  line = s_replace_ch ( line, '.', ' ' );
%
%  Count the words.
%
  variable_num = s_word_count ( line );
%
%  Extract the words.
%
  begin = 0;
  for variable = 1 : variable_num
    [ name, line ] = s_word_extract ( line );
    name_len = s_len_trim ( name );
    variable_name_length(variable) = name_len;
    variable_name(begin+1:begin+name_len) = name(1:name_len);
    begin = begin+name_len;
  end

  return
end
