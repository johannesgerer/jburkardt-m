function make_frame ( frame_id, frame_total )

%*****************************************************************************80
%
%% MAKE_FRAME makes one frame of an animation.
%
%  Discussion:
%
%    Making frames from 0 to FRAME_TOTAL will create a sequence of JPG
%    files that constitute the frames of an animation, in which a
%    "hilly" plot gradually flattens out.
%
%    QUICKTIME is one program that can collect these individual frames into
%    a single animation file.
%
%    The value of FRAME_TOTAL does not really limit the possible values
%    of FRAME_ID.  It is simply the value at which the plot first returns to
%    its initial state.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FRAME_ID, the index of the frame to be created.
%
%    Input, integer FRAME_TOTAL, the total number of frames.
%

%
%  PEAKS returns a 49 x 49 matrix of data that can be plotted
%  as a surface.
%
  Z = peaks ( );
%
%  Scale the data so that it completes a cycle on frame FRAME_TOTAL.
%
  scale = cos ( 2 * pi * frame_id / frame_total );
%
%  Plot the data as a surface plot, and color it based on the
%  unscaled data.
%
  surf ( scale * Z, Z, 'EdgeColor', 'Interp', 'FaceColor', 'Interp' )
%
%  Go through a horizontal rotation of 5 degrees per frame.
%
  az = 5;
  az = frame_id * 5;
  el = 40;
  view ( az, el );
%
%  Force all frames to share the same axis.
%
  axis ( [ 0, 50, 0, 50, -10, +10 ] )
%
%  Create a filename that is unique for this frame.
%
  filename = sprintf ( 'frame%04d.jpg', frame_id );

  title ( filename );
  xlabel ( '--X--' )
  ylabel ( '--Y--' )
  zlabel ( '--Z--' )
%
%  Save the graphics current figure (GCF) as a "frame".
%
  f = getframe ( gcf );
%
%  Extract the image and color map.
%
  [ image, colormap ] = frame2im ( f );
%
%  Have frame 0 save the color map to a MAT file.
%
  if ( frame_id == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Saving colormap to colormap.mat\n' );
    save colormap.mat colormap
  end
%
%  Write the image data.
%
  imwrite ( image, filename, 'JPG' )

  return
end
