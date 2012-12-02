function [ node_xyz, face_node, face_normal ] = stla_read_fast ( ...
  input_file_name, node_num, face_num )

%*****************************************************************************80
%
%% STLA_READ_FAST reads graphics information from an ASCII StereoLithography file.
%
%  Discussion:
%
%    This routine should be faster than STLA_READ, since it does little
%    error checking, and uses native MATLAB commands like SSCANF to 
%    read the data directly.
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
%    NASA Langley
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
%    Input, integer NODE_NUM, the number of vertices defined.
%
%    Input, integer FACE_NUM, the number of faces defined.
%
%    Output, real NODE_XYZ(3,NODE_NUM), the coordinates of points.
%
%    Output, integer FACE_NODE(3,FACE_NUM), the nodes that make up each face.
%
%    Output, real FACE_NORMAL(3,FACE_NUM), the normal vector
%    at each face.
% 
  node_xyz = [];
  face_node = [];
  face_normal = [];
%
%  If no file input, try to get one from the user.
%
  if ( nargin < 1 )
    input_file_name = input ( 'Enter the name of the ASCII STL file.' );
    if ( isempty ( input_file_name ) )
      return
    end
  end
%
%  If no size input, scan the file.
%
  if ( nargin < 3 )
    [ solid_num, node_num, face_num, text_num ] = stla_size_fast ( ...
      input_file_name );  
  end
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );
  
  if ( input_file_unit < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_READ_FAST - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_READ_FAST - Fatal error!' )
    return
  end
%
%  Allocate space.
%
  solid = 0;
  node = 0;
  face = 0;

  node_xyz = zeros(3,node_num);
  face_node = zeros(3,face_num);
  face_normal = zeros(3,face_num);
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
%    
%  Left justify the string (no initial blanks).
%  Lowercase the string.
%
    text = lower ( strjust ( text, 'left' ) );
%
%  Locate the first word by finding the indices of the whitespace characters.
%
    blanks = find ( isspace ( text ) == 1 );

    if ( isempty ( blanks ) )
      word1 = text;
    else
      word1 = text(1:blanks(1)-1);
    end
%
%  Action depends on initial keyword.
%
    switch word1

       case 'solid'

         solid = solid + 1;

       case 'facet'

         face = face + 1;
         face_normal(:,face) = sscanf ( text, '%*s %*s %f %f %f' );

       case 'vertex'

         node = node + 1;
         node_xyz(:,node) = sscanf ( text, '%*s %f %f %f' );

       case 'endloop'

         face_node(:,face) = [ node-2; node-1; node ];
            
       otherwise

     end

  end
%
%  Close the file.
%
  fclose ( input_file_unit );

  return
end
