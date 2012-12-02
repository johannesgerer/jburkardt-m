function view_frames ( frame_total )

%*****************************************************************************80
%
%% VIEW_FRAMES views the frames of an animatione, stored in files.
%
%  Discussion:
%
%    This program views FRAME_TOTAL + 1 JPEG files, which constitute
%    individual frames of an animation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FRAME_TOTAL, the total number of frames.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VIEW_FRAMES:\n' );
  fprintf ( 1, '  View the images contained in a sequence of files.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    frame_total = input ( 'Enter the number of frames to view:  ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program has been asked to view\n' );
  fprintf ( 1, '  frames 0 through %d.\n', frame_total );
  fprintf ( 1, '  The first file is called "%s",\n', ...
    sprintf ( 'frame%04d.jpg', 0 ) );
  fprintf ( 1, '  The last frame is called "%s".\n', ...
    sprintf ( 'frame%04d.jpg', frame_total ) );
  fprintf ( 1, '\n' );

  for frame_id = 0 : frame_total
    view_frame ( frame_id )
    pause ( 2 )
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'VIEW_FRAMES:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
