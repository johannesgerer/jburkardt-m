function [ node_xyz, face_node, face_normal ] = stla_read ( ...
  input_file_name, node_num, face_num )

%*****************************************************************************80
%
%% STLA_READ reads graphics information from an ASCII StereoLithography file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2007
%
%  Author:
%
%    John Burkardt
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
    [ solid_num, node_num, face_num, text_num ] = stla_size ( ...
      input_file_name );  
  end
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );

  if ( input_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_READ - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_READ - Fatal error!' )
    return
  end
%
%  Allocate space.
%
  state = 0;
  text_num = 0;
  
  solid = 0;
  face = 0;
  node = 0;

  node_xyz = zeros ( 3, node_num );
  face_node = zeros ( 3, face_num );
  face_normal = zeros ( 3, face_num );
%
%  Read the next line of text.
%
  while ( 1 )

    text = fgetl ( input_file_unit );
%
%  On end of input, FGETL returns a -1 instead of a character array.
%
    if ( text == -1 )
      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  End-of-file, but model not finished.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end
      break;
    end

    text_num = text_num + 1;
    done = 1;
%
%  Read the first word in the line.
%
    [ word1, done ] = word_next_read ( text, done );

    if ( done )
      break
    end
%
%  "Doctor" the text, changing a beginning occurrence of:
%
%      END FACET to ENDFACET
%      END LOOP to ENDLOOP
%      END SOLID to ENDSOLID
%      FACET NORMAL to FACETNORMAL
%      OUTER LOOP to OUTERLOOP
%
    if ( s_eqi ( word1, 'END' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'FACET' ) & ...
           ~s_eqi ( word2, 'LOOP' ) & ...
           ~s_eqi ( word2, 'SOLID' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag END was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word );
        fprintf ( 1, '  "FACET", "LOOP", or "SOLID".\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'FACET' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'NORMAL' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag FACET was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word2 );
        fprintf ( 1, '  "NORMAL".\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'OUTER' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'LOOP' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag OUTER was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word2 );
        fprintf ( 1, '  "LOOP".\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      word1 = s_cat ( word1, word2 );

    end
%
%  This first word tells us what to do.
%
%  SOLID - begin a new solid.
%    Valid in state 0, moves to state 1.
%  ENDSOLID - end current solid.
%    Valid in state 1, moves to state 0.
%
%  FACETNORMAL - begin a new facet.
%    Valid in state 0 or 1, moves to state 2.
%  ENDFACET - end current facet.
%    Valid in state 2, moves to state 1.
%
%  OUTERLOOP - begin a list of vertices.
%    Valid in state 2, moves to state 3, sets vertex count to 0.
%  ENDLOOP - end vertex list.
%    Valid in state 3, moves to state 2.
%
%  VERTEX - give coordinates of next vertex.
%    Valid in state 3.
%
%  End of file -
%    Valid in state 0 or 1.
%
    if ( s_eqi ( word1, 'SOLID' ) )

      if ( state ~= 0 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  A new SOLID statement was encountered, but we\n' );
        fprintf ( 1, '  have not finished processing the current solid.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'ENDSOLID' ) )

      if ( state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  An END SOLID statement was encountered, but\n' );
        fprintf ( 1, '  either we have not begun a solid at all, or we\n' );
        fprintf ( 1, '  are not at an appropriate point to finish the\n' );
        fprintf ( 1, '  current solid.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 0;

    elseif ( s_eqi ( word1, 'FACETNORMAL' ) )

      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for FACET.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 2;
      face = face + 1;

      if ( face_num < face )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Warning!\n' );
        fprintf ( 1, '  More faces being read than expected.\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      for i = 1 : 3

        face_normal(i,face) = 0.0;

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  End of information while reading a component\n' );
          fprintf ( 1, '  of the normal vector.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  Reading a component of the normal vector.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        face_normal(i,face) = dval;

      end

    elseif ( s_eqi ( word1, 'ENDFACET' ) )

      if ( state ~= 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for ENDFACET.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'OUTERLOOP' ) )

      if ( state ~= 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for OUTERLOOP.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 3;
      vertex = 0;

    elseif ( s_eqi ( word1, 'ENDLOOP' ) )

      if ( state ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for ENDLOOP.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      state = 2;

    elseif ( s_eqi ( word1, 'VERTEX' ) )

      if ( state ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for VERTEX.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      if ( 3 <= vertex )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  More than 3 vertices specified for a face.\n' );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  The value of a vertex coordinate is missing.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_READ - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  The value of a vertex coordinate makes\n' );
          fprintf ( 1, '  no sense.\n' );
          error ( 'STLA_READ - Fatal error!' );
          return
        end

        temp(i) = dval;

      end

      if ( node_num <= node )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_READ - Warning!\n' );
        fprintf ( 1, '  More nodes being read than expected.\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        error ( 'STLA_READ - Fatal error!' );
        return
      end

      node = node + 1;
      node_xyz(1:3,node) = temp(1:3);

      vertex = vertex + 1;
      face_node(vertex,face) = node;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'STLA_READ - Fatal error!\n' );
      fprintf ( 1, '  File line number = %d\n', text_num );
      fprintf ( 1, '  Unrecognized line in file.\n' );
      error ( 'STLA_READ - Fatal error!' );
      return

    end

  end
%
%  Close the file.
%
  fclose ( input_file_unit );

  return
end
