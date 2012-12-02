% make_avi_movie_example2.m
%
%  Discussion:
%
%    This is a simple example program to create an
%    Audio Video Interleaved (AVI) movie that can be played
%    independently of Matlab - see make_avi_movie_example1.
%    The movie is just a pseudocolor plot of a of a regular
%    2-D surface that is translated to make an animation. The
%    example shows how to make a 2-D movie using the pcolor
%    function in Matlab.  Replacing pcolor with surf doesn't
%    seem to work very well.
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
%    Marcus Garvie.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_AVI_MOVIE_EXAMPLE2\n' );
  fprintf ( 1, '  Create an AVI animation of 2D graphics,\n' );
  fprintf ( 1, '  generating one frame at a time.\n' )
%
%  Set the number of frames.
%
  numframes = 50;
  hp = 4 * pi / numframes;
%
%  Control how fast final movie will play; total time
%  of movie in seconds will be about (numframes)/(num_frames_per_second)
%
  num_frames_per_second = 2;
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
  aviobj = avifile ( '2Dsinwave.avi', 'fps', num_frames_per_second );
%
%  Control the resolution of the surface.
%
  num_nodes = 200;
  h = 4 * pi / num_nodes;
  i = 1 : num_nodes + 1;
%
%  Set the 1D array of nodes.
%
  x = ( i - 1 ) * h - 4 * pi;
%
%  Create a 2D array of nodes.
%
  [ X, Y ] = meshgrid ( x, x );
%
%  Now generate each frame.
%
  for j = 1 : numframes+1

    t = ( j - 1 ) * hp;
    fprintf ( 1, '  Creating frame %d for time %f.\n', j, hp * ( j - 1 ) );

    Z = sin ( ( X - t ) ) .* cos ( Y + t );
    H = pcolor ( X, Y, Z );
    set ( H, 'EraseMode', 'xor' );
    set ( gca, 'nextplot', 'replacechildren' );
    shading interp;
    axis tight square off;
    frame = getframe ( gca );
    aviobj = addframe ( aviobj, frame );
  end
%
%  Once all the frames have been generated and added, we must close the file.
%
  aviobj = close ( aviobj );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MAKE_AVI_MOVIE_EXAMPLE2\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '  The movie file "2Dsinwave.avi" has been created.\n' );

