function shallow_water_1d_animation ( h_array, uh_array, x, t )

%*****************************************************************************80
%
%% SHALLOW_WATER_1D_ANIMATION animates a solution of the 1D shallow water equations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    "The Shallow Water Equations",
%    Experiments with MATLAB.
%
%  Parameters:
%
%    Input, real H_ARRAY(NX,NT+1), the height for all space and time points.
%
%    Input, real UH_ARRAY(NX,NT+1), the mass velocity for all space and time points.
%
%    Input, real X(NX), the coordinates of the nodes.
%
%    Input, real T(NT+1), the time at each timestep.
%
  if ( nargin < 4 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SHALLOW_WATER_1D_ANIMATION: Error!\n' );
    fprintf ( 1, '  This program needs H, UH, X and T array input to run!\n' );
    fprintf ( 1, '  Run SHALLOW_WATER_1D first, and pass in that data.\n' );
    error ( 'SHALLOW_WATER_1D_ANIMATION: Error!\n' );
  end

  x_min = min ( x );
  x_max = max ( x );
  
  h_min = 0.0;
  h_max = max ( max ( h_array ) );

  uh_max = max ( max ( uh_array ) );
  uh_min = min ( min ( uh_array ) );

  [ nx, nt ] = size ( uh_array );
%
%  Minor adjustment so that NT means the same thing as in the other program.
%
  nt = nt - 1;
%
%  Name of the first JPG file.
%
  h_filename = 'h000.jpg';
%
%  For each time step, plot H.
%
  for it = 1 : nt + 1

    clf
    h1 = axes ( );
    axis ( [ x_min, x_max, h_min, h_max ] );
    axis manual;
    hold on
    area ( h1, x, h_array(:,it) );
    title_string = sprintf ( 'H(T), Step %3d, Time = %f', it, t(it) );
    title ( title_string );
    xlabel ( 'X' );
    ylabel ( 'H(X,T)' );
%
%  Take a snapshot of the current image, and save it to a JPEG file.
%
    F = getframe ( );
    [X,map] = frame2im ( F );
    imwrite ( X, h_filename, 'JPEG' );
    if ( it == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  First H file is "%s".\n', h_filename );
    elseif ( it == nt + 1 )
      fprintf ( 1, '  Last H file is "%s".\n', h_filename );
    end
    h_filename = file_name_inc ( h_filename );
    hold off

  end
%
%  Name of the first JPG file.
%
  uh_filename = 'uh000.jpg';
%
%  For each time step, plot UH.
%
  for it = 1 : nt + 1

    clf
    h2 = axes ( );
    axis ( [ x_min, x_max, uh_min, uh_max ] );
    axis manual;
    hold on
    area ( h2, x, uh_array(:,it), 0.0, 'FaceColor', [ 0.6, 0.1, 0.1 ] );
    title_string = sprintf ( 'UH(T), Step %3d, Time = %f', it, t(it) );
    title ( title_string );
    xlabel ( 'X' );
    ylabel ( 'UH(X,T)' );
%
%  Take a snapshot of the current image, and save it to a JPEG file.
%
    F = getframe ( );
    [X,map] = frame2im ( F );
    imwrite ( X, uh_filename, 'JPEG' );
    if ( it == 1 )
      fprintf ( 1, '  First UH file is "%s".\n', uh_filename );
    elseif ( it == nt + 1 )
      fprintf ( 1, '  Last UH file is "%s".\n', uh_filename );
    end
    uh_filename = file_name_inc ( uh_filename );
    hold off

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHALLOW_WATER_1D_ANIMATION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

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
%    10 February 2010
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

    if ( '0' <= c && c <= '8' )

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
