function [ x, y, z ] = gpl_squares ( filename, n )

%*****************************************************************************80
%
%% GPL_SQUARES translates a GPL file of rectangle data.
%
%  Discussion:
%
%    The GPL file is assumed to consist of data defining (X,Y,Z(X,Y))
%    values for N rectangles, of the form:
%
%      ax1 ay1 az1
%      bx1 by1 bz1
%        (BLANK)
%      cx1 cy1 cz1
%      dx1 dy1 dz1
%        (BLANK)
%        (BLANK)
%      ax2 ay2 az2
%      bx2 by2 bz2
%        (BLANK)
%      cx2 cy2 cz2
%      dx2 dy2 dz2
%        (BLANK)
%        (BLANK)
%      ax3 ay3 az3
%      ...
%      axn ayn azn
%      bxn byn bzn
%      BLANK
%      cxn cyn czn
%      dxn dyn dzn
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the input file.
%
%    Input, integer N, the number of sets of data
%
%    Output, real X(4,N), Y(4,N), Z(4,N), the data.
%
  x = zeros ( 4, n );
  y = zeros ( 4, n );
  z = zeros ( 4, n );

  file = fopen ( filename, 'rt' );

  line_num = 0;

  for j = 1 : n
%
%  Pick up points 1 and 2.
%
    for i = 1 : 2

      while ( 1 )

        line_num = line_num + 1;
        s = fgetl ( file );
%
%  Unexpected end of file?
%
        if ( ~ ischar ( s ) )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected end of file reading line %d\n', line_num );
          error ( 'GPL_SQUARES - Fatal error!\n' );
        end
%
%  Unexpected empty line?
%
        if ( length ( s ) < 1 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected empty record, reading line %d\n', line_num );
          error ( 'GPL_SQUARES - Fatal error!\n' );
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
        fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
        fprintf ( 1, '  Did not get 3 data items on line %d\n', line_num );
        error ( 'GPL_SQUARES - Fatal error!\n' );
      end

      x(i,j) = xyz(1);
      y(i,j) = xyz(2);
      z(i,j) = xyz(3);

    end
%
%  Expect one blank separator line.
%
    line_num = line_num + 1;
    s = fgetl ( file );
    if ( 1 <= length ( s ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
      fprintf ( 1, '  Unexpected nonempty record at line %d\n', line_num );
      error ( 'GPL_SQUARES - Fatal error!\n' );
    end
%
%  Pick up points 4 and 3.
%
    for i = 4 : -1 : 3

      while ( 1 )

        line_num = line_num + 1;
        s = fgetl ( file );
%
%  Unexpected end of file?
%
        if ( ~ ischar ( s ) )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected end of file reading line %d\n', line_num );
          error ( 'GPL_SQUARES - Fatal error!\n' );
        end
%
%  Unexpected empty line?
%
        if ( length ( s ) < 1 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected empty record, reading line %d\n', line_num );
          error ( 'GPL_SQUARES - Fatal error!\n' );
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
        fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
        fprintf ( 1, '  Did not get 3 data items on line %d\n', line_num );
        error ( 'GPL_SQUARES - Fatal error!\n' );
      end

      x(i,j) = xyz(1);
      y(i,j) = xyz(2);
      z(i,j) = xyz(3);

    end
%
%  Read two blank separator lines.
%
    if ( j < n )
      for i = 1 : 2
        line_num = line_num + 1;
        s = fgetl ( file );
        if ( 1 <= length ( s ) )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_SQUARES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected nonempty record at line %d\n', line_num );
          error ( 'GPL_SQUARES - Fatal error!\n' );
        end;
      end
    end

  end

  fclose ( file );

  return
end
