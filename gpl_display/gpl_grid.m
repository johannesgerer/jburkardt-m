function [ x, y, z ] = gpl_grid ( filename, m, n )

%*****************************************************************************80
%
%% GPL_GRID reads a GPL file of grid data.
%
%  Discussion:
%
%    The GPL file is assumed to consist of data of the following form:
%
%      x11 y11 z11
%      x21 y21 z21
%      ...
%      xm1 ym1 zm1
%
%      x12 y12 z12
%      x22 y22 z22
%      ...
%      xm2 ym2 zm2
%      
%      (also columns 3 through n-1)
%      
%      x1n y1n z1n
%      x2n y2n z2n
%      ...
%      xmn ymn zmn
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real X(M,N), Y(M,N), Z(M,N), the 3 sets of data.
%
  x = zeros ( m, n );
  y = zeros ( m, n );
  z = zeros ( m, n );

  file = fopen ( filename, 'rt' );

  line_num = 0;

  for j = 1 : n

    for i = 1 : m

      while ( 1 )

        line_num = line_num + 1;
        s = fgetl ( file );
%
%  Unexpected end of file?
%
        if ( ~ ischar ( s ) )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_GRID - Fatal error!\n' );
          fprintf ( 1, '  Unexpected end of file reading line %d\n', line_num );
          error ( 'GPL_GRID - Fatal error!\n' );
        end
%
%  Unexpected empty line?
%
        if ( length ( s ) < 1 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_GRID - Fatal error!\n' );
          fprintf ( 1, '  Unexpected empty record, reading line %d\n', line_num );
          error ( 'GPL_GRID - Fatal error!\n' );
        end
%
%  Comments are OK.
%
        if ( s(1) ~= '#' )
          break
        end

      end
%
%  Otherwise, X, Y, Z
%
      [ xyz, count ] = sscanf ( s, '%f%f%f' );
%
%  Failed to read 3 things?
%
      if ( count ~= 3 )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'GPL_GRID - Fatal error!\n' );
        fprintf ( 1, '  Did not get 3 data items on line %d\n', line_num );
        error ( 'GPL_GRID - Fatal error!\n' );
      end

      x(i,j) = xyz(1);
      y(i,j) = xyz(2);
      z(i,j) = xyz(3);

    end
%
%  Read one blank separator line.
%
    if ( j < n )
      line_num = line_num + 1;
      s = fgetl ( file );
      if ( 1 <= length ( s ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'GPL_GRID - Fatal error!\n' );
        fprintf ( 1, '  Unexpected nonempty record at line %d\n', line_num );
        error ( 'GPL_GRID - Fatal error!\n' );
      end;
    end

  end

  fclose ( file );

  return
end
