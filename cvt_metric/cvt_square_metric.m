function p = cvt_square_metric ( n, sample_num )

%*****************************************************************************80
%
%% CVT_SQUARE_METRIC computes a CVT with a variable metric function.
%
%  Discussion:
%
%    This program computes a CVT, but assumes that distances are determined
%    by a metric function:
%
%      d(x,y) = sqrt ( (x-y)' * A * (x-y) )
%
%    where A is a symmetric positive definite matrix.  We will NOT assume
%    the matrix A is constant.  Instead, we will assume that it varies
%    spatially.  For simplicity, when computing d(x,y), we will evaluate
%    A at the midpoint (x+y)/2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Qiang Du, Vance Faber and Max Gunzburger,
%    Centroidal Voronoi Tessellations: Applications and Algorithms,
%    SIAM Review, Volume 41, 1999, pages 637-676.
%
%  Parameters:
%
%    Input, integer N, the number of generators.
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Output, real P(N,2), the location of the generators.
%
%    Output, integer T(NT,3), information defining the Delaunay
%    triangulation of the generators.  NT is the number of triangles,
%    which varies depending on the arrangement of the generators.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_SQUARE_METRIC:\n' );
  fprintf ( 1, '  A simple demonstration of a CVT computation\n' );
  fprintf ( 1, '  (Centroidal Voronoi Tessellation)\n' );
  fprintf ( 1, '  in a square, using a metric matrix.\n' );
  
  if ( nargin < 1 )
    n = 100;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No value of N was supplied.\n' );
    fprintf ( 1, '  N is the number of generators.\n' );
    fprintf ( 1, '  A default value N = %d will be used.\n', n );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  User specified number of generators = %d\n',  n );
  end

  if ( nargin < 2 )
    sample_num = 1000 * n;
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No value of SAMPLE_NUM was supplied.\n' );
    fprintf ( 1, '  SAMPLE_NUM is the number of sample points.\n' );
    fprintf ( 1, '  A default value SAMPLE_NUM = %d will be used.\n', ...
      sample_num );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  User specified number of sample points = %d\n', ...
      sample_num );
  end
%
%  This switch is set to 1 (TRUE) if the ACCUMARRAY command is available.
%  That speeds up the calculation a lot.  If you don't have the ACCUMARRAY
%  command, just set this to 0.
% 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  MATLAB''s ACCUMARRAY command can be used for faster\n' );
  fprintf ( 1, '  computation.  This command is not available in\n' );
  fprintf ( 1, '  some versions of MATLAB.  If ACCUMARRAY is available,\n' );
  fprintf ( 1, '  simply make sure that the ACCUMARAY_AVAILABLE variable\n' );
  fprintf ( 1, '  is set to 1!\n' );
  
  accumarray_available = 1;

  if ( accumarray_available )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The ACCUMARRAY command will be used.\n' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The ACCUMARRAY command will NOT be used.\n' );
  end
%
%  Clear the figure screen, if already open.
%
  clf
%
%  Randomize the initial locations of the generators in the unit square.
%  If another region is used, then this initialization should be changed.
%
  p = square_uniform ( n );
  
  it = 0;
  
  while ( it <= 20 )
%
%  Display the CVT generators, and the associated Voronoi diagram.
%
    scatter ( p(:,1), p(:,2), [], 'b', 'filled' );
    axis ( [ -0.1, 1.1, -0.1, 1.1 ] )
    line ( [ 0.0, 1.0, 1.0, 0.0, 0.0 ], [ 0.0, 0.0, 1.0, 1.0, 0.0 ], ...
      'Color', 'r' );
    title_string = sprintf ( 'Points, step %d', it );
    title ( title_string );
    axis equal
    drawnow
%
%  Generate sample points.  
%
%  These sample points implicitly define the geometry of the region.  
%  If the region is not a unit square, then the range of the sample 
%  data must be changed.
%
%  The data is sampled uniformly.  If a nonuniform density is desired,
%  then the sampling must be done in a biased way.
%    
    ps = square_uniform ( sample_num );
%
%  For each sample point, find K, the nearest generator.
%
    k(1:sample_num,1) = 0;
    d(1:sample_num,1) = Inf;
        
    for g = 1 : n
%
%  For some asine reason, can't say p(g,1:2) here...
%
      p_matlab_idiots = p(g,1:2);
      A = metric_04 ( p_matlab_idiots );
      
      for s = 1 : sample_num
        d2 = ( ps(s,1:2) - p(g,1:2) ) * A * ( ps(s,1:2) - p(g,1:2) )';
        if ( d2 < d(s,1) )
          k(s,1) = g;
          d(s,1) = d2;
        end
      end

    end
%
%  The centroid of the Voronoi region associated with each generator
%  is approximated by the average of the sample points it was closest to.
%
    if ( accumarray_available )

      count(1:n) = accumarray ( k, ones(sample_num,1) );
      centroid(1,1:n) = accumarray ( k, ps(:,1) );
      centroid(2,1:n) = accumarray ( k, ps(:,2) );

    else

      count(1:n) = 0;
      centroid(1,1:n) = 0;
      centroid(2,1:n) = 0;

      for i = 1 : sample_num
        j = k(i);
        count(j) = count(j) + 1;
        centroid(1,j) = centroid(1,j) + ps(i,1);
        centroid(2,j) = centroid(2,j) + ps(i,2);
      end

    end
%
%  Replace the generators by the centroids.
%
    p(1:n,1) = ( centroid(1,1:n) ./ count(1:n) )';
    p(1:n,2) = ( centroid(2,1:n) ./ count(1:n) )';
    
    fprintf ( 1, 'Completed iteration %d\n', it );

    it = it + 1;
    
  end

  t = delaunay ( p(:,1), p(:,2) );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_SQUARE_METRIC:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
