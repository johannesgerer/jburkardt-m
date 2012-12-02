function sphere_xyz_display ( xyz_filename )

%*****************************************************************************80
%
%% SPHERE_XYZ_DISPLAY plots a unit sphere and a set of points in 3D.
%
%  Discussion:
%
%    This program is useful if you want to display a set of points that
%    lie on the unit sphere.  By displaying the sphere itself, you hide
%    the points on the far side, and make the layout of the points easier
%    to comprehend.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Usage:
%
%    sphere_xyz_display ( 'filename.xyz' )
%
%  Parameters:
%
%    Input, string XYZ_FILENAME, the name of the file 
%    containing the coordinates of the points.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_XYZ_DISPLAY\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read an XYZ file containing coordinates of points in 3D;\n' );
  fprintf ( 1, '  Display a unit sphere, and the points, in a MATLAB graphics window.\n' );
%
%  First argument is the point file.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPHERE_XYZ_DISPLAY:\n' );
    xyz_filename = input ( '  Enter the name of the XYZ file (in ''quotes''!).\n' );
  end
%
%  Read the data.
%
  point_num = xyz_header_read (  xyz_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the header of "%s".\n', xyz_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of points POINT_NUM  = %d\n', point_num );

  xyz = xyz_data_read ( xyz_filename, point_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read the data in "%s".\n', xyz_filename );

  r8mat_transpose_print_some ( 3, point_num, xyz, 1, 1, ...
    3, 5, '  First 5 nodes:' );
%
%  Generate points that define a sphere.
%  Set C to a constant value that defines a color for the sphere.
%  (The choice and use of an appropriate value for C currently eludes me!)
%  Use SURF to display the sphere.
%  Use HOLD ON so we can now add points to the plot.
%
  [ x, y, z ] = sphere ( 20 );
  c = 0.20 * ones ( size ( z ) );
  surf ( x, y, z, c );
  hold on
%
%  Draw the points as blue dots.
%
  scatter3 ( xyz(1,:), xyz(2,:), xyz(3,:), 'filled', 'b' );

  xyz_min(1) = min ( xyz(1,:) );
  xyz_max(1) = max ( xyz(1,:) );

  xyz_min(2) = min ( xyz(2,:) );
  xyz_max(2) = max ( xyz(2,:) );

  xyz_min(3) = min ( xyz(3,:) );
  xyz_max(3) = max ( xyz(3,:) );

  xyz_range(1:3) = xyz_max(1:3) - xyz_min(1:3);

  margin = 0.025 * max ( xyz_range(1), ...
                   max ( xyz_range(2), xyz_range(3) ) );

  x_min = xyz_min(1) - margin;
  x_max = xyz_max(1) + margin;
  y_min = xyz_min(2) - margin;
  y_max = xyz_max(2) + margin;
  z_min = xyz_min(3) - margin;
  z_max = xyz_max(3) + margin;

  xlabel ( '--X axis--' )
  ylabel ( '--Y axis--' )
  zlabel ( '--Z axis--' )
%
%  The TITLE function will interpret underscores in the title.
%  We need to unescape such escape sequences!
%
  title_string = s_escape_tex ( xyz_filename );
  title ( title_string )

  axis ( [ x_min, x_max, y_min, y_max, z_min, z_max ] );
  axis equal
%
%  Turn off HOLD.
%
  hold off
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPHERE_XYZ_DISPLAY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function r8mat_transpose_print_some ( m, n, a, ilo, jlo, ihi, jhi, title )

%*****************************************************************************80
%
%% R8MAT_TRANSPOSE_PRINT_SOME prints some of an R8MAT, transposed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an M by N matrix to be printed.
%
%    Input, integer ILO, JLO, the first row and column to print.
%
%    Input, integer IHI, JHI, the last row and column to print.
%
%    Input, string TITLE, an optional title.
%
  incx = 5;

  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
  end

  for i2lo = max ( ilo, 1 ) : incx : min ( ihi, m )

    i2hi = i2lo + incx - 1;
    i2hi = min ( i2hi, m );
    i2hi = min ( i2hi, ihi );

    inc = i2hi + 1 - i2lo;
    
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Row: ' );
    for i = i2lo : i2hi
      fprintf ( 1, '%7d       ', i );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Col\n' );

    j2lo = max ( jlo, 1 );
    j2hi = min ( jhi, n );

    for j = j2lo : j2hi

      fprintf ( 1, '%5d ', j );
      for i2 = 1 : inc
        i = i2lo - 1 + i2;
        fprintf ( 1, '%12f', a(i,j) );
      end
      fprintf ( 1, '\n' );

    end

  end

  return
end
function s2 = s_escape_tex ( s1 )

%*****************************************************************************80
%
%% S_ESCAPE_TEX de-escapes TeX escape sequences.
%
%  Discussion:
%
%    In particular, every occurrence of the characters '\', '_',
%    '^', '{' and '}' will be replaced by '\\', '\_', '\^',
%    '\{' and '\}'.  A TeX interpreter, on seeing these character
%    strings, is then likely to return the original characters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, the string to be de-escaped.
%
%    Output, string S2, a copy of the string, modified to avoid TeX escapes.
%
  s1_length = length ( s1 );

  s1_pos = 0;
  s2_pos = 0;
  s2 = [];

  while ( s1_pos < s1_length )

    s1_pos = s1_pos + 1;

    if ( s1(s1_pos) == '\' || ...
         s1(s1_pos) == '_' || ...
         s1(s1_pos) == '^' || ...
         s1(s1_pos) == '{' || ...
         s1(s1_pos) == '}' )
      s2_pos = s2_pos + 1;
      s2 = strcat ( s2, '\' );
    end

    s2_pos = s2_pos + 1;
    s2 = strcat ( s2, s1(s1_pos) );

  end

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
function xyz = xyz_data_read ( input_filename, point_num )

%*****************************************************************************80
%
%% XYZ_DATA_READ reads data from an XYZ file.
%
%  Discussion:
%
%    The number of points in the file can be determined by calling
%    XYZ_HEADER_READ first.
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
%    Output, real XYZ(3,POINT_NUM), the point coordinates.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZ_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'XYZ_DATA_READ - Error!' );
  end

  i = 0;
  xyz = zeros ( 3, point_num );
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

    temp = sscanf ( text, '%f %f %f' );

    i = i + 1;
    xyz(1,i) = temp(1);
    xyz(2,i) = temp(2);
    xyz(3,i) = temp(3);

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end
function point_num = xyz_header_read ( input_filename )

%*****************************************************************************80
%
%% XYZ_HEADER_READ determines the number of points in an XYZ file.
%
%  Discussion:
%
%    This routine assumes that the file contains exactly three kinds of
%    records:
%
%    COMMENTS which begin with a '#' character in column 1;
%    BLANKS which contain nothing but 'whitespace';
%    XYZ coordinates, which each contain one set of real values.
%
%    The routine ignores comments and blank lines and returns
%    the number of lines containing XY coordinates.
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
%    Output, integer POINT_NUM, the number of points in the file.
%
  point_num = 0;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'r' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'XYZ_HEADER_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file.\n' );
    error ( 'XYZ_HEADER_READ - Error!' );
  end
%
%  Read every line in the file.
%
%  Use FGETL, not FGETS, so we don't pick up the NEWLINE character.
%
  while ( 1 )

    text = fgetl ( input_unit );

    if ( text == -1 )
      break;
    end
    
    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    sscanf ( text, '%f %f %f' );

    point_num = point_num + 1;

  end
%
%  Close the file.
%
  fclose ( input_unit );

  return
end

