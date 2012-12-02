function value = file_tag_check ( file_name, left, right )

%*****************************************************************************80
%
%% FILE_TAG_CHECK checks a file for generalized parenthesis errors.
%
%  Discussion:
%
%    The check made is that the current number of left "parentheses" read must
%    always be at least as great as the number of right "parentheses" read.
%    Moreover, when we reach the end of the file, the numbers must be equal.
%
%    Typical examples of left and right parentheses might be:
%
%    (), [], {}, <>, <P> </P>, 'do' 'end do'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file.
%
%    Input, string LEFT, RIGHT, the left and right
%    parentheses marks.
%
%    Output, logical VALUE, is TRUE if the file passed the tag check.
%
  sum_p = 0;
  left_len = s_len_trim ( left );
  right_len = s_len_trim ( right );
%
%  Open the file.
%
  file_unit = fopen ( file_name );

  if ( file_unit = -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_TAG_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file:\n' );
    fprintf ( 1, '"%s".\n', file_name );
    value = 0;
    return
  end

  line_num = 0;

  while ( 1 )

    line = fgets ( fid );

    if ( line == -1 )
      break;
    end

    line_copy = line;

    line_num = line_num + 1;

    line_len = s_len_trim ( line );

    while ( 1 )

      left_pos = s_index ( line, left )

      if ( left_pos == 0 )
        left_pos = line_len + 1;
      end

      right_pos = s_index ( line, right )

      if ( right_pos == 0 )
        right_pos = line_len + 1;
      end

      if ( left_pos < right_pos )

        sum_p = sum_p + 1;
        line = s_adjustl ( line(left_pos+left_len:) )
        line_len = s_len_trim ( line );

      elseif ( right_pos < left_pos )

        sum_p = sum_p - 1;
        line = s_adjustl ( line(right_pos+right_len:) );
        line_len = s_len_trim ( line );

        if ( sum_p < 0 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'FILE_TAG_CHECK - Warning!\n' );
          fprintf ( 1, '  Tag error in the file:\n' );
          fprintf ( 1, '    "%s".\n', file_name );
          fprintf ( 1, '  An illegal right tag occurs on line %d\n', line_num );
          fprintf ( 1, '    %s\n', line_copy );
          fclose ( file_unit );
          value = 0;
          return
        end

      else

        break;

      end

    end

  end

  fclose ( file_unit );

  if ( sum_p ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_TAG_CHECK - Warning!\n' );
    fprintf ( 1, '  Tag error in the file:\n' );
    fprintf ( 1, '    "%s".', file_name );
    fprintf ( 1, '  Number of missing right tags: %d\n', sum_p );
    value = 0;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_TAG_CHECK - Note:\n' );
    fprintf ( 1, '  Tag checks passed for file:\n' );
    fprintf ( 1, '    "%s".\n', file_name );
    value = 1;
  end

  return
end
