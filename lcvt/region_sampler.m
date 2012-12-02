function [ x, seed ] = region_sampler ( m, n, n_total, sample_function, ...
  reset, seed )

%*****************************************************************************80
%
%% REGION_SAMPLER returns a sample point in the physical region.
%
%  Discussion:
%
%    This routine original interfaced with a lower routine called
%    TEST_REGION, which tested whether the points generated in the
%    bounding box were actually inside a possibly smaller physical
%    region of interest.  It's been a long time since that option
%    was actually used, so it's been dropped.
%
%    A point is chosen in the bounding box, either by a uniform random
%    number generator, or from a vector Halton sequence.
%
%    The entries of the local vector HALTON_BASE should be distinct primes.
%    Right now, we're assuming M is no greater than 3.
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
%    Input, integer N, the number of points to generate now.
%
%    Input, integer N_TOTAL, the total number of points to generate.
%
%    Input, integer SAMPLE_FUNCTION, sampling function:
%    -1, sampling function is RAND (MATLAB intrinsic);
%    0, sampling function is UNIFORM;
%    1, sampling function is HALTON;
%    2, sampling function is GRID;
%    3, sample points are generated elsewhere, and this routine is skipped.
%
%    Input, logical RESET, if TRUE, then this is the first call for a given
%    computation.
%
%    Input, integer SEED, the random number seed.
%
%    Output, real X(M,N), the sample points.
%
%    Output, integer SEED, the updated random number seed.
%
  global region_sampler_HALTON_BASE
  global region_sampler_HALTON_SEED
  global region_sampler_NGRID
  global region_sampler_RANK

  if ( sample_function == -1 )

    x(1:m,1:n) = rand ( m, n );

  elseif ( sample_function == 0 )

    for j = 1 : n
      for i = 1 : m
        [ x(i,j), seed ] = r8_uniform_01 ( seed );
      end
    end

  elseif ( sample_function == 1 )

    if ( reset )

      region_sampler_HALTON_SEED = 1;

      for i = 1 : m
        region_sampler_HALTON_BASE(i) = prime(i);
      end

    end
%
%  It really does annoy me that MATLAB is so peculiar about its conventions
%  for row and column vectors.  I much prefer the FORTRAN 90 convention, in which
%  N numbers go to N slots, and the language can figure it out on its own!
%
    for j = 1 : n
      x(1:m,j) = ( i4_to_halton ( region_sampler_HALTON_SEED, ...
        region_sampler_HALTON_BASE ) )';
      region_sampler_HALTON_SEED = region_sampler_HALTON_SEED + 1;
    end

  elseif ( sample_function == 2 )

    if ( reset )

      region_sampler_RANK = 0;
      exponent = 1.0 / m;
      region_sampler_NGRID = floor ( n_total^exponent );

      if ( region_sampler_NGRID^m < n_total )
        region_sampler_NGRID = region_sampler_NGRID + 1;
      end

    end

    for j = 1 : n
      tuple = tuple_next_fast ( region_sampler_NGRID, m, region_sampler_RANK );
      region_sampler_RANK = region_sampler_RANK + 1;
      x(1:m,j) = ( ( 2 * tuple(1:m) - 1 ) / ( 2 * region_sampler_NGRID ) )';
    end

  elseif ( sample_function == 3 )

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'REGION_SAMPLER - Fatal error\n' );
    fprintf ( 1, '  Illegal SAMPLE_FUNCTION = %d\n', sample_function );
    error ( 'REGION_SAMPLER - Fatal error!' );
  end

  return
end
