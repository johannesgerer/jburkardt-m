function [ r, seed ] = cvt_sample ( dim_num, n, n_now, sample, initialize, seed )

%*****************************************************************************80
%
%% CVT_SAMPLE returns sample points.
% 
%  Discussion:
%
%    N sample points are to be taken from the unit box of dimension DIM_NUM.
%
%    These sample points are usually created by a pseudorandom process
%    for which the points are essentially indexed by a quantity called
%    SEED.  To get N sample points, we generate values with indices
%    SEED through SEED+N-1.
%
%    It may not be practical to generate all the sample points in a 
%    single call.  For that reason, the routine allows the user to
%    request a total of N points, but to require that only N_NOW be
%    generated now (on this call).  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of sample points to be generated.
%
%    Input, integer N_NOW, the number of sample points to be generated
%    on this call.  N_NOW must be at least 1.
%
%    Input, integer SAMPLE, specifies how the sampling is done.
%    -1, 'RAND', using MATLAB RAND function;
%     0, 'UNIFORM', using a simple uniform RNG;
%     1, 'HALTON', from a Halton sequence;
%     2, 'GRID', points from a grid;
%     3, 'USER', refer to USER routine.
%
%    Input, logical INITIALIZE, is TRUE if the pseudorandom process should be
%    reinitialized.
%
%    Input, integer SEED, the random number seed.
%
%    Output, real R(DIM_NUM,N_NOW), the initial value for the generators.
%
%    Output, integer SEED, the updated random number seed.
%
  if ( n_now < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  N_NOW < 1.\n' );
    error ( 'CVT_SAMPLE - Fatal error!' );
  end

  if ( sample == -1 )

    if ( initialize )
      random_initialize ( seed );
    end

    r = rand ( dim_num, n_now );

    seed = seed + n_now * dim_num;

  elseif ( sample == 0 )

    [ r, seed ] = r8mat_uniform_01 ( dim_num, n_now, seed );

  elseif ( sample == 1 )

    halton_step = seed;
    halton_seed(1:dim_num) = 0;
    halton_leap(1:dim_num) = 1;

    for i = 1 : dim_num
      halton_base(i) = prime ( i );
    end

    r(1:dim_num,1:n_now) = i4_to_halton_sequence ( dim_num, n_now, ...
      halton_step, halton_seed, halton_leap, halton_base );

    seed = seed + n_now;

  elseif ( sample == 2 )

    exponent = 1.0 / dim_num;
    ngrid = floor ( n^exponent );
    rank_max = ngrid^dim_num;

    if ( rank_max < n )
      ngrid = ngrid + 1;
      rank_max = ngrid^dim_num;
    end

    if ( initialize )
      rank = -1;
      tuple(1:dim_num) = tuple_next_fast ( ngrid, dim_num, rank );
    end

    rank = mod ( seed, rank_max );

    for j = 1 : n_now
      tuple(1:dim_num) = tuple_next_fast ( ngrid, dim_num, rank );
      rank = rank + 1;
      rank = mod ( rank, rank_max );
      r(1:dim_num,j) = ( 2 * tuple(1:dim_num)' - 1 ) / ( 2 * ngrid );
    end

    seed = seed + n_now;

  elseif ( sample == 3 )

    [ r, seed ] = user ( dim_num, n_now, seed );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  The value of SAMPLE = %d is illegal.\n', sample );
    error ( 'CVT_SAMPLE - Fatal error!' );

  end

  return
end
