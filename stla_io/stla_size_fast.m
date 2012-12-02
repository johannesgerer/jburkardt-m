function [ solid_num, node_num, face_num, text_num ] = stla_size_fast ( ...
  input_file_name )

%*****************************************************************************80
%
%% STLA_SIZE_FAST determines sizes associated with an STLA file.
%
%  Discussion:
%
%    This routine assumes that the file is a legal STLA file.
%
%    To perform checks on the file, call STLA_CHECK first.
%
%    Note that the counts for the number of nodes and edges are
%    overestimates, since presumably, most nodes will be defined several
%    times, once for each face they are part of, and most edges will
%    be defined twice.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2007
%
%  Author:
%
%    Bill Seufzer,
%    NASA, Langley
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Output, integer SOLID_NUM, the number of solids defined.
%    Presumably, this is 1.
%
%    Output, integer NODE_NUM, the number of vertices defined.
%
%    Output, integer FACE_NUM, the number of faces defined.
%
%    Output, integer TEXT_NUM, the number of lines of text.
%
  solid_num = -1;
  node_num = -1;
  face_num = -1;
  text_num = -1;
%
%  If no file input, try to get one from the user.
%
  if ( nargin < 1 )
    input_file_name = input ( 'Enter the name of the ASCII STL file.' );
    if ( isempty ( input_file_name ) )
      return
    end
  end

  input_file_unit = fopen ( input_file_name, 'r' );
  
  if ( input_file_unit < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_SIZE_FAST - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_SIZE_FAST - Fatal error!' )
    return
  end

  solid_num = 0;
  node_num = 0;
  face_num = 0;
  text_num = 0;
%
%  Read the text, one line at a time.
%
  while ( 1 )

    text = fgetl ( input_file_unit );
%
%  On end of input, FGETL returns a -1 instead of a character array.
%
    if ( ~ischar ( text ) )
      break
    end

    text_num = text_num + 1;
%    
%  Left justify the string (no initial blanks).
%  Lowercase the string.
%
    text = lower ( strjust ( text, 'left' ) );
%
%  Locate the first word by finding the indices of the whitespace characters.
%
    blanks = find ( isspace ( text ) == 1 );
%
%  If there are no blanks, the first word is the whole string.
%  Otherwise, the first word is the string before the first blank.
%
    if ( isempty ( blanks ) )
      word1 = text;
    else
      word1 = text(1:blanks(1)-1);
    end
%
%  Count occurrences of "SOLID", "FACET" or "VERTEX".  
%
    switch word1

      case 'solid'
        solid_num = solid_num + 1;
      case 'facet'
        face_num = face_num + 1;
      case 'vertex'
        node_num = node_num + 1;
      otherwise
      
    end
    
  end
%
%  Close the file.
%
  fclose ( input_file_unit );

  return
end
