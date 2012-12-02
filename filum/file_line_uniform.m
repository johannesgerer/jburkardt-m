function [ line, line_index, line_num, seed ] = file_line_uniform ( ...
  file_name, seed )

%*****************************************************************************80
%
%% FILE_LINE_UNIFORM returns a random line from a file.
%
%  Discussion:
%
%    The file is assumed to be a simple text file.
%
%    The algorithm used is interesting because it does not require
%    the number of lines in the file to be known in advance, and it
%    only reads the file once.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Tom Christiansen, Nathan Torkington,
%    "8.6: Picking a Random Line from a File",
%    Perl Cookbook, pages 284-285,
%    O'Reilly, 1999.
%
%  Parameters:
%
%    Input, string FILE_NAME, the name of the file.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, string LINE, a random line from the file.
%
%    Output, integer LINE_INDEX, the index of the chosen line.
%
%    Output, integer LINE_NUM, the number of lines in the file.
%
%    Output, integer SEED, a seed for the random number generator.
%
  line_num = 0;
  line_index = -1;
  line = ' ';
  line_read = ' ';
%
%  Open the file.
%
  input_unit = fopen ( file_name );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_LINE_UNIFORM - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s%.\n', file_name );
    error ( 'FILE_LINE_UNIFORM - Error!' );
    return;
  end
%
%  Read the lines.
%
  while ( 1 )

    line_read = fgetl ( input_unit );

    if ( line == -1 )
      break;
    end

    line_num = line_num + 1;

    [ r, seed ] = r8_uniform_01 ( seed );

    if ( r * line_num <= 1.0 )

      line = line_read;
      line_index = line_num;

    end

  end

  fclose ( input_unit );

  return
end
