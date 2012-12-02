function [ generator_new, change_l2, seed ] = cvt_iteration ( m, n, ...
  generator, sample_num_cvt, sample_function_cvt, seed )

%*****************************************************************************80
%
%%  CVT_ITERATION takes one step of the CVT iteration.
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
%    Input, real GENERATOR(M,N), the Voronoi cell generators.
%
%    Input, integer SAMPLE_NUM_CVT, the number of sample points.
%
%    Input, integer SAMPLE_FUNCTION_CVT, region sampling function:
%    -1, sampling function is RAND (MATLAB intrinsic);
%    0, sampling function is UNIFORM;
%    1, sampling function is HALTON;
%    2, sampling function is GRID;
%
%    Input, integer SEED, the random number seed.
%
%    Output, real GENERATOR_NEW(M,N), the new Voronoi cell generators.  
%
%    Output, integer SEED, the new random number seed.
%
%    Output, real CHANGE_L2, the L2 norm of the difference between
%    the input and output data.
%
  generator_new(1:m,1:n) = 0.0;
  tally(1:n) = 0;
  reset = 1;

  for j = 1 : sample_num_cvt
%
%  Generate a sampling point X.
%
    [ x(1:m), seed ] = region_sampler ( m, 1, sample_num_cvt, ...
       sample_function_cvt, reset, seed );

    reset = 0;
%
%  Find the nearest cell generator.
%
    nearest = find_closest ( m, n, x, generator );
%
%  Add X to the averaging data for GENERATOR(*,NEAREST).
%
    for i = 1 : m
      generator_new(i,nearest) = generator_new(i,nearest) + x(i);
    end
    tally(nearest) = tally(nearest) + 1;

  end
%
%  Compute the new generators.
%
  for j = 1 : n
    if ( tally(j) ~= 0 )
      generator_new(1:m,j) = generator_new(1:m,j) / tally(j);
    end
  end
%
%  Determine the change.
%
  change_l2 = 0.0;
  for j = 1 : n
    for i = 1 : m
      change_l2 = change_l2 + ( generator_new(i,j) - generator(i,j) )^2;
    end
  end
  change_l2 = sqrt ( change_l2 );

  return
end
