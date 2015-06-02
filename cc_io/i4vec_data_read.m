function table = i4vec_data_read ( input_filename, n )

%*****************************************************************************80
%
%% I4VEC_HEADER_READ reads data from an I4VEC file.
%
%  Discussion:
%
%    An I4VEC is a vector of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer N, the number of rows of data.
%
%    Output, integer TABLE(N), the point coordinates.
%
  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'I4VEC_DATA_READ - Error!' );
  end

  table = zeros(n,1);

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, '%d' );

      if ( count == 1 )
        i = i + 1;
        table(i,1) = x;
      end

    end

  end

  fclose ( input_unit );

  return
end
