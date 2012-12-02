function view_frame ( frame_id )

%*****************************************************************************80
%
%% VIEW_FRAME views one frame of an animation.
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
%    Input, integer FRAME_ID, the index of the frame to be viewed.
%

%
%  Create the filename.
%
  filename = sprintf ( 'frame%04d.jpg', frame_id );
%
%  Using IMREAD followed by IMSHOW allows us access to the data.
%
  if ( 1 )

    [ X, MAP ] = imread ( filename );
    [ m, n, rgb ] = size ( X );
    fprintf ( 1, 'Frame %4d: %d by %d pixels\n', frame_id, m, n );
    imshow ( X );
%
%  Using IMSHOW is simpler.
%
  else

    imshow ( filename );

  end

  return
end
