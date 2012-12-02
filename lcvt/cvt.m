function [ generator_new, seed_new ] = cvt ( m, n, sample_function_init, ...
  sample_function_cvt, sample_num_cvt, maxit, seed, generator )

%*****************************************************************************80
%
%% CVT computes a Centroidal Voronoi Tessellation.
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of Voronoi cells.
%
%    Input, integer SAMPLE_FUNCTION_INIT, initialization function:
%    -1, initialization function is RAND (MATLAB intrinsic);
%    0, initialization function is UNIFORM;
%    1, initialization function is HALTON;
%    2, initialization function is GRID;
%    3, the initial values are set by the user.
%
%    Input, integer SAMPLE_FUNCTION_CVT, region sampling function:
%    -1, sampling function is RAND (MATLAB intrinsic);
%    0, sampling function is UNIFORM;
%    1, sampling function is HALTON;
%    2, sampling function is GRID;
%
%    Input, integer SAMPLE_NUM_CVT, the number of sample points.
%
%    Input, integer MAXIT, the maximum number of correction iterations
%    used in the Voronoi calculation.
%
%    Input, integer SEED, the random number seed.
%
%    Input, real GENERATOR(M,N), the Voronoi cell generators.
%    If SAMPLE_FUNCTION_INIT = 3, the user has initialized these.
%
%    Output, real GENERATOR_NEW(M,N), the updated Voronoi cell generators.
%
%    Output, integer SEED_NEW, the random number seed.
%
  verbose = 1;
%
%  Initialize the generators.
%
  if ( sample_function_init ~= 3 )

    reset = 1;
    sample_num_init = n;

    [ generator(1:m,1:n), seed_new ] = region_sampler ( m, n, n, ...
      sample_function_init, reset, seed );

    seed = seed_new;

  end
%
%  Carry out the iteration.
%
  if ( verbose )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  STEP  L2 Change\n' );
    fprintf ( 1, '\n' );
  end

  for it = 1 : maxit

    [ generator_new, change_l2, seed_new ] = cvt_iteration ( m, n, ...
      generator, sample_num_cvt, sample_function_cvt, seed );

    if ( verbose )
      fprintf ( 1, '%4d %10f\n', it, change_l2 );
    end

    seed = seed_new;
    generator(1:m,1:n) = generator_new(1:m,1:n);

  end

  return
end
