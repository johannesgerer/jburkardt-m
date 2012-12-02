function points_11_png ( input_file_name )

%*****************************************************************************80
%
%% POINTS_11_PNG plots a set of points that lie in the [-1,1] square.
%
%  Discussion:
%
%    The input data is assumed to be a set of points in the [-1,1] square.
%
%    The input data is assumed to be stored in an ASCII file named 
%    INPUT_FILE_NAME, with one pair of coordinates per line of text.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILE_NAME, the name of the input file.
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINTS_11_PNG:\n' );
  fprintf ( 1, '  Read a set of points in the [-1,1] square,\n' );
  fprintf ( 1, '  plot them, and write to a PNG graphics file.\n' );

  p = load ( input_file_name );

  clf

  axes_handle = axes;
%
%  Make a scatter plot of the points, using filled circles.
%
  handle = scatter ( p(:,1), p(:,2), 'b', 'filled' );
%
%  Force the plotting region to be square, not rectangular.
%
  axis square
%
%  Request grid lines.
%
  grid on
%
%  Specify the location of the grid lines, and suppress labeling.
%
  set ( axes_handle, 'xtick', [ -1, -.75, -.50, -.25, 0, .25, .50, .75, 1] );
  set ( axes_handle, 'xticklabel', [] );
  set ( axes_handle, 'ytick', [ -1, -.75, -.50, -.25, 0, .25, .50, .75, 1] );
  set ( axes_handle, 'yticklabel', [] );
%
%  Make the plotting region slightly bigger than the data.
%
  axis ( [ -1.1, 1.1, -1.1, 1.1 ] )
%
%  Title
%
  title ( input_file_name );
%
%  Make an output file name based on the input file name, but
%  with "PNG" extension.
%
  output_file_name = file_name_ext_swap ( input_file_name, 'png' );
%
%  Save the figure and write it out.
%
    frame = getframe;
     [ image, map ] = frame2im ( frame );

  imwrite ( image, output_file_name, 'PNG' );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINTS_11_PNG\n' );
  fprintf ( 1, '  The input data "%s" was read in, and plotted\n', ...
    input_file_name );
  fprintf ( 1, '  in the PNG file "%s".\n', ...
    output_file_name );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
