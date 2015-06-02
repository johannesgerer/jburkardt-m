function [ energy, seed ] = cluster_energy ( dim_num, n, cell_generator, ...
  sample_num_cvt, sample_function_cvt, seed )

%*****************************************************************************80
%
%% CLUSTER_ENERGY returns the energy of a dataset.
%
%  Discussion:
%
%    The energy is the integral of the square of the distance from each point
%    in the region to its nearest generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of Voronoi cells.
%
%    Input, real CELL_GENERATOR(DIM_NUM,N), the Voronoi
%    cell generators.
%
%    Input, integer SAMPLE_NUM_CVT, the number of sample points.
%
%    Input, integer SAMPLE_FUNCTION_CVT, specifies how the region is sampled:
%    -1, the sampling function is RANDOM_NUMBER (Fortran90 intrinsic),
%    0, the sampling function is UNIFORM,
%    1, the sampling function is HALTON,
%    2, the sampling function is GRID.
%
%    Input, integer SEED, the random number seed.
%
%    Output, real ENERGY, the (estimated) energy of the dataset.
%
%    Output, integer SEED, the updated random number seed.
%
  energy = 0.0;
  reset = 1;

  for j = 1 : sample_num_cvt
%
%  Generate a sampling point X.
%
    [ x, seed ] = region_sampler ( dim_num, 1, sample_num_cvt, ...
     sample_function_cvt, reset, seed );
%
%  Ensure that X is a column vector.
%
    x = x(:);

    reset = 0;
%
%  Find the nearest cell generator.
%
    nearest = find_closest ( dim_num, n, x, cell_generator );
%
%  Add the contribution to the energy.
%
    energy = energy ...
      + sum ( cell_generator(1:dim_num,nearest) - x(1:dim_num) ).^2;

  end

  energy = energy / sample_num_cvt;

  return
end
