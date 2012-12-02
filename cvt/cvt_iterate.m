function [ r, seed, it_diff, energy ] = cvt_iterate ( dim_num, n, batch, ...
  sample, initialize, sample_num, seed, r )

%*****************************************************************************80
%
%% CVT_ITERATE takes one step of the CVT iteration.
%
%  Discussion:
%
%    The routine is given a set of points, called "generators", which
%    define a tessellation of the region into Voronoi cells.  Each point
%    defines a cell.  Each cell, in turn, has a centroid, but it is
%    unlikely that the centroid and the generator coincide.
%
%    Each time this CVT iteration is carried out, an attempt is made
%    to modify the generators in such a way that they are closer and
%    closer to being the centroids of the Voronoi cells they generate.
%
%    A large number of sample points are generated, and the nearest generator
%    is determined.  A count is kept of how many points were nearest to each
%    generator.  Once the sampling is completed, the location of all the
%    generators is adjusted.  This step should decrease the discrepancy
%    between the generators and the centroids.
%
%    The centroidal Voronoi tessellation minimizes the "energy",
%    defined to be the integral, over the region, of the square of
%    the distance between each point in the region and its nearest generator.
%    The sampling technique supplies a discrete estimate of this
%    energy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Qiang Du, Vance Faber, Max Gunzburger,
%    Centroidal Voronoi Tessellations: Applications and Algorithms,
%    SIAM Review, Volume 41, 1999, pages 637-676.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of Voronoi cells.
%
%    Input, integer BATCH, sets the maximum number of sample points
%    generated at one time.  It is inefficient to generate the sample
%    points 1 at a time, but memory intensive to generate them all
%    at once.  You might set BATCH to min ( SAMPLE_NUM, 10000 ), for instance.
%    BATCH must be at least 1.
%
%    Input, integer SAMPLE, specifies how the sampling is done.
%    -1, 'RAND', using MATLAB's RAND function;
%     0, 'UNIFORM', using a simple uniform RNG;
%     1, 'HALTON', from a Halton sequence;
%     2, 'GRID', points from a grid;
%     3, 'USER', refers to the USER routine;
%
%    Input, logical INITIALIZE, is TRUE if the SEED must be reset to SEED_INIT
%    before computation.  Also, the pseudorandom process may need to be
%    reinitialized.
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Input, integer SEED, the random number seed.
%
%    Input, real R(DIM_NUM,N), the Voronoi cell generators.
%
%    Output, real R(DIM_NUM,N), the updated Voronoi cell generators.
%
%    Output, integer SEED, the updated random number seed.
%
%    Output, real IT_DIFF, the L2 norm of the difference
%    between the iterates.
%
%    Output, real ENERGY, the discrete "energy", divided
%    by the number of sample points.
%

%
%  Take each generator as the first sample point for its region.
%  This can slightly slow the convergence, but it simplifies the
%  algorithm by guaranteeing that no region is completely missed
%  by the sampling.
%
  energy = 0.0;
  r2(1:dim_num,1:n) = r(1:dim_num,1:n);
  count(1:n) = 1;
%
%  Generate the sampling points S in batches.
%
  have = 0;

  while ( have < sample_num )

    get = min ( sample_num - have, batch );

    [ s, seed ] = cvt_sample ( dim_num, sample_num, get, sample, initialize, ...
      seed );
  
    initialize = 0;
    have = have + get;
%
%  Find the index N of the nearest cell generator to each sample point S.
%
    nearest = find_closest ( dim_num, n, get, s, r );
%
%  Add S to the centroid associated with generator N.
%
    for j = 1 : get
      r2(1:dim_num,nearest(j)) = r2(1:dim_num,nearest(j)) + s(1:dim_num,j);
      energy = energy + sum ( ( r(1:dim_num,nearest(j)) - s(1:dim_num,j) ).^2 );
      count(nearest(j)) = count(nearest(j)) + 1;
    end

  end
%
%  Estimate the centroids.
%
  for j = 1 : n
    r2(1:dim_num,j) = r2(1:dim_num,j) / count(j);
  end
%
%  Determine the sum of the distances between generators and centroids.
%
  it_diff = 0.0;
  for j = 1 : n
    it_diff = it_diff + sqrt ( sum ( ( r2(1:dim_num,j) - r(1:dim_num,j) ).^2 ) );
  end
%
%  Replace the generators by the centroids.
%
  r(1:dim_num,1:n) = r2(1:dim_num,1:n);
%
%  Normalize the discrete energy estimate.
%
  energy = energy / sample_num;

  return
end
