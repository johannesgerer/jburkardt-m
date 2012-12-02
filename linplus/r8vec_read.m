function r = r8vec_read ( input_file, n )

%*****************************************************************************80
%
%% R8VEC_READ reads a R8VEC from a file.
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
%    Input, integer N, the size of the R8VEC.
%
%    Output, real R(N), the R8VEC.
%
  r = [];

  input_unit = fopen ( input_file );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8VEC_READ - Error!' );
    return;
  end

  for k = 1 : n

    [ r(k), count ] = fscanf ( input_file, '%f' );

    if ( count ~= 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8VEC_READ - Fatal error!\n' );
      fprintf ( 1, '  I/O error while reading record %d\n', k );
      error ( 'R8VEC_READ - Fatal error!' );
    end

  end

  fclose ( input_unit );

  return
end
