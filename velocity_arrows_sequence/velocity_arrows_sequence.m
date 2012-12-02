function velocity_arrows_sequence ( xy_filename, uv_filename, scale )

%*****************************************************************************80
%
%% VELOCITY_ARROWS_SEQUENCE creates velocity plots from a sequence of datasets.
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
%    ===============
%
%    The XY input data file stores the coordinates of the points, which are presumed
%    to be fixed over all the data files, one pair of values per line.
%
%    Each UV input data file is assumed to store the value of the horizontal and
%    vertical velocity at the corresponding point, one pair of values per line.
%
%    Internal processing:
%    ===================
%
%    Once the first file is processed, the routine checks to see if there
%    is a second "consecutive" file, and it so, it is also processed, and 
%    so on, until presumably all files in the sequence have been handled.
%
%  Usage:
%
%    velocity_arrows_sequence ( xy_filename, uv_filename, scale )
%
%    Note that a literal filename must be enclosed in single quotes.
%    Thus, a typical invocation might be
%
%      velocity_arrows_sequence ( 'xy.txt', 'u0001.txt', 1.0 )
%
%    But if you simply say 
%
%      velocity_arrows_sequence
%
%    the program will give you a chance to enter the data interactively.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string XY_FILENAME, the name of the XY input file.
%
%    Input, string UV_FILENAME, the name of the (first) UV input file.
%
%    Input, real SCALE, the scale factor for the arrow size.  Setting SCALE to 1
%    results in the default vector size.  
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE:\n' );
  fprintf ( 1, '  Given one XY file, and a sequence of UV files,\n' );
  fprintf ( 1, '  display the velocity fields\n' );
  fprintf ( 1, '  and save each image in a PNG file.\n' );
%
%  If at least one command line argument, it's the X file name.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE:\n' );
    xy_filename = input ( '  Enter the XY file, such as ''xy.txt'':' );

  end

  if ( ~file_exist ( xy_filename ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The file "%s" does not exist.\n', xy_filename );
    return
  end
%
%  If two command line arguments, the second is the UV file name.
%
  if ( nargin < 2 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE:\n' );
    uv_filename = input ( ...
      '  Enter the (first) UV file, such as ''uv01.txt'':' );

  end

  if ( ~file_exist ( uv_filename ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The file "%s" does not exist.\n', uv_filename );
    return
  end
%
%  If three command line arguments, the third is the scale factor.
%
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE:\n' );
    scale = input ( '  Enter the scale factor:' );
  end
%
%  Save the name of the first input file, and set the name of the first PNG file.
%
  uv_root = uv_filename;

  png_root = file_name_ext_swap ( uv_root, 'png' );
  png_filename = png_root;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first PNG file will be %s\n', png_root );
%
%  Read the data in the XY file.
%
  xy = load ( xy_filename );
  x = xy(:,1);
  y = xy(:,2);

  node_num = length ( x );

  if ( node_num < 1 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The number of nodes in the XY file is less than 1.\n' );
    error ( 'VELOCITY_ARROWS_SEQUENCE - Fatal error!' );
  end
%
%  Save data for the frame.
%
  x_min = min ( x );
  x_max = max ( x );
  y_min = min ( y );
  y_max = max ( y );

  delta = 0.05 * max ( x_max - x_min, y_max - y_min );

  x_frame = [ x_min - delta, ...
              x_max + delta, ...
              x_max + delta, ...
              x_min - delta, ...
              x_min - delta ];

  y_frame = [ y_min - delta, ...
              y_min - delta, ...
              y_max + delta, ...
              y_max + delta, ...
              y_min - delta ];
%
%  Determine the velocity magnitude scale over the WHOLE range of datasets.
%
  mag_max = 0.0;

  uv_filename = uv_root;

  while ( 1 )
      
    uv = load ( uv_filename );

    node_num2 = length ( uv(:,1) );

    if ( node_num2 ~= node_num ) 
      fprintf ( 1, '\n' );
      fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE - Fatal error!\n' );
      fprintf ( 1, '  The number of nodes in %s is %d.\n', ...
        uv_filename, node_num2 );
      fprintf ( 1, '  The number of nodes in %s is %d.\n', ...
        xy_filename, node_num );
      error ( 'VELOCITY_ARROWS_SEQUENCE - Fatal error!' );
    end

    mag = sqrt ( uv(:,1).^2 + uv(:,2).^2 );
    mag_max = max ( mag_max, max ( mag ) );

    uv_filename = file_name_inc ( uv_filename );

    if ( ~file_exist ( uv_filename ) )
      break
    end

  end

  if ( mag_max == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE - Fatal error!\n' );
    fprintf ( 1, '  The input data is entirely zero.\n' );
    fprintf ( 1, '  No plot is possible.\n' );
    error ( 'VELOCITY_ARROWS_SEQUENCE - The input data is zero!' );
  end
%
%  Create the plots.
%
  uv_filename = uv_root;

  frame_num = 0;
%
%  Loop over all files.
%
  while ( 1 )
      
    uv = load ( uv_filename );
  
    quiver ( x, y, uv(:,1), uv(:,2), scale / mag_max, 'b' );
    axis equal
    hold on

    k = convhull ( x, y );
    plot ( x(k), y(k), 'r' );
    hold on
  
    x_min = min ( x );
    x_max = max ( x );
    y_min = min ( y );
    y_max = max ( y );
    delta = 0.05 * max ( x_max - x_min, y_max - y_min );
  
    plot ( x_frame, y_frame, 'w' );
         
    hold off

    xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16 );

    ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16, 'Rotation', 0 );

    title ( uv_filename, 'FontName', 'Helvetica', 'FontWeight', ...
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
    uv_filename = file_name_inc ( uv_filename );

    if ( ~file_exist ( uv_filename ) )
      break
    end
    
    png_filename = file_name_inc ( png_filename );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Processed %d frames.\n', frame_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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
