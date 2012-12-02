function make_frames ( frame_total )

%*****************************************************************************80
%
%% MAKE_FRAMES makes the frames of an animation.
%
%  Discussion:
%
%    This program makes FRAME_TOTAL + 1 JPEG files, which constitute
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
  fprintf ( 1, 'MAKE_FRAMES:\n' );
  fprintf ( 1, '  Make a (potential) animation by creating a sequence\n' );
  fprintf ( 1, '  of JPG files, each containing one frame.\n' );

  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    frame_total = input ( 'Enter the number of frames to create:  ' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program has been asked to create\n' );
  fprintf ( 1, '  frames 0 through %d.\n', frame_total );
  fprintf ( 1, '  The first frame will be stored in "%s",\n', ...
    sprintf ( 'frame%04d.jpg', 0 ) );
  fprintf ( 1, '  The last frame will be stored in "%s".\n', ...
    sprintf ( 'frame%04d.jpg', frame_total ) );

  for frame_id = 0 : frame_total
    make_frame ( frame_id, frame_total );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_FRAMES:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
