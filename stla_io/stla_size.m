function [ solid_num, node_num, face_num, text_num ] = stla_size ( ...
  input_file_name )

%*****************************************************************************80
%
%% STLA_SIZE determines sizes associated with an STLA file.
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
%    Output, integer SOLID_NUM, the number of solids defined.
%    Presumably, this is 1.
%
%    Output, integer NODE_NUM, the number of vertices defined.
%
%    Output, integer FACE_NUM, the number of faces defined.
%
%    Output, integer TEXT_NUM, the number of lines of text.
%
  ierror = 0;
  state = 0;

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
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );

  if ( input_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    error ( 'STLA_SIZE - Fatal error!' );
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

    if ( text == -1 )
      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_SIZE - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  End-of-file, but model not finished.\n' );
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
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'FACET' ) )

      [word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'NORMAL' ) )
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'OUTER' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'LOOP' ) )
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
%    Valid in state 2, moves to state 3.
%  ENDLOOP - end vertex list.
%    Valid in state 3, moves to state 2.
%
%  VERTEX - give coordinates of next vertex.
%    Valid in state 3 if current vertex count is 0, 1 or 2.
%
%  End of file -
%    Valid in state 0 or 1.
%
    if ( s_eqi ( word1, 'SOLID' ) )

      if ( state ~= 0 )
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'ENDSOLID' ) )

      if ( state ~= 1 )
        return
      end

      state = 0;
      solid_num = solid_num + 1;

    elseif ( s_eqi ( word1, 'FACETNORMAL' ) )

      if ( state ~= 0 & state ~= 1 )
        return
      end

      state = 2;

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          return
        end

      end

    elseif ( s_eqi ( word1, 'ENDFACET' ) )

      if ( state ~= 2 )
        return
      end

      state = 1;

      face_num = face_num + 1;

    elseif ( s_eqi ( word1, 'OUTERLOOP' ) )

      if ( state ~= 2 )
        return
      end

      state = 3;
      vertex = 0;

    elseif ( s_eqi ( word1, 'ENDLOOP' ) )

      if ( state ~= 3 )
        return
      end

      state = 2;

    elseif ( s_eqi ( word1, 'VERTEX' ) )

      if ( state ~= 3 )
        return
      end

      if ( 3 <= vertex )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_SIZE - Fatal error!\n' );
        fprintf ( 1, '  Too many vertices for a face.\n' );
        ierror = 1;
        return
      end

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          return
        end

      end

      vertex = vertex + 1;
      node_num = node_num + 1;

    else

      return

    end

  end
%
%  Close the file.
%
  fclose ( input_file_unit );

  return
end
