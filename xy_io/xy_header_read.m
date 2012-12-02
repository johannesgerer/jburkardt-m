function point_num = xy_header_read ( input_filename )

%*****************************************************************************80
%
%% XY_HEADER_READ determines the number of pairs of data in an XY file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    XY coordinates, which each contain one pair of real values.
%
%    The routine ignores comments and blank lines and returns
%    the number of lines containing XY coordinates.
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
%    Output, integer POINT_NUM, the number of points in the file.
%
  point_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XY_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XY_HEADER_READ - Error!' );
  end
%
%  Read every line in the file.
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( 1 )

    text = fgetl ( input_unit );

    if ( text == -1 )
      break;
    end
    
    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    [ temp, count ] = sscanf ( text, '%f %f' );

    point_num = point_num + 1;

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end

