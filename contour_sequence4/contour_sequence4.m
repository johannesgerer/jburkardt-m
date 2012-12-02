function contour_sequence4 ( xy_filename, u_filename )

%*****************************************************************************80
%
%% CONTOUR_SEQUENCE4 creates contour plots and PNG files from a sequence of datasets.
%
%  Discussion:
%
%    This program can be used to turn data files into a sequence of PNG
%    images, suitable for an animation.
%
%    Although this program can handle a single input file, its most useful
%    application is in processing many files, with 'consecutive' names, such
%    as "fred01.txt", "fred02.txt", "fred03.txt" and so on.  The user only
%    has to tell the program to process the first file, and it will automatically
%    continue to process files until it reaches the end of the sequence of names.
%
%    The input files:
%    ---------------
%
%    The X and Y input data files store the values of X and Y for points
%    on a regularly spaced grid.  The grid does not have
%    to be evenly spaced, but for this program to work, it must be the case
%    that the (X,Y) points form an M by N grid, and that the value of X or 
%    of Y is constant along a grid line!
%
%    (In other words, a square grid is fine, but a rectangular grid is OK too.
%    A rectangular grid with constant spacing is fine, but a rectangular grid
%    with variable spacing is OK.  But a "wiggly" or curved grid is no good.)
%
%    Each U input data file is assumed to store the value of the
%    associated scalar U.
%
%    Also, the points in the data file must be listed in a reasonable order,
%    either by rows or by columns.
%
%    Internal processing:
%    ===================
%
%    The program has to figure out the grid parameters M and N, and convert
%    the vectors of data X, Y, U into doubly indexed arrays that can be handled
%    by the MATLAB contour routine.  Once the contour plot is displayed, an
%    image of it is saved as a PNG file.
%
%    Once the first file is processed, the routine checks to see if there
%    is a second "consecutive" file, and it so, it is also processed, and 
%    so on, until presumably all files in the sequence have been handled.
%
%  Usage:
%
%    contour_sequence4 ( xy_filename, u_filename )
%
%    Note that a literal filename must be enclosed in single quotes.
%    Thus, a typical invocation might be
%
%      contour_sequence4 ( 'xy.txt', 'u0001.txt' )
%
%    But if you simply say 
%
%      contour_sequence4
%
%    the program will give you a chance to enter the filenames
%    interactively.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string XY_FILENAME, the name of the XY input file.
%
%    Input, string U_FILENAME, the name of the (first) U input file.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONTOUR_SEQUENCE4:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Contours and PNG files of scalar data on a 2D array.\n' );
%
%  If at least one command line argument, it's the X file name.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CONTOUR_SEQUENCE4:\n' );
    xy_filename = input ( '  Enter the name of the XY data file:' );

  end

  if ( ~file_exist ( xy_filename ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CONTOUR_SEQUENCE4 - Fatal error!\n' );
    fprintf ( 1, '  The file "%s" does not exist.\n', x_filename );
    return
  end
%
%  If two command line arguments, the second is the U file name.
%
  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CONTOUR_SEQUENCE4:\n' );
    u_filename = input ( '  Enter the name of the U data file:' );

  end

  if ( ~file_exist ( u_filename ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CONTOUR_SEQUENCE4 - Fatal error!\n' );
    fprintf ( 1, '  The file "%s" does not exist.\n', u_filename );
    return
  end
%
%  Save the name of the first input file, and set the name of the first PNG file.
%
  u_root = u_filename;

  png_root = file_name_ext_swap ( u_root, 'png' );
  png_filename = png_root;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  First PNG file will be %s\n', png_root );
%
%  Read the data in the first file.
%
  xy = load ( xy_filename );
  u = load ( u_filename );
%
%  Record the "shape" of the data.  
%  M is the number of records.
%  N is presumably 1.
%
  [ m, n ] = size ( u );
%
%  Try to determine if X or Y is the slowest to vary in the listing.
%
  if ( xy(2,1) == xy(1,1) )
    orientation = 1;
  else
    orientation = 2;
  end
%
%  Try to determine the value of NX and NY.
%
  if ( orientation == 1 )
    ny = 2;
    while ( 1 )
      if ( xy(ny+1,1) ~= xy(1,1) )
        break;
      end
      ny = ny + 1;
    end
    nx = m / ny;
  elseif ( orientation == 2 )
    nx = 2;
    while ( 1 )
      if ( xy(nx+1,2) ~= xy(1,2) )
        break;
      end
      nx = nx + 1;
    end
    ny = m / nx;
  end
%
%  We need to read all the U data once, 
%  so we can set values for UMIN and UMAX,
%  so we can specify a single set of contour values that will apply to all frames.
%
  umax = max ( u(1:m,1) );
  umin = min ( u(1:m,1) );

  while ( 1 )
      
    u_filename = file_name_inc ( u_filename );

    if ( ~file_exist ( u_filename ) )
      break
    end
    
    u = load ( u_filename );

    umax = max ( umax, max ( u(1:m,1) ) );
    umin = min ( umin, min ( u(1:m,1) ) );

  end
%
%  Create the contour plots.
%
  u_filename = u_root;

  frame_num = 0;
%
%  Set the number of contour levels.
%
  udel = ( umax - umin ) / 15;
  v = umin : udel : umax;
%
%  Loop over all files.
%
  while ( 1 )
      
    u = load ( u_filename );

    if ( orientation == 1 )
      x = reshape ( xy(:,1), nx, ny );
      y = reshape ( xy(:,2), nx, ny );
      u = reshape ( u, nx, ny );
    elseif ( orientation == 2 )
      x = ( reshape ( xy(:,1), ny, nx ) )';
      y = ( reshape ( xy(:,2), ny, nx ) )';
      u = ( reshape ( u, ny, nx ) )';
    end
%
%  Set up a colormap.
%
  colormap ( jet );
%
%  Display a contour plot.
%
%  CONTOURF is pretty nice, but there are some other interesting options.
%
%  CONTOUR does contour LINES.
%  CONTOURF is the same as CONTOUR, but fills the contour regions with colors.
%  CONTOUR3 shows a 3D surface.
%
%  SURF makes a 3D surface, but the colors are not very smooth.
%
%  PCOLOR makes a flat "contour" plot; it doesn't actually make a nice contour plot,
%  but just breaks the picture up into boxes corresponding to each data value,
%  and fills that box with a solid color.  Using a shading option helps a little.
%
%    [ C1, h1 ] = contour ( x, y, u, v );
%
    [ C1, h1 ] = contourf ( x, y, u, v );   
%
%   [ C1, h1 ] = contour3 ( x, y, u, v );
%    surf ( x, y, u );
%    pcolor ( x, y, u );
%
%  CAXIS allows us to force every plot to share the same fixed contour levels.
%
  caxis ( [ umin, umax ] );
%
%  Use this shading option for the SURF or PCOLOR commands to get rid of the black
%  cell box lines and to somewhat smooth out the boxy colors.
%
%    shading ( 'interp' );
%
%  Place a vertical colorbar on the plot.
%
    colorbar ( 'vert' )
%
%  Label the axes and the plot.
%
    xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16 );

    ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16, 'Rotation', 0 );

    title ( u_filename, 'FontName', 'Helvetica', 'FontWeight', ...
      'bold', 'FontSize', 16 );
%
%  Here's where we take a snapshot of the current image, and save it to 
%  a PNG file.  Doing this was surprisingly complicated, and the help
%  system was not very clear.  Surely there's a more straightforward way!
%
    F = getframe;
    [ XX, map ] = frame2im ( F );
    imwrite ( XX, png_filename, 'PNG' );
    frame_num = frame_num + 1;
%
%  Prepare for next iteration.
%
    u_filename = file_name_inc ( u_filename );

    if ( ~file_exist ( u_filename ) )
      break
    end
    
    png_filename = file_name_inc ( png_filename );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Processed %d frames.\n', frame_num );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CONTOUR_SEQUENCE4:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function truefalse = ch_is_digit ( c )

%*****************************************************************************80
%
%% CH_IS_DIGIT returns TRUE if the character C is a digit.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 December 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a character.
%
%    Output, integer TRUEFALSE, is TRUE (1) if C is a digit, FALSE (0) otherwise.
%
  TRUE = 1;
  FALSE = 0;

  if ( '0' <= c & c <= '9' )
    truefalse = TRUE;
  else
    truefalse = FALSE;
  end

  return
end
function c = digit_inc ( c )

%*****************************************************************************80
%
%% DIGIT_INC increments a digit.
%
%  Discussion:
%
%    0 goes to 1, 1 goes to 2 and so on, but 9 goes back to 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, a character.
%
%    Output, character C, the incremented character.
%
  if ( '0' <= c & c < '9' )
    c = char ( 1 + double ( c ) );
  elseif ( c == '9' )
    c = '0';
  end

  return
end
function value = file_exist ( file_name )

%*****************************************************************************80
%
%% FILE_EXIST reports whether a file exists.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_NAME, the name of the file.
%
%    Output, logical FILE_EXIST, is TRUE if the file exists.
%
  fid = fopen ( file_name );

  if ( fid == -1 ) 
    value = 0;
  else
    fclose ( fid );
    value = 1;
  end

  return
end
function file_name_new = file_name_ext_swap ( file_name, ext )

%*****************************************************************************80
%
%% FILE_NAME_EXT_SWAP replaces the current "extension" of a file name.
%
%  Discussion:
%
%    The "extension" of a filename is the string of characters
%    that appears after the LAST period in the name.  A file
%    with no period, or with a period as the last character
%    in the name, has a "null" extension.
%
%  Example:
%
%          Input           Output
%    ================     =============
%    FILE_NAME    EXT     FILE_NAME_NEW
%    
%    bob.for      obj     bob.obj
%    bob.bob.bob  txt     bob.bob.txt
%    bob          yak     bob.yak
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character FILE_NAME(*), a file name.
%    On output, the extension of the file has been changed.
%
%    Input, character EXT(*), the extension to be used on the output
%    copy of FILE_NAME, replacing the current extension if any.
%
%    Output, character FILE_NAME_NEW(*), a copy of the input file name,
%    with the new extension.
%
  file_name_len = length ( file_name );

  ext_len = length ( ext );

  period = file_name_len + 1;

  for i = file_name_len : -1 : 1
    if ( file_name(i:i) == '.' )
      period = i;
      break
    end
  end

  file_name_new(1:period-1) = file_name(1:period-1);
  file_name_new(period) = '.';
  file_name_new(period+1:period+ext_len) = ext(1:ext_len);

  return
end
function file_name = file_name_inc ( file_name )

%*****************************************************************************80
%
%% FILE_NAME_INC generates the next filename in a series.
%
%  Discussion:
%
%    It is assumed that the digits in the name, whether scattered or
%    connected, represent a number that is to be increased by 1 on
%    each call.  If this number is all 9's on input, the output number
%    is all 0's.  Non-numeric letters of the name are unaffected..
%
%    If the name is empty, then the routine stops.
%
%    If the name contains no digits, the empty string is returned.
%
%  Example:
%
%      Input            Output
%      -----            ------
%      'a7to11.txt'     'a7to12.txt'  (typical case.  Last digit incremented)
%      'a7to99.txt'     'a8to00.txt'  (last digit incremented, with carry.)
%      'a9to99.txt'     'a0to00.txt'  (wrap around)
%      'cat.txt'        ' '           (no digits in input name.)
%      ' '              STOP!         (error.)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILE_NAME, the string to be incremented.
%
%    Output, string FILE_NAME, the incremented string.
%
  lens = length ( file_name );

  if ( lens <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FILE_NAME_INC - Fatal error!\n' );
    fprintf ( 1, '  The input filename is empty.\n' );
    error ( 'FILE_NAME_INC - Fatal error!' );
  end

  change = 0;

  for i = lens : -1 : 1

    c = file_name(i);

    if ( '0' <= c & c <= '8' )

      change = change + 1;

      c = c + 1;
      
      file_name(i) = c;

      return

    elseif ( c == '9' )

      change = change + 1;

      c = '0';
      
      file_name(i) = c;

    end

  end

  if ( change == 0 )
    file_name = ' ';
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
