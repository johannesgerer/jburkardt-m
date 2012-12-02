function [ line_pointer, line_data ] = xyzl_data_read ( input_filename, ...
  line_num, line_data_num )

%*****************************************************************************80
%
%% XYZL_DATA_READ reads the data in an XYZL file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    LINE ITEMS, which are indices of points on a line.
%
%    The routine ignores comments and blanks and returns
%    the number of line items.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer LINE_NUM, the number of lines.
%
%    Input, integer LINE_DATA_NUM, the number of line items.
%
%    Output, integer LINE_POINTER(LINE_NUM+1), pointers to the
%    first line item for each line.
%
%    Output, integer LINE_DATA(LINE_DATA_NUM), the line items.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZL_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XYZL_DATA_READ - Error!' );
    return;
  end

  line = 0;
  line_pointer(1) = 1;
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( line < line_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' || s_len_trim ( text ) == 0 )
      continue
    end

    line = line + 1;

    n = s_word_count ( text );
    line_pointer(line+1) = line_pointer(line) + n;

    ilo = line_pointer(line);
    ihi = line_pointer(line+1) - 1;

    [ temp, count ] = sscanf ( text, '%d' );

    line_data(ilo:ihi) = temp(1:count);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
