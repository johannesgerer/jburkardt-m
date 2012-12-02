function check = stla_check ( input_file_name )

%*****************************************************************************80
%
%% STLA_CHECK checks an ASCII StereoLithography file.
%
%  Example:
%
%    solid MYSOLID
%      facet normal 0.4 0.4 0.2
%        outerloop
%          vertex  1.0 2.1 3.2
%          vertex  2.1 3.7 4.5
%          vertex  3.1 4.5 6.7
%        end loop
%      end facet
%      ...
%      facet normal 0.2 0.2 0.4
%        outerloop
%          vertex  2.0 2.3 3.4
%          vertex  3.1 3.2 6.5
%          vertex  4.1 5.5 9.0
%        end loop
%      end facet
%    end solid MYSOLID
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
%    Output, logical CHECK, is TRUE if the file is legal.
%
  state = 0;
  text_num = 0;
%
%  Open the file.
%
  input_file_unit = fopen ( input_file_name, 'r' );

  if ( input_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', input_file_name );
    check = 0;
    return
  end
%
%  Read the next line of text.
%
  while ( 1 )

    text = fgetl ( input_file_unit );

    if ( text == -1 )
      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  End-of-file, but model not finished.\n' );
        check = 0;
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
      fprintf ( 1, '\n' );
      fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
      fprintf ( 1, '  File line number = %d\n', text_num );
      fprintf ( 1, '  No information on line.\n' );
      check = 0;
      return
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
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag END was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word );
        fprintf ( 1, '  "FACET", "LOOP", or "SOLID".\n' );
        check = 0;
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'FACET' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'NORMAL' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag FACET was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word2 );
        fprintf ( 1, '  "NORMAL".\n' );
        check = 0;
        return
      end

      word1 = s_cat ( word1, word2 );

    elseif ( s_eqi ( word1, 'OUTER' ) )

      [ word2, done ] = word_next_read ( text, done );

      if ( ~s_eqi ( word2, 'LOOP' ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  The tag OUTER was followed by an illegal\n' );
        fprintf ( 1, '  word: "%s", when expecting\n', word2 );
        fprintf ( 1, '  "LOOP".\n' );
        check = 0;
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
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  A new SOLID statement was encountered, but we\n' );
        fprintf ( 1, '  have not finished processing the current solid.\n' );
        check = 0;
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'ENDSOLID' ) )

      if ( state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  An END SOLID statement was encountered, but\n' );
        fprintf ( 1, '  either we have not begun a solid at all, or we\n' );
        fprintf ( 1, '  are not at an appropriate point to finish the\n' );
        fprintf ( 1, '  current solid.\n' );
        check = 0;
        return
      end

      state = 0;

    elseif ( s_eqi ( word1, 'FACETNORMAL' ) )

      if ( state ~= 0 & state ~= 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for FACET.\n' );
        check = 0;
        return
      end

      state = 2;

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  End of information while reading a component\n' );
          fprintf ( 1, '  of the normal vector.\n' );
          check = 0;
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  Reading a component of the normal vector.\n' );
          check = 0;
          return
        end

      end

    elseif ( s_eqi ( word1, 'ENDFACET' ) )

      if ( state ~= 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for ENDFACET.\n' );
        check = 0;
        return
      end

      state = 1;

    elseif ( s_eqi ( word1, 'OUTERLOOP' ) )

      if ( state ~= 2 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for OUTERLOOP.\n' );
        check = 0;
        return
      end

      state = 3;
      vertex = 0;

    elseif ( s_eqi ( word1, 'ENDLOOP' ) )

      if ( state ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for ENDLOOP.\n' );
        check = 0;
        return
      end

      state = 2;

    elseif ( s_eqi ( word1, 'VERTEX' ) )

      if ( state ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  Model not in right state for VERTEX.\n' );
        check = 0;
        return
      end

      if ( 3 <= vertex )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
        fprintf ( 1, '  File line number = %d\n', text_num );
        fprintf ( 1, '  More than 3 vertices specified for a face.\n' );
        check = 0;
        return
      end

      for i = 1 : 3

        [ word2, done ] = word_next_read ( text, done );

        if ( done )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  The value of a vertex coordinate is missing.\n' );
          check = 0;
          return
        end

        [ dval, lchar, ierror ] = s_to_r8 ( word2 );

        if ( ierror ~= 0 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
          fprintf ( 1, '  File line number = %d\n', text_num );
          fprintf ( 1, '  The value of a vertex coordinate makes\n' );
          fprintf ( 1, '  no sense.\n' );
          check = 0;
          return
        end

      end

      vertex = vertex + 1;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'STLA_CHECK - Fatal error!\n' );
      fprintf ( 1, '  File line number = %d\n', text_num );
      fprintf ( 1, '  Unrecognized line in file.\n' );
      check = 0;
      return

    end

  end
%
%  Close the file.
%
  fclose ( input_file_unit );

  check = 1;

  return
end
