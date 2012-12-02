function cvt_movie4 ( n, sample_num, frame_num )

%*****************************************************************************80
%
%% CVT_MOVIE4 demonstrates how a CVT can be computed and displayed in MATLAB.
%
%  Discussion:
%
%    This simple example carries out an iterative CVT calculation in the 
%    unit square, with a nonuniform density, which is "heaviest" in the
%    corners.  The initial placement of the generators is random.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Input, integer FRAME_NUM, the number of frames to generate.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_MOVIE4:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Create a movie of a CVT computation.\n' );
  fprintf ( 1, '  This example works in the unit square, but includes\n' );
  fprintf ( 1, '  a nonuniform density function which should drive\n' );
  fprintf ( 1, '  the CVT generators towards the corners of the square.\n' );

  if ( nargin < 1 )
    n = 100;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_MOVIE4 - Note:\n' );
    fprintf ( 1, '  No value of N was supplied.\n' );
    fprintf ( 1, '  N is the number of generators.\n' );
    fprintf ( 1, '  A default value N = %d will be used.\n', n );
  end

  if ( nargin < 2 )
    sample_num = 1000 * n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_MOVIE4 - Note:\n' );
    fprintf ( 1, '  No value of SAMPLE_NUM was supplied.\n' );
    fprintf ( 1, '  SAMPLE_NUM is the number of sample points.\n' );
    fprintf ( 1, '  A default value SAMPLE_NUM = %d will be used.\n', sample_num );
  end
  
  if ( nargin < 3 )
    frame_num = 20;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_MOVIE4 - Note:\n' );
    fprintf ( 1, '  No value of FRAME_NUM was supplied.\n' );
    fprintf ( 1, '  FRAME_NUM is the number of "frames" of the movie to make\n' );
    fprintf ( 1, '  (and actually the number of iterations, as well).\n' );
    fprintf ( 1, '  A default value FRAME_NUM = %d will be used.\n', frame_num );
  end
%
%  This switch is set to 1 (TRUE) if the ACCUMARRAY command is available.
%  That speeds up the calculation a lot.  If you don't have the ACCUMARRAY
%  command, or it is not behaving for you, just set this to 0.
%
  accumarray_available = 0;

  if ( accumarray_available )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The ACCUMARRAY command will be used.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The ACCUMARRAY command will be simulated.\n' );
  end
%
%  This switch controls whether the Delaunay triangulation is displayed.
%
  delaunay_display = 0;
  
  if ( delaunay_display )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The Delaunay triangulation will be displayed.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The Delaunay triangulation will NOT be displayed.\n' );
  end
%
%  Randomize the initial locations of the generators.
%
  p = rand ( n, 2 );
  
  frame_file = 'cvt_movie4_0000.jpg';
  frame_title = 'cvt\_movie4\_0000.jpg';

  for frame = 1 : frame_num

    frame_file = file_name_inc ( frame_file );
    frame_title = file_name_inc ( frame_title );
%
%  Compute the Delaunay triangle information T for the current nodes.
%
    t = delaunay ( p(:,1), p(:,2) );
%
%  Display a graph of the generators.
%
%  This was a little tricky.  The TRIMESH command must come before
%  the VORONOI command in order for both items to appear.
%
%  There are obvious discrepancies between the Delaunay and Voronoi
%  graphs which suggest that there are mistakes in the Voronoi diagram
%  as computed by MATLAB's VORONOI command!
%
    if ( delaunay_display )
      trimesh ( t, p(:,1), p(:,2), zeros(n,1) )
      hold on
    end

    voronoi ( p(:,1), p(:,2), t );

    title ( frame_title );
    axis ( [ 0.0, 1.0, 0.0, 1.0 ] )
    line ( [ 0.0, 1.0, 1.0, 0.0, 0.0 ], [ 0.0, 0.0, 1.0, 1.0, 0.0 ], ...
      'Color', 'r', 'LineWidth', 2 );
    axis equal
    axis tight
    view ( 2 )
    drawnow

    if ( delaunay_display )
      hold off
    end

    F = getframe;
    [ X, map ] = frame2im ( F );
    imwrite ( X, frame_file, 'JPEG' );
%
%  Generate sample points.
%    
    xs = rand ( sample_num, 1 );
    ys = rand ( sample_num, 1 );
%
%  Apply the density function.
%  The first idea here was to use a cube root function, but 
%  MATLAB will take complex roots, so we have to watch out.
%
    xs = 0.5 + 0.5 * ( abs ( 2.0 * xs - 1.0 ) ).^(0.3) .* ( 2.0 * xs - 1.0 ) ./ abs ( 2.0 * xs - 1.0 );
    ys = 0.5 + 0.5 * ( abs ( 2.0 * ys - 1.0 ) ).^(0.3) .* ( 2.0 * ys - 1.0 ) ./ abs ( 2.0 * ys - 1.0 );
%
%  For each sample point, find K, the index of the nearest generator.
%  We do this efficiently by using the Delaunay information.
%  
    k(1:sample_num,1) = dsearch ( p(:,1), p(:,2), t, xs, ys );
%
%  The centroid of the Voronoi region associated with each generator
%  is approximated by the average of the sample points it was closest to.
%
    if ( accumarray_available )

      count(1:n) = accumarray ( k, ones(sample_num,1) );
      centroid(1,1:n) = accumarray ( k, xs );
      centroid(2,1:n) = accumarray ( k, ys );

    else

      count(1:n) = 0;
      centroid(1,1:n) = 0;
      centroid(2,1:n) = 0;

      for i = 1 : sample_num
        j = k(i);
        count(j) = count(j) + 1;
        centroid(1,j) = centroid(1,j) + xs(i);
        centroid(2,j) = centroid(2,j) + ys(i);
      end

    end
%
%  Replace the generators by the centroids.
%
    k = find ( count(1:n) ~= 0 );
    p(k,1) = ( centroid(1,k) ./ count(k) )';
    p(k,2) = ( centroid(2,k) ./ count(k) )';
    
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_MOVIE4:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

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
