function make_animation ( frame_total )

%*****************************************************************************80
%
%% MAKE_ANIMATION creates an AVI animation file from a sequence of frame files.
%
%  Discussion:
%
%    Before running this program close all figures and don't interfere
%    with the generated figures until the recording process is done.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_ANIMATION\n' );
  fprintf ( 1, '  Create an AVI animation from a sequence of frame files.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we assume a sequence of frame files was created by\n' )
  fprintf ( 1, '  the MAKE_FRAMES program already.\n' );
%
%  Make sure we have the number of frames.
%
  if ( nargin < 1 )
    fprintf ( 1, '\n' );
    frame_total = input ( 'Enter the number of frames to view:  ' );
  end
%
%  Set the total number of frames that we will generate.
%
  numframes = frame_total + 1;
%
%  Control how fast final movie will play; total time
%  of movie in seconds will be about (numframes)/(num_frames_per_second)
%
  fps = 10;
  seconds = numframes / fps;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  This movie will contain %d frames.\n', numframes );
  fprintf ( 1, '  The number of frames per second will be %f\n', fps );
  fprintf ( 1, '  so the movie should take %f seconds to play.\n', seconds );
%
%  The AVIFILE function creates a new Audio Video Interleaved (AVI) file.
%  We specify its name and FPS.
%
  aviobj = avifile ( 'peak_movie.avi', 'fps', fps );
%
%  Retrieve each file.
%
  for frame_id = 0 : frame_total
    filename = sprintf ( 'frame%04d.jpg', frame_id );
    H = imshow ( filename );
    set ( H, 'EraseMode', 'xor' );
    set ( gca, 'nextplot', 'replacechildren' );
    shading interp;
    axis tight square off;
    frame = getframe ( gca );
    aviobj = addframe ( aviobj, frame );
  end
%
%  Tell MATLAB we have completed the movie.
%
  aviobj = close ( aviobj );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_ANIMATION:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end

