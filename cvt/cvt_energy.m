function [ energy, seed ] = cvt_energy ( dim_num, n, batch, sample, ...
  initialize, sample_num, seed, r )

%*****************************************************************************80
%
%% CVT_ENERGY computes the CVT energy of a dataset.
%
%  Discussion:
%
%    For a given number of generators, a CVT is a minimizer (or at least
%    a local minimizer) of the CVT energy.  During a CVT iteration,
%    it should generally be the case that the CVT energy decreases from
%    step to step, and that perturbations or adjustments of an
%    approximate CVT will almost always have higher CVT energy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of generators.
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
%    Output, real ENERGY, the estimated CVT energy.
%
%    Output, integer SEED, an updated seed for the random number generator.
%

%
%  Generate the sampling points S in batches.
%
  have = 0;
  energy = 0.0;
  
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
      energy = energy + sum ( ( r(1:dim_num,nearest(j)) - s(1:dim_num,j) ).^2 );
    end

  end

  energy = energy / sample_num;

  return
end
