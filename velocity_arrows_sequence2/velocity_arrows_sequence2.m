function velocity_arrows_sequence2 ( xyuv_filename, scale )

%*****************************************************************************80
%
%% VELOCITY_ARROWS_SEQUENCE2 creates velocity plots from a sequence of datasets.
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
%    Each XYUV input data file is assumed to store the value of the X, Y 
%    coordinates and horizontal and vertical velocity at a point, one set 
%    of values per line.
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
%    velocity_arrows_sequence2 ( xyuv_filename, scale )
%
%    Note that a literal filename must be enclosed in single quotes.
%    Thus, a typical invocation might be
%
%      velocity_arrows_sequence2 ( 'xyuv0001.txt', 1.0 )
%
%    But if you simply say 
%
%      velocity_arrows_sequence2
%
%    the program will give you a chance to enter the data interactively.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string XYUV_FILENAME, the name of the (first) XYUV input file.
%
%    Input, real SCALE, the scale factor for the arrow size.  Setting SCALE to 1
%    results in the default vector size.  
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE2:\n' );
  fprintf ( 1, '  Given a sequence of XYUV files,\n' );
  fprintf ( 1, '  display the velocity fields\n' );
  fprintf ( 1, '  and save each image in a PNG file.\n' );
%
%  If at least one command line argument, it's the XYUV file name.
%
  if ( nargin < 1 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE2:\n' );
    xyuv_filename = input ( '  Enter the XYUV file, such as ''xyuv.txt'':' );

  end

  if ( ~file_exist ( xyuv_filename ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE2 - Fatal error!\n' );
    fprintf ( 1, '  The file "%s" does not exist.\n', xyuv_filename );
    return
  end
%
%  If two command line arguments, the second is the scale factor.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE2:\n' );
    scale = input ( '  Enter the scale factor:' );
  end
%
%  Save the name of the first input file, and set the name of the first PNG file.
%
  xyuv_root = xyuv_filename;

  png_root = file_name_ext_swap ( xyuv_root, 'png' );
  png_filename = png_root;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The first PNG file will be %s\n', png_root );
%
%  Determine the X and Y range, and the U, V maximum magnitude over all the files.
%
  x_min = inf;
  x_max = -inf;
  y_min = inf;
  y_max = -inf;

  mag_max = 0.0;

  xyuv_filename = xyuv_root;

  while ( 1 )
      
    xyuv = load ( xyuv_filename );

    x = xyuv(:,1);
    y = xyuv(:,2);
    u = xyuv(:,3);
    v = xyuv(:,4);

    x_min = min ( x_min, min ( x ) );
    x_max = max ( x_max, max ( x ) );
    y_min = min ( y_min, min ( y ) );
    y_max = max ( y_max, max ( y ) );

    mag = sqrt ( u(:).^2 + v(:).^2 );
    mag_max = max ( mag_max, max ( mag ) );

    xyuv_filename = file_name_inc ( xyuv_filename );

    if ( ~file_exist ( xyuv_filename ) )
      break
    end

  end

  if ( mag_max == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE2 - Fatal error!\n' );
    fprintf ( 1, '  The input data is entirely zero.\n' );
    fprintf ( 1, '  No plot is possible.\n' );
    error ( 'VELOCITY_ARROWS_SEQUENCE2 - The input data is zero!' );
  end

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
%  Create the plots.
%
  xyuv_filename = xyuv_root;

  frame_num = 0;
%
%  Loop over all files.
%
  while ( 1 )
      
    xyuv = load ( xyuv_filename );
  
    x = xyuv(:,1);
    y = xyuv(:,2);
    u = xyuv(:,3);
    v = xyuv(:,4);

    quiver ( x, y, u, v, scale / mag_max, 'b' );
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

    title ( xyuv_filename, 'FontName', 'Helvetica', 'FontWeight', ...
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
    xyuv_filename = file_name_inc ( xyuv_filename );

    if ( ~file_exist ( xyuv_filename ) )
      break
    end
    
    png_filename = file_name_inc ( png_filename );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Processed %d frames.\n', frame_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VELOCITY_ARROWS_SEQUENCE2:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

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
