function [ input_line_num, output_line_num ] = file_unique ( ...
  input_file_name, output_file_name )

%*****************************************************************************80
%
%% FILE_UNIQUE makes a copy of the unique lines of a sorted file.
%
%  Discussion:
%
%    Actually, the input file doesn't have to be sorted.  The routine
%    simply reads each line of the input file, and writes it to the
%    output file if it is distinct from the previous input line.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
%    Input, string OUTPUT_FILE_NAME, the name of the output file.
%
%    Output, integer INPUT_LINE_NUM, the number of lines in the input file.
%
%    Output, integer OUTPUT_LINE_NUM, the number of lines in the output file.
%
  input_line_num = 0;
  output_line_num = 0;
  line_old = ' ';

  input_unit = fopen ( input_file_name );

  if ( input_unit = -1 )
    nword = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_UNIQUE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the input file:\n' );
    fprintf ( 1, '"%s".\n', input_file_name );
    return
  end

  output_unit = fopen ( output_file_name );

  if ( output_unit = -1 )
    nword = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_UNIQUE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '"%s".\n', output_file_name );
    return
  end

  while ( 1 )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    input_line_num = input_line_num + 1;

    if ( input_line_num == 1 || line ~= line_old )

      fprintf ( output_unit, '%s', line );

      output_line_num = output_line_num + 1;
      line_old = line;

    end

  end

  fclose ( input_unit );

  fclose ( output_unit );

  return
end
