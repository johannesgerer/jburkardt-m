% make_avi_movie_example1.m
%
%  Discussion:
%
%    This is a simple example program to create an
%    Audio Video Interleaved (AVI) movie that can be played
%    independently of Matlab, using, for example, the XINE player
%    for Linux. We capture NUMFRAMES frames for the 1-D sine
%    wave with phase changing from 0 to 2 pi.  
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
%    02 November 2004
%
%  Author:
%
%    Marcus Garvie
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_AVI_MOVIE_EXAMPLE1\n' );
  fprintf ( 1, '  Create an AVI animation of simple graphics,\n' );
  fprintf ( 1, '  generating one frame at a time.\n' )
%
%  Set the total number of frames that we will generate.
%
  numframes = 100;
  hp = 2 * pi / numframes;
%
%  Control how fast final movie will play; total time
%  of movie in seconds will be about (numframes)/(num_frames_per_second)
%
  num_frames_per_second = 10;
  dur = numframes / num_frames_per_second;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This movie will contain %d frames.\n', numframes );
  fprintf ( 1, '  The number of frames per second will be %f\n', num_frames_per_second );
  fprintf ( 1, '  so the movie should take %f seconds to play.\n', dur );
%
%  The AVIFILE function creates a new Audio Video Interleaved (AVI) file.
%  We specify its name, and we also set the value of "FPS", which is the
%  rate at which we will display frames (individual snapshots) per second.
%
  aviobj = avifile ( 'sinwave.avi', 'fps', num_frames_per_second ); 
%
%  Control resolution of wave
%
  num_nodes = 100;
  h = 2 * pi / num_nodes;
  i = 1 : num_nodes + 1;
%
%  Set the X values at which the function will be evaluated.
%
  x = ( i - 1 ) * h;
%
%  Now we make plots of sine waves.  Each new plot is a frame which
%  can be added to the AVI movie using the ADDFRAME function.
%
  for j =  1 : numframes+1
    y = sin ( x - ( j - 1 ) * hp );
    plot ( x, y )
    axis tight
    frame = getframe ( gca );
    aviobj = addframe ( aviobj, frame );
  end
%
%  Tell MATLAB we have completed the movie.
%
  aviobj = close ( aviobj );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_AVI_MOVIE_EXAMPLE1\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '  The movie file "sinwave.avi" has been created.\n' );
  
