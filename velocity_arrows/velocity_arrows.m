function velocity_arrows ( node_file, velocity_file, scale )

%*****************************************************************************80
%
%% VELOCITY_ARROWS makes an arrow plot of a velocity field.
%
%  Discussion:
%
%    The data is stored in two files, one containing XY coordinates,
%    and one containing velocity values.  Both files are in the "TABLE" format.
%
%    In particular, each line of the XY coordinate file should contain
%    the X and Y coordinates for a single point.  Similarly, each line of
%    the velocity file should contain the horizontal and vertical velocities
%    for the same point.  Comment lines may be included if they begin with
%    the special symbol "#".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character NODE_FILE, the name of the node file.
%
%    Input, character VELOCITY_FILE, the name of the velocity file.
%
%    Input, real SCALE, a scale factor.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VELOCITY_ARROWS:\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Arrow plots of a velocity field.\n' );
  
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    node_file = input ( 'Enter the node file, such as ''nodes6.txt'':  ' );
  end

  xy = load ( node_file );
  x = xy(:,1);
  y = xy(:,2);

  node_num = length ( x );

  if ( node_num < 1 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS - Fatal error!\n' );
    fprintf ( 1, '  The number of nodes in the XY file is less than 1.\n' );
    error ( 'VELOCITY_ARROWS - Fatal error!' );
  end

  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    velocity_file = input ( ...
      'Enter the velocity file, such as ''velocity6.txt'':  ' );
  end
  
  if ( nargin < 3 )
    fprintf ( 1, '\n' );
    scale = input ( ...
      'Enter a scale factor for the velocities (1.0 for no magnification): ' );
  end
  
  uv = load ( velocity_file );
  u = uv(:,1);
  v = uv(:,2);

  node_num2 = length ( uv(:,1) );

  if ( node_num2 ~= node_num ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VELOCITY_ARROWS - Fatal error!\n' );
    fprintf ( 1, '  The number of nodes in %s is %d.\n', ...
      uv_filename, node_num2 );
    fprintf ( 1, '  The number of nodes in %s is %d.\n', ...
      xy_filename, node_num );
    error ( 'VELOCITY_ARROWS - Fatal error!' );
  end

  quiver ( x, y, u, v, scale, 'b' );

  xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16 );

  ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
    'FontSize', 16, 'Rotation', 0 );

  title ( 'Velocity field', 'FontName', 'Helvetica', 'FontWeight', ...
    'bold', 'FontSize', 16 );

  axis equal
  hold on

  k = convhull ( x, y );
  plot ( x(k), y(k), 'r' );
  hold on
%
%  Plot an invisible frame.  This will help to force all the plots to
%  be the same size.
%
  x_min = min ( x );
  x_max = max ( x );
  y_min = min ( y );
  y_max = max ( y );
  delta = 0.05 * max ( x_max - x_min, y_max - y_min );
  
  plot ( [ x_min - delta, ...
           x_max + delta, ...
           x_max + delta, ...
           x_min - delta, ...
           x_min - delta ], ...
         [ y_min - delta, ...
           y_min - delta, ...
           y_max + delta, ...
           y_max + delta, ...
           y_min - delta ], ...
         'w' );
         
  hold off

  fprintf ( 1, '\n' );
  fprintf ( 1, 'VELOCITY_ARROWS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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
