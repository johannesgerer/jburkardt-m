function x = gpl_curve ( filename, m, n )

%*****************************************************************************80
%
%% GPL_CURVE reads a GPL file of 1D, 2D or 3D data.
%
%  Discussion:
%
%    The GPL file is assumed to consist of a single list of 1D, 2D or 3D data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the input file.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of data values.
%
%    Output, real X(M,N), the data.
%
  x = zeros ( m, n );

  file = fopen ( filename, 'rt' );

  line_num = 0;

  for j = 1 : n

    while ( 1 )

      line_num = line_num + 1;
      s = fgetl ( file );
%
%  Unexpected end of file?
%
      if ( ~ ischar ( s ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'GPL_CURVE - Fatal error!\n' );
        fprintf ( 1, '  Unexpected end of file reading line %d\n', line_num );
        error ( 'GPL_CURVE - Fatal error!\n' );
      end
%
%  Unexpected empty line?
%
      if ( length ( s ) < 1 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'GPL_CURVE - Fatal error!\n' );
        fprintf ( 1, '  Unexpected empty record, reading line %d\n', line_num );
        error ( 'GPL_CURVE - Fatal error!\n' );
      end
%
%  Comments are OK.
%
      if ( s(1) ~= '#' )
        break
      end

    end
%
%  Otherwise, read X
%
    [ values, count ] = sscanf ( s, '%f' );
%
%  Failed to read M things?
%
    if ( count ~= m )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'GPL_CURVE - Fatal error!\n' );
      fprintf ( 1, '  Did not get %d data items on line %d\n', m, line_num );
      error ( 'GPL_CURVE - Fatal error!\n' );
    end

    x(1:m,j) = values(1:m)';

  end

  fclose ( file );

  return
end
