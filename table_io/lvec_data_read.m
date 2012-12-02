function table = lvec_data_read ( input_filename,  n )

%*****************************************************************************80
%
%% LVEC_DATA_READ reads data from an LVEC file.
%
%  Discussion:
%
%    An LVEC is a vector of L's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer N, the number of columns in the data.
%
%    Output, integer TABLE(N), the data.
%
  table = zeros ( n, 1 );

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LVEC_DATA_READ - Error!\n' );
      fprintf ( 1, '  End of input while reading data.\n' );
      error ( 'LVEC_DATA_READ - Error!' );
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      i = i + 1;
      table(i) = s_to_l ( line );

    end

  end

  fclose ( input_unit );

  return
end
