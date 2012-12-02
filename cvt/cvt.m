function [ r, seed, it_num, it_diff, energy ] = cvt ( dim_num, n, batch, init, ...
  sample, sample_num, it_max, it_fixed, seed, r )

%*****************************************************************************80
%
%% CVT computes a Centroidal Voronoi Tessellation.
%
%  Discussion:
%
%    This routine initializes the data, and carries out the
%    CVT iteration.
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
%  Reference:
%
%    Qiang Du, Vance Faber, and Max Gunzburger,
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
%    Input, integer INIT, specifies how the points are to be initialized.
%    -1, 'RAND', using MATLAB's RAND function;
%     0, 'UNIFORM', using a simple uniform RNG;
%     1, 'HALTON', from a Halton sequence;
%     2, 'GRID', points from a grid;
%     3, 'USER', refers to the USER routine;
%     4, points are already initialized on input.
%
%    Input, integer SAMPLE, specifies how the sampling is done.
%    -1, 'RAND', using MATLAB's RAND function;
%     0, 'UNIFORM', using a simple uniform RNG;
%     1, 'HALTON', from a Halton sequence;
%     2, 'GRID', points from a grid;
%     3, 'USER', refers to the USER routine;
%
%    Input, integer SAMPLE_NUM, the number of sample points.
%
%    Input, integer IT_MAX, the maximum number of iterations.
%
%    Input, integer IT_FIXED, the maximum number of iterations to take
%    with a fixed set of sample points.
%
%    Input, integer SEED, the random number seed.
%
%    Input, real R(DIM_NUM,N), the Voronoi cell generators.
%    If INIT = 3 on input, then it is assumed that these values have been
%    initialized.
%
%    Output, real R(DIM_NUM,N), the updated Voronoi cell generators.
%
%    Output, integer SEED, the updated random number seed.
%
%    Output, integer IT_NUM, the number of iterations taken.  Generally,
%    this will be equal to IT_MAX, unless the iteration tolerance was
%    satisfied early.
%
%    Output, real IT_DIFF, the L2 norm of the difference
%    between the iterates.
%
%    Output, real ENERGY, the discrete "energy", divided
%    by the number of sample points.
%
  DEBUG = 1;

  if ( batch < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT - Fatal error!\n' );
    fprintf ( 1, '  The input value BATCH < 1.\n' );
    error ( 'CVT - Fatal error!' );
  end

  if ( seed <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CVT - Fatal error!\n' );
    fprintf ( 1, '  The input value SEED <= 0.\n' );
    error ( 'CVT - Fatal error!' );
  end
  
  if ( DEBUG )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Step    SEED          L2-Change     Energy\n' );
    fprintf ( 1, '\n' );
  end
  
  it_num = 0;
  it_diff = 0.0;
  energy = 0.0;
  seed_init = seed;
%
%  Initialize the data unless the user has already done that.
%
  if ( init ~= 4 )

    initialize = 1;

    [ r, seed ] = cvt_sample ( dim_num, n, n, init, initialize, seed );

  end
  
  if ( DEBUG )
    fprintf ( 1, '  %4d  %12d\n', ...
      it_num, seed_init );
  end

%
%  If the initialization and sampling steps use the same random number
%  scheme, then the sampling scheme does not have to be initialized.
%
  if ( init == sample )
    initialize = 0;
  else
    initialize = 1;
  end
  
  while ( it_num < it_max )
%
%  If it's time to update the seed, save its current value
%  as the starting value for all iterations in this cycle.
%  If it's not time to update the seed, restore it to its initial
%  value for this cycle.
%
    if ( mod ( it_num, it_fixed ) == 0 )
      seed_base = seed;
    else
      seed = seed_base;
    end

    it_num = it_num + 1;

    seed_init = seed;

    [ r, seed, it_diff, energy ] = cvt_iterate ( dim_num, n, batch, sample, ...
      initialize, sample_num, seed, r );

    initialize = 0;

    if ( DEBUG )
      fprintf ( 1, '  %4d  %12d  %14e  %14e\n', ...
        it_num, seed_init, it_diff, energy );
    end

  end 

  return
end
