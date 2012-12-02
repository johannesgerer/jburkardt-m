function cvt_movie_p08 ( n, sample_num, frame_num )

%*****************************************************************************80
%
%% CVT_MOVIE_P08 demonstrates how a CVT can be computed and displayed in MATLAB.
%
%  Discussion:
%
%    This simple example carries out an iterative CVT calculation in the 
%    "holey pie" region, with a uniform density.  The initial placement of the
%    generators is random.
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
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Input, integer FRAME_NUM, the number of frames to generate.
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_MOVIE_P08:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Create a movie of a CVT computation.\n' );
  fprintf ( 1, '  This example uses the "holey pie" geometry.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N is the number of generators.\n' );

  if ( nargin < 1 )
    n = 100;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No input value of N was specified.\n' );
    fprintf ( 1, '  A default value N = %d will be used.\n', n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  N is specified as %d.\n', n )
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_NUM is the number of sample points.\n' );

  if ( nargin < 2 )
    sample_num = 1000 * n;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No value of SAMPLE_NUM was specified.\n' );
    fprintf ( 1, '  A default value SAMPLE_NUM = %d will be used.\n', ...
      sample_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  SAMPLE_NUM is specified as %d.\n', sample_num );
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  FRAME_NUM is the number of "frames" to make\n' );
  fprintf ( 1, '  (and actually the number of iterations, as well).\n' );

  if ( nargin < 3 )
    frame_num = 20;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No value of FRAME_NUM was supplied.\n' );
    fprintf ( 1, '  A default value FRAME_NUM = %d will be used.\n', ...
      frame_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  FRAME_NUM is specified as %d.\n', frame_num );
  end

%
%  This switch is set to 1 (TRUE) if the ACCUMARRAY command is available.
%  That speeds up the calculation a lot.  If you don't have the ACCUMARRAY
%  command, just set this to 0.
%
  accumarray_available = 1;

  if ( accumarray_available )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The ACCUMARRAY command will be used.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'The ACCUMARRAY command will be simulated.\n' );
  end
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
%
%  Randomize the initial locations of the generators.
%
  seed = 0;
  [ p, seed ] = p08_sample ( 2, n, seed );
  p = p';
%
%  TEMPORARY:
%  Cram all the starting points in one small area.
%
  p = zeros(n,2);
  p(1:n,1) = 0.9;
  p(1:n,2) = 0.1;

  p(1:n,1) = 0.6;
  p(1:n,2) = 0.1;

  p(1:n,1:2) = p(1:n,1:2) + 0.01 * rand(n,2);

  frame_file = 'cvt_movie_p08_0000.jpg';
  frame_title = 'cvt\_movie\_p08\_0000.jpg';

  for frame = 1 : frame_num

    frame_file = file_name_inc ( frame_file );
    frame_title = file_name_inc ( frame_title );
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
%  Generate sample points.
%    
    [ ps, seed ] = p08_sample ( 2, sample_num, seed );
    xs = ps(1,:);
    ys = ps(2,:);
%
%  For each sample point, find K, the index of the nearest generator.
%  We do this efficiently by using the Delaunay information.
%  
    k(1:sample_num,1) = dsearch ( p(:,1), p(:,2), t, xs, ys );
%
%  The centroid of the Voronoi region associated with each generator
%  is approximated by the average of the sample points it was closest to.
%
    if ( accumarray_available )
      count = accumarray ( k, ones(sample_num,1) );
      frip = accumarray ( k, xs );
      frap = accumarray ( k, ys );

      n2 = length ( count );
      count(n2+1:n) = 0;
      centroid(1,1:n2) = frip;
      centroid(1,n2+1:n) = p(n2+1:n,1);
      centroid(2,1:n2) = frap;
      centroid(2,n2+1:n) = p(n2+1:n,2);
    else

      count(1:n) = 0;
      centroid(1,1:n) = 0;
      centroid(2,1:n) = 0;

      for i = 1 : sample_num
        j = k(i);
        count(j) = count(j) + 1;
        centroid(1,j) = centroid(1,j) + xs(i);
        centroid(2,j) = centroid(2,j) + ys(i);
      end

    end
%
%  Replace the generators by the centroids.
%
    for i = 1 : n
      if ( count(i) ~= 0 )
        p(i,1) = ( centroid(1,i) ./ count(i) );
        p(i,2) = ( centroid(2,i) ./ count(i) );
      end
    end

%   p(1:n,1) = ( centroid(1,1:n) ./ count(1:n) )';
%   p(1:n,2) = ( centroid(2,1:n) ./ count(1:n) )';
    
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_MOVIE_P08:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
