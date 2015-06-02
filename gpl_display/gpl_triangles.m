function [ x, y, z ] = gpl_triangles ( filename, n )

%*****************************************************************************80
%
%% GPL_TRIANGLES translates a GPL file of triangle data.
%
%  Discussion:
%
%    The GPL file is assumed to consist of data defining (X,Y,Z(X,Y))
%    values for N triangles, of the form:
%
%      ax1 ay1 az1
%      bx1 by1 bz1
%      cx1 cy1 cz1
%      ax1 ay1 az1
%      (blank line #1)
%      (blank line #2)
%      ax2 ay2 az2
%      bx2 by2 bz2
%      cx2 cy2 cz2
%      ax2 ay2 az2
%      (blank line #1)
%      (blank line #2)
%      ax3 ay3 az3
%      ...
%      axn ayn azn
%      bxn byn bzn
%      cxn cyn czn
%      axn ayn azn
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
%    Input, integer N, the number of sets of data
%
%    Output, real X(3,N), Y(3,N), Z(3,N), the data.
%
  x = zeros ( 3, n );
  y = zeros ( 3, n );
  z = zeros ( 3, n );

  file = fopen ( filename, 'rt' );

  line_num = 0;

  for j = 1 : n

    for i = 1 : 4

      while ( 1 )

        line_num = line_num + 1;
        s = fgetl ( file );
%
%  Unexpected end of file?
%
        if ( ~ ischar ( s ) )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_TRIANGLES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected end of file reading line %d\n', line_num );
          error ( 'GPL_TRIANGLES - Fatal error!\n' );
        end
%
%  Unexpected empty line?
%
        if ( length ( s ) < 1 )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'GPL_TRIANGLES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected empty record, reading line %d\n', line_num );
          error ( 'GPL_TRIANGLES - Fatal error!\n' );
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
        fprintf ( 1, 'GPL_TRIANGLES - Fatal error!\n' );
        fprintf ( 1, '  Did not get 3 data items on line %d\n', line_num );
        error ( 'GPL_TRIANGLES - Fatal error!\n' );
      end
%
%  The fourth line repeats the first, and we don't need it.
%
      if ( i <= 3 )
        x(i,j) = xyz(1);
        y(i,j) = xyz(2);
        z(i,j) = xyz(3);
      end

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
          fprintf ( 1, 'GPL_TRIANGLES - Fatal error!\n' );
          fprintf ( 1, '  Unexpected nonempty record at line %d\n', line_num );
          error ( 'GPL_TRIANGLES - Fatal error!\n' );
        end;
      end
    end

  end

  fclose ( file );

  return
end
