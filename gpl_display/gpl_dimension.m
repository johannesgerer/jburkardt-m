function value = gpl_dimension ( filename )

%*****************************************************************************80
%
%% GPL_DIMENSION determines the "dimension" of the data in a GPL file.
%
%  Discussion:
%
%    A satisfactory GPL file contains only three kinds of records:
%    * comment lines begin with a "#" and are ignored;
%    * blank lines;
%    * lines with exactly N numeric values;
%
%    This function attempts to determine the value of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the file.
%
%    Output, integer VALUE, the "dimension" of the data.
%    -2, inconsistent data was found.
%    -1, no data was found at all.
%     0, only empty lines were read.
%     n, every nonempy line contains N values.
%
  file = fopen ( filename, 'rt' );

  d = -1;

  while ( 1 )

    s = fgetl ( file );

    if ( ~ ischar ( s ) )
      break
    end

    if ( length ( s ) < 1 )
      continue
    end

    if ( s(1) == '#' )
      continue;
    end

    d2 = s_word_count ( s );

    if ( d == -1 )
      d = d2;
    elseif ( d == d2 )

    elseif ( d == 0 )
      d = d2;
    else
      d = -2;
      break
    end

  end

  fclose ( file );

  value = d;

  return
end
