function cvt_movie5 ( )

%*****************************************************************************80
%
%% CVT_MOVIE5 creates a movie from data files.
%
%  Discussion:
%
%    This simple example creates a movie by reading in a set of point
%    values at each step in an iteration.  
%
%    The point values are 389 points inside the P08 "holey pie" region.
%    They were computed in a CVT calculation external to this procedure.
%
%    This routine simply reads in the data, adds a picture of the boundary
%    of the region, and computes the Voronoi diagram, before "taking a picture"
%    which creates a JPEG image.  The JPEG images can easily be made into a movie.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2005
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local parameter FILE_NAME, the name of the data file being read.
%
  data_file = 'p08_hbf_000.txt';

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_MOVIE5:\n' );
  fprintf ( 1, '  Create a movie of a CVT computation.\n' );
  fprintf ( 1, '  This example uses the "holey pie" geometry.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data has been precomputed.\n' );
  fprintf ( 1, '  The first data file to read is %s\n', data_file );
%
%  This switch controls whether the Delaunay triangulation is displayed.
%
  delaunay_display = 0;
  
  if ( delaunay_display )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The Delaunay triangulation will be displayed.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The Delaunay triangulation will NOT be displayed.\n' );
  end

  frame_num = 0;
  
  frame_file = 'cvt_movie5_000.jpg';
  frame_title = 'cvt\_movie5\_000.jpg';

  while ( 1 )

    if ( ~file_exist ( data_file ) )
      break
    end
    
    p = load ( data_file );
    frame_num = frame_num + 1;
%
%  Compute the Delaunay triangle information T for the current nodes.
%
    t = delaunay ( p(:,1), p(:,2) );
%
%  Display a graph of the generators.
%
%  This was a little tricky.  The TRIMESH command must come before
%  the VORONOI command in order for both items to appear.
%
%  There are obvious discrepancies between the Delaunay and Voronoi
%  graphs which suggest that there are mistakes in the Voronoi diagram
%  as computed by MATLAB's VORONOI command!
%
    if ( delaunay_display )
      trimesh ( t, p(:,1), p(:,2), zeros(n,1) )
      hold on
    end
%
%  Here, we use a new, unreleased version of the VORONOI command, which
%  does a better job of handling the semi-infinite sides.  
%
    voronoi ( p(:,1), p(:,2), t );

    title ( frame_title );
    axis equal
    axis ( [ 0.0, 1.0, -0.29, +0.29 ] )
    segment_num = p08_boundary_segment_num ( 'DUMMY' );
    h = 0.05;
    for segment_index = 1 : segment_num
      segment_length = p08_boundary_segment_length ( segment_index, h );
      segment = p08_boundary_segment ( segment_index, 2, segment_length );
      line ( segment(1,:), segment(2,:), 'Color', 'r' );
    end
    view ( 2 )
    drawnow

    if ( delaunay_display )
      hold off
    end

    F = getframe;
    [ X, map ] = frame2im ( F );
    imwrite ( X, frame_file, 'JPEG' );
%
%  Prepare for next step.
%
    data_file = file_name_inc ( data_file );
    frame_file = file_name_inc ( frame_file );
    frame_title = file_name_inc ( frame_title );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of frames created is %d\n', frame_num );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_MOVIE5:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
