function xy = xy_data_read ( input_filename, point_num )

%*****************************************************************************80
%
%% XY_DATA_READ reads data from an XY file.
%
%  Discussion:
%
%    The number of points in the file can be determined by calling
%    XY_HEADER_READ first.
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
%    Input, integer POINT_NUM, the number of points.
%
%    Output, real XY(2,POINT_NUM), the point coordinates.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XY_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'XY_DATA_READ - Error!' );
    return;
  end

  i = 0;
  xy = zeros ( 2, point_num );
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( i < point_num )

    text = fgetl ( input_unit );

    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    [ temp, count ] = sscanf ( text, '%f %f' );

    i = i + 1;
    xy(1,i) = temp(1);
    xy(2,i) = temp(2);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
