function n = r8vec_read_size ( input_file )

%*****************************************************************************80
%
%% R8VEC_READ_SIZE reads the size of an R8VEC from a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE, the name of the file to be read.
%
%    Output, integer N, the size of the R8VEC.
%
  n = 0

  input_unit = fopen ( input_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_READ_SIZE - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8VEC_READ_SIZE - Error!' );
    return;
  end

  while ( 1 )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    n = n + 1;

  end

  fclose ( input_unit );

  return
end
