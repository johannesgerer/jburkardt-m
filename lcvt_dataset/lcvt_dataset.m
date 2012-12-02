function lcvt_dataset ( )

%*****************************************************************************80
%
%% LCVT_DATASET generates a Latinized CVT dataset and writes it to a file.
%
%  Discussion:
%
%    This program is meant to be used interactively.  It's also
%    possible to prepare a simple input file beforehand and use it
%    in batch mode.
%
%    The program requests input values from the user:
%
%    * DIM_NUM, the spatial dimension;
%    * N, the number of points to generate;
%    * SEED_INIT, a seed to use for random number generation;
%    * INIT, initialize the points:
%      ** file, by reading data from file;
%      ** GRID, picking points from a grid;
%      ** HALTON, from a Halton sequence;
%      ** RANDOM, using FORTRAN RANDOM function;
%      ** UNIFORM, using a simple uniform RNG;
%      ** USER, call the "user" routine;
%    * CVT_IT_NUM, the maximum number of iterations;
%    * SAMPLE, how to conduct the sampling:
%      ** GRID, picking points from a grid;
%      ** HALTON, from a Halton sequence;
%      ** RANDOM, using FORTRAN RANDOM function;
%      ** UNIFORM, using a simple uniform RNG;
%      ** USER, call the "user" routine.
%    * SAMPLE_NUM, the number of sampling points;
%    * BATCH, the number of sampling points to create at one time.
%    * LAT_IT_NUM, the maximum number of iterations;
%    * OUTPUT, a file in which to store the data.
%
%    To indicate that no further computations are desired, it is 
%    enough to input a nonsensical value, such as -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Qiang Du, Vance Faber, and Max Gunzburger,
%    Centroidal Voronoi Tessellations: Applications and Algorithms,
%    SIAM Review,
%     Volume 41, 1999, pages 637-676.
%
  DEBUG = 1;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LCVT_DATASET\n' );
  fprintf ( 1, '  MATLAB version)\n' );
  fprintf ( 1, '  Generate a Latinized CVT dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program is meant to be used interactively.\n' );
  fprintf ( 1, '  It is also possible to prepare a simple input \n' );
  fprintf ( 1, '  file beforehand and use it in batch mode.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program requests input values from the user:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * DIM_NUM, the spatial dimension,\n' );
  fprintf ( 1, '  * N, the number of points to generate,\n' );
  fprintf ( 1, '  * SEED_INIT, a seed to use for random number generation,\n' );
  fprintf ( 1, '  * INIT, initialize the points:\n' );
  fprintf ( 1, '    ** file, read data from a file;\n' );
  fprintf ( 1, '    ** ''GRID'', by picking points from a grid;\n' );
  fprintf ( 1, '    ** ''HALTON'', from a Halton sequence;\n' );
  fprintf ( 1, '    ** ''RAND'', using MATLAB''s RAND function;\n' );
  fprintf ( 1, '    ** ''UNIFORM'', using a simple uniform RNG;\n' );
  fprintf ( 1, '    ** ''USER'', refers to the USER routine;\n' );
  fprintf ( 1, '  * CVT_IT_NUM, the number of CVT iterations.\n' );
  fprintf ( 1, '  * SAMPLE, how to conduct the sampling.\n' );
  fprintf ( 1, '    ** ''GRID'', by picking points from a grid;\n' );
  fprintf ( 1, '    ** ''HALTON'', from a Halton sequence;\n' );
  fprintf ( 1, '    ** ''RAND'', using MATLAB''s RAND function;\n' );
  fprintf ( 1, '    ** ''UNIFORM'', using a simple uniform RNG;\n' );
  fprintf ( 1, '    ** ''USER'', refers to the USER routine;\n' );
  fprintf ( 1, '  * SAMPLE_NUM, the number of sample points;\n' );
  fprintf ( 1, '  * BATCH, the number of sample points to create at a time;\n' );
  fprintf ( 1, '  * LAT_IT_NUM, the number of Latinizing iterations.\n' );
  fprintf ( 1, '  * OUTPUT, a file into which the data is stored.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To indicate that no further computations are \n' );
  fprintf ( 1, '  desired, it is enough to input a nonsensical value, \n' );
  fprintf ( 1, '  such as -1.\n' );

  fprintf ( 1, '  *\n' );
  fprintf ( 1, ' *\n' );
  fprintf ( 1, '*  Ready to generate a new dataset:\n' );
  fprintf ( 1, ' *\n' );
  fprintf ( 1, '  *\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM is the spatial dimension.\n' );
  fprintf ( 1, '  (Try ''2'' if you have no preference.)\n' );
  fprintf ( 1, '  (Any value less than 1 terminates execution.)\n' );
  dim_num = [];
  dim_num = input ( '  Enter DIM_NUM:  ' );

  fprintf ( 1, '  User input DIM_NUM = %12d\n', dim_num );

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of DIM_NUM = %d\n', dim_num );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N is the number of points to generate.\n' );
  fprintf ( 1, '  (Try ''25'' if you have no preference.)\n' );
  fprintf ( 1, '  (Any value less than 1 terminates execution.)\n' );
  n = [];
  n = input ( '  Enter N:  ' );

  fprintf ( 1, '  User input N = %12d\n', n );

  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of N = %d\n', n );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SEED_INIT is a seed for the random number generation.\n' );
  fprintf ( 1, '  (Try ''123456789'' if you have no preference.)\n' );
  fprintf ( 1, '  (Any value less than 0 terminates execution.)\n' );
  seed_init = [];
  seed_init = input ( '  Enter SEED_INIT:  ' );

  fprintf ( 1, '  User input SEED_INIT = %d\n', seed_init );

  if ( seed_init < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of SEED_INIT = %d\n', seed_init );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  seed = seed_init;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  INIT is the method of initializing the data:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  file       read data from a file;\n' );
  fprintf ( 1, '  ''GRID''     by picking points from a grid;\n' );
  fprintf ( 1, '  ''HALTON''   from a Halton sequence;\n' );
  fprintf ( 1, '  ''RAND''     using MATLAB''s RAND function;\n' );
  fprintf ( 1, '  ''UNIFORM''  using a simple uniform RNG;\n' );
  fprintf ( 1, '  ''USER''     refers to the USER routine;\n' );
  fprintf ( 1, ' \n' );
  fprintf ( 1, '  (Try ''RAND'' if you have no preference.)\n' );
  fprintf ( 1, '  (A blank value terminates execution).\n' );
  fprintf ( 1, '  (Be sure to INCLUDE QUOTES around the string!\n' );
  fprintf ( 1, ' \n' );

  init_string = [];
  init_string = input ( '  Enter INIT:  ' );

  fprintf ( 1, '  User input INIT = "%s".\n', init_string );

  if ( s_len_trim ( init_string ) <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of INIT \n' );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  input_file_name = [];
  
  if ( s_eqi ( init_string, 'RAND'  ) )
    init = -1;
  elseif ( s_eqi ( init_string, 'RANDOM' ) )
    init_string = 'RAND';
    init = -1;
  elseif ( s_eqi ( init_string, 'UNIFORM' ) )
    init = 0;
  elseif ( s_eqi ( init_string, 'HALTON'  ) )
    init = 1;
  elseif ( s_eqi ( init_string, 'GRID'    ) )
    init = 2;
  elseif ( s_eqi ( init_string, 'USER'    ) )
    init = 3;
  elseif ( 0 < s_len_trim ( init_string ) )
    init = 4;
    input_file_name = init_string;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of INIT \n' );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  CVT_IT_NUM is the number of CVT iterations.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A CVT iteration carries out the following steps:\n' );
  fprintf ( 1, '  * the Voronoi region associated with each\n' );
  fprintf ( 1, '    generator is estimated by sampling;\n' );
  fprintf ( 1, '  * the centroid of each Voronoi region is estimated.\n' );
  fprintf ( 1, '  * the generator is replaced by the centroid.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  If "enough" sampling points are used,\n' );
  fprintf ( 1, '  and "enough" iterations are taken, this process\n' );
  fprintf ( 1, '  will converge.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (Try ''50'' if you have no preference.)\n' );
  fprintf ( 1, '  (A negative value terminates execution).\n' );
  fprintf ( 1, '\n' );
  cvt_it_num = [];
  cvt_it_num = input ( '  Enter CVT_IT_NUM:  ' );

  fprintf ( 1, '  User input CVT_IT_NUM = %12d\n', cvt_it_num );

  if ( cvt_it_num < 0 )
    fprintf ( 1, ' \n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of CVT_IT_NUM = %d\n', cvt_it_num );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE is the method of sampling the region:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  ''GRID''     by picking points from a grid;\n' );
  fprintf ( 1, '  ''HALTON''   from a Halton sequence;\n' );
  fprintf ( 1, '  ''RAND''     using MATLAB''s RAND function;\n' );
  fprintf ( 1, '  ''UNIFORM''  using a simple uniform RNG;\n' );
  fprintf ( 1, '  ''USER''     refers to the USER routine;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (Try ''RAND'' if you have no preference.)\n' );
  fprintf ( 1, '  (A blank value terminates execution).\n' );
  fprintf ( 1, '  (Be sure to INCLUDE QUOTES around the string!\n' );
  fprintf ( 1, '\n' );

  sample_string = [];
  sample_string = input ( '  Enter SAMPLE:  ' );

  fprintf ( 1, '  User input SAMPLE = "%s".\n', sample_string );

  if ( s_len_trim ( sample_string ) <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of SAMPLE \n' );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  if ( s_eqi ( sample_string, 'RAND'  ) )
    sample = -1;
  elseif ( s_eqi ( sample_string, 'RANDOM' ) )
    sample = -1;
    sample_string = 'RAND';
  elseif ( s_eqi ( sample_string, 'UNIFORM' ) )
    sample = 0;
  elseif ( s_eqi ( sample_string, 'HALTON'  ) )
    sample = 1;
  elseif ( s_eqi ( sample_string, 'GRID'    ) )
    sample = 2; 
  elseif ( s_eqi ( sample_string, 'USER'    ) )
    sample = 3; 
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of SAMPLE \n' );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_NUM is the number of sample points.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The Voronoi regions will be explored by generating\n' );
  fprintf ( 1, '  SAMPLE_NUM points.  For each sample point, the\n' );
  fprintf ( 1, '  nearest generator is found.  Using more points\n' );
  fprintf ( 1, '  gives a better estimate of these regions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SAMPLE_NUM should be much larger than N, the\n' );
  fprintf ( 1, '  number of generators.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (Try ''10000'' if you have no preference.)\n' );
  fprintf ( 1, '  (A zero or negative value terminates execution.)\n' );
  fprintf ( 1, '\n' );

  sample_num = [];
  sample_num = input ( '  Enter SAMPLE_NUM:  ' );

  fprintf ( 1, '  User input SAMPLE_NUM = %12d\n', sample_num );

  if ( sample_num <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of SAMPLE_NUM = %12d\n', sample_num );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  BATCH is the number of sample points to create\n' );
  fprintf ( 1, '  at one time\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  BATCH should be between 1 and SAMPLE_NUM.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  It is FASTER to set BATCH to SAMPLE_NUM;\n' );
  fprintf ( 1, '  setting BATCH to 1 requires the least memory.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (Try ''%d'' if you have no preference.)\n', ...
    min ( 1000, sample_num ) );
  fprintf ( 1, '  (A zero or negative value terminates execution.)\n' );
  fprintf ( 1, '\n' );

  batch = [];
  batch = input ( '  Enter BATCH:  ' );

  fprintf ( 1, '  User input BATCH = %d\n', batch );

  if ( batch <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of BATCH = %d\n', batch );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LAT_IT_NUM is the number of Latinizing iterations.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Each step of the latinizing iteration begins\n' );
  fprintf ( 1, '  by carrying out CVT_IT_NUM steps of CVT iteration,\n' );
  fprintf ( 1, '  after which the data is \"latinized\".\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Often, one latinizing step is enough.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In some cases, it may be worth while to carry\n' );
  fprintf ( 1, '  out several latinizing steps; that is, the\n' );
  fprintf ( 1, '  Latinized data is smoothed by another series\n' );
  fprintf ( 1, '  of CVT steps, then latinized, and so on.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (Try ''1'' if you have no preference.)\n' );
  fprintf ( 1, '  (A negative value terminates execution).\n' );
  fprintf ( 1, '\n' );
  lat_it_num = [];
  lat_it_num = input ( '  Enter LAT_IT_NUM:  ' );

  fprintf ( 1, '  User input LAT_IT_NUM = %12d\n', lat_it_num );

  if ( lat_it_num < 0 )
    fprintf ( 1, ' \n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of LAT_IT_NUM = %d\n', lat_it_num );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  OUTPUT is a file into which the data is stored;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  (Try ''lcvt.txt'' if you have no preference.)\n' );
  fprintf ( 1, '  (A blank value terminates execution).\n' );
  fprintf ( 1, '  (Be sure to INCLUDE QUOTES around the string!\n' );
  fprintf ( 1, ' \n' );

  output_file_name = [];
  output_file_name = input ( '  Enter OUTPUT:  ' );

  fprintf ( 1, '  User input OUTPUT = "%s".\n', output_file_name );

  if ( s_len_trim ( output_file_name ) <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of OUTPUT \n' );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end

  if ( s_len_trim ( output_file_name ) <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_DATASET\n' );
    fprintf ( 1, '  The input value of OUTPUT \n' );
    fprintf ( 1, '  is interpreted as a request for termination.\n' );
    fprintf ( 1, '  Normal end of execution.\n' );
    return
  end
%
%  Initialize the data.
%
  if ( init == 4 )

    r = r8mat_data_read ( input_file_name, dim_num, n );

  else

    n_total = n;
    reset = 1;

    [ r, seed ] = region_sampler ( dim_num, n, n_total, init, reset, seed );

  end
    
  if ( 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Latin IT      CVT Energy    Latin Energy\n' );
    fprintf ( 1, '\n' );
  end

  for lat_it = 1 : lat_it_num

    if ( 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '    CVT IT  Change\n' );
      fprintf ( 1, '\n' );
    end
    
    for cvt_it = 1 : cvt_it_num

      [ r, seed, cvt_it_diff ] = cvt_iteration ( dim_num, n, r, sample_num, ...
        sample, seed );

      if ( 0 )
        fprintf ( 1, '  %8d  %14f\n', cvt_it, cvt_it_diff );
      end

    end

    if ( 0 )
      fprintf ( 1, '\n' );
    end

    [ cvt_energy, seed ] = cluster_energy ( dim_num, n, r, sample_num, ...
      sample, seed );

    r = r8mat_latinize ( dim_num, n, r );

    [ lat_energy, seed ] = cluster_energy ( dim_num, n, r, sample_num, ...
      sample, seed );

    fprintf ( 1, '  %8d  %14f  %14f\n', lat_it, cvt_energy, lat_energy );

  end
%
%  Write the data to a file.
%
  lcvt_write ( dim_num, n, seed_init, init, input_file_name, sample, ...
    sample_num, cvt_it_num, cvt_energy, lat_it_num, lat_energy, ...
    r, output_file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', ...
    output_file_name );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LCVT_DATASET:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function c = ch_cap ( c )

%*****************************************************************************80
%
%% CH_CAP capitalizes a single character.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character C, the character to capitalize.
%
%    Output, character C, the capitalized character.
%
  if ( 'a' <= c & c <= 'z' )
    c = c + 'A' - 'a';
  end

  return
end
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
%    09 August 2005
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

    reset = 0;
%
%  Find the nearest cell generator.
%
    nearest = find_closest ( dim_num, n, 1, x, cell_generator );
%
%  Add the contribution to the energy.
%
    energy = energy ...
      + sum ( cell_generator(1:dim_num,nearest) - x(1:dim_num) ).^2;

  end

  energy = energy / sample_num_cvt;

  return
end
function [ generator_new, change_l2, seed ] = cvt_iteration ( m, n, ...
  generator, sample_num_cvt, sample_function_cvt, seed )

%*****************************************************************************80
%
%% CVT_ITERATION takes one step of the CVT iteration.
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
    nearest = find_closest ( m, n, 1, x, generator );
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
function nearest = find_closest ( dn, gn, sn, s, g )

%*****************************************************************************80
%
%% FIND_CLOSEST finds the nearest G point to each S point.
%
%  Discussion:
%
%    Given two sets of points G and S, this function finds, for every
%    s in S, the index of the closest point g in G.
%
%    This procedure would seem to naturally require GN * SN operations,
%    and that is how this function is programmed.  However, for large
%    datasets, this cost can be prohibitive, and there are procedures
%    for preprocessing the dataset G that can greatly reduce this cost.
%
%    Modified in accordance with suggestions by Gene Cliff, 08 July 2010.
%
%    Modified yet again to deal with the special case of DN = 1,
%    15 September 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DN, the spatial dimension.
%
%    Input, integer GN, the number of cell generators.
%
%    Input, integer SN, the number of sample points.
%
%    Input, real S(DN,SN), the points to be checked.
%
%    Input, real G(DN,GN), the cell generators.
%
%    Output, integer NEAREST(SN), the index of the cell generator nearest
%    to the sample point.
%
  ones_k = ones ( 1, gn );
  nearest = NaN ( 1, sn );

  for i = 1 : sn
    d1(1:dn,1:gn) = g(1:dn,1:gn) - s(1:dn,i) * ones_k;
    d2 = sum ( d1 .* d1, 1 );
    [ min_val, min_loc ] = min ( d2 );
    nearest(i) = min_loc;
  end

  return
end
function r = i4_to_halton ( seed, base )

%*****************************************************************************80
%
%% I4_TO_HALTON computes an element of a Halton sequence.
%
%  Reference:
%
%    John Halton,
%    On the efficiency of certain quasi-random sequences of points
%    in evaluating multi-dimensional integrals,
%    Numerische Mathematik,
%    Volume 2, pages 84-90, 1960.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer SEED, the seed or index of the desired element.
%    SEED should be nonnegative.  Only the integer part of SEED is used.
%    SEED = 0 is allowed, and returns R = 0.
%
%    Input, integer BASE(1:ndim), the Halton bases, which are typically
%    prime numbers.  Only the integer part of BASE is used.
%    BASE must be greater than 1.
%
%    Output, real R(1:ndim), the SEED-th element of the Halton sequence.
%
  ndim = length ( base );

  r(1:ndim) = 0.0E+00;
%
%  Ensure that BASE is an integer, and acceptable.
%
  base = floor ( base );

  if ( any ( base <= 1 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_HALTON - Fatal error!\n' );
    fprintf ( 1, '  Some input base is <= 1!\n' );
    return
  end
%
%  Ensure that SEED is an integer, and acceptable.
%
  seed = floor ( seed );

  if ( seed < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4_TO_HALTON - Fatal error!\n' );
    fprintf ( 1, '  The input SEED is < 0!\n' );
    fprintf ( 1, '  SEED = %d\n', seed );
    return
  end
%
%  Carry out the computation.
%
  base_inv(1:ndim) = 1.0E+00 ./ base(1:ndim);
  seed2(1:ndim) = seed;

  while ( any ( seed2 ~= 0 ) )
    digit = mod ( seed2, base );
    r = r + digit .* base_inv;
    base_inv = base_inv ./ base;
    seed2 = floor ( seed2 ./ base );
  end

  return
end
function lcvt_write ( dim_num, n, seed_start, sample_function_init, ...
  file_in_name, sample_function_cvt, sample_num_cvt, cvt_it, ...
  cvt_energy, latin_it, latin_energy, cell_generator, file_out_name )

%*****************************************************************************80
%
%% LCVT_WRITE writes a Latinized CVT dataset to a file.
%
%  Discussion:
%
%    The initial lines of the file are comments, which begin with a
%    '#' character.
%
%    Thereafter, each line of the file contains the M-dimensional
%    components of a Latinized CVT generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer SEED_START, the initial random number seed.
%
%    Input, integer SAMPLE_FUNCTION_INIT, specifies how the initial
%    generators are chosen:
%    -1, the initialization function is RANDOM_NUMBER (Fortran90 intrinsic),
%    0, the initialization function is UNIFORM,
%    1, the initialization function is HALTON,
%    2, the initialization function is GRID,
%    3, the initial values are read in from a file.
%
%    Input, string FILE_IN_NAME, the name of the file
%    from which initialization values were read for the generators,
%    if SAMPLE_FUNCTION_INIT = 3.
%
%    Input, integer SAMPLE_FUNCTION_CVT, specifies how the region is sampled:
%    -1, the sampling function is RANDOM_NUMBER (Fortran90 intrinsic),
%    0, the sampling function is UNIFORM,
%    1, the sampling function is HALTON,
%    2, the sampling function is GRID.
%
%    Input, integer SAMPLE_NUM_CVT, the number of sampling points used on
%    each CVT iteration.
%
%    Input, integer CVT_IT, the number of CVT iterations.
%
%    Input, real CVT_ENERGY, the energy of the final CVT dataset.
%
%    Input, integer LATIN_IT, the number of Latin iterations.
%
%    Input, real LATIN_ENERGY, the energy of the Latinized
%    CVT dataset.
%
%    Input, real CELL_GENERATOR(DIM_NUM,N), the points.
%
%    Input, string FILE_OUT_NAME, the name of
%    the output file.
%
  comment = 1;

  file_out_unit = fopen ( file_out_name, 'w' );

  if ( file_out_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LCVT_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file:\n' );
    fprintf ( 1, '  "%s".\n', file_out_name );
    error ( 'LCVT_WRITE - Fatal error!' );
  end

  if ( comment )

    today = timestring ( );

    fprintf ( file_out_unit, '#  %s\n', file_out_name );
    fprintf ( file_out_unit, '#  created by LCVT_WRITE.M\n' );
    fprintf ( file_out_unit, '#  at %s\n', timestring );
    fprintf ( file_out_unit, '#\n' );
    fprintf ( file_out_unit, ...
      '#  Spatial dimension DIM_NUM =   %12d\n', dim_num  );
    fprintf ( file_out_unit, '#  Number of points N =       %12d\n', n );
    fprintf ( file_out_unit, '#  EPSILON (unit roundoff ) = %e\n', eps );

    if ( sample_function_init == 0 | ...
         sample_function_init == 1 | ...
         sample_function_cvt == 0 | ...
         sample_function_cvt == 1 )
      fprintf ( file_out_unit, '#\n' );
      fprintf ( file_out_unit, '#  Initial SEED = %d\n', seed_start );
    end

    fprintf ( file_out_unit, '#\n' );
    if ( sample_function_init == -1 )
      fprintf ( file_out_unit, ...
        '#  Initialization by RAND (MATLAB intrinsic).\n' );
    elseif ( sample_function_init == 0 )
      fprintf ( file_out_unit, '#  Initialization by UNIFORM.\n' );
    elseif ( sample_function_init == 1 )
      fprintf ( file_out_unit, '#  Initialization by HALTON.\n' );
    elseif ( sample_function_init == 2 )
      fprintf ( file_out_unit, '#  Initialization by GRID.\n' );
    elseif ( sample_function_init == 3 )
      fprintf ( file_out_unit, '#  Initialization from file: "%s"\n', ...
        file_in_name );
    end

    if ( sample_function_cvt == -1 )
      fprintf ( file_out_unit,'#  Sampling by RAND (MATLAB intrinsic).\n' );
    elseif ( sample_function_cvt == 0 )
      fprintf ( file_out_unit, '#  Sampling by UNIFORM.\n' );
    elseif ( sample_function_cvt == 1 )
      fprintf ( file_out_unit, '#  Sampling by HALTON.\n' );
    elseif ( sample_function_cvt == 2 )
      fprintf ( file_out_unit, '#  Sampling by GRID.\n' );
    end

    fprintf ( file_out_unit, '#  Number of sample points = %d\n', ...
      sample_num_cvt );
    fprintf ( file_out_unit, '#  Number of CVT iterations = %d\n', ...
      cvt_it );
    fprintf ( file_out_unit, '#  Energy of CVT dataset = %f\n', ...
      cvt_energy );
    fprintf ( file_out_unit, '#  Number of Latin iterations = %d\n', ...
      latin_it );
    fprintf ( file_out_unit, '#  Energy of Latinized CVT dataset = %f\n', ...
      latin_energy );
    fprintf ( file_out_unit, '#\n' );

  end 

  for j = 1 : n
    for i = 1 : dim_num
      fprintf ( file_out_unit, '  %10f', cell_generator(i,j) );
    end
    fprintf ( file_out_unit, '\n' );
  end

  fclose ( file_out_unit );

  return
end
function p = prime ( n )

%*****************************************************************************80
%
%% PRIME returns returns any of the first PRIME_MAX prime numbers.
%
%  Discussion:
%
%    PRIME_MAX is 1600, and the largest prime stored is 13499.
%
%    Thanks to Bart Vandewoestyne for pointing out a typo, 18 February 2005.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964, pages 870-873.
%
%    Daniel Zwillinger,
%    CRC Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996, pages 95-98.
%
%  Parameters:
%
%    Input, integer N, the index of the desired prime number.
%    In general, is should be true that 0 <= N <= PRIME_MAX.
%    N = -1 returns PRIME_MAX, the index of the largest prime available.
%    N = 0 is legal, returning PRIME = 1.
%
%    Output, integer P, the N-th prime.  If N is out of range, P
%    is returned as -1.
%
  prime_max = 1600;

  prime_vector(1:1600) = [
        2,    3,    5,    7,   11,   13,   17,   19,   23,   29, ...
       31,   37,   41,   43,   47,   53,   59,   61,   67,   71, ...
       73,   79,   83,   89,   97,  101,  103,  107,  109,  113, ...
      127,  131,  137,  139,  149,  151,  157,  163,  167,  173, ...
      179,  181,  191,  193,  197,  199,  211,  223,  227,  229, ...
      233,  239,  241,  251,  257,  263,  269,  271,  277,  281, ...
      283,  293,  307,  311,  313,  317,  331,  337,  347,  349, ...
      353,  359,  367,  373,  379,  383,  389,  397,  401,  409, ...
      419,  421,  431,  433,  439,  443,  449,  457,  461,  463, ...
      467,  479,  487,  491,  499,  503,  509,  521,  523,  541, ...
      547,  557,  563,  569,  571,  577,  587,  593,  599,  601, ...
      607,  613,  617,  619,  631,  641,  643,  647,  653,  659, ...
      661,  673,  677,  683,  691,  701,  709,  719,  727,  733, ...
      739,  743,  751,  757,  761,  769,  773,  787,  797,  809, ...
      811,  821,  823,  827,  829,  839,  853,  857,  859,  863, ...
      877,  881,  883,  887,  907,  911,  919,  929,  937,  941, ...
      947,  953,  967,  971,  977,  983,  991,  997, 1009, 1013, ...
     1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069, ...
     1087, 1091, 1093, 1097, 1103, 1109, 1117, 1123, 1129, 1151, ...
     1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 1217, 1223, ...
     1229, 1231, 1237, 1249, 1259, 1277, 1279, 1283, 1289, 1291, ...
     1297, 1301, 1303, 1307, 1319, 1321, 1327, 1361, 1367, 1373, ...
     1381, 1399, 1409, 1423, 1427, 1429, 1433, 1439, 1447, 1451, ...
     1453, 1459, 1471, 1481, 1483, 1487, 1489, 1493, 1499, 1511, ...
     1523, 1531, 1543, 1549, 1553, 1559, 1567, 1571, 1579, 1583, ...
     1597, 1601, 1607, 1609, 1613, 1619, 1621, 1627, 1637, 1657, ...
     1663, 1667, 1669, 1693, 1697, 1699, 1709, 1721, 1723, 1733, ...
     1741, 1747, 1753, 1759, 1777, 1783, 1787, 1789, 1801, 1811, ...
     1823, 1831, 1847, 1861, 1867, 1871, 1873, 1877, 1879, 1889, ...
     1901, 1907, 1913, 1931, 1933, 1949, 1951, 1973, 1979, 1987, ...
     1993, 1997, 1999, 2003, 2011, 2017, 2027, 2029, 2039, 2053, ...
     2063, 2069, 2081, 2083, 2087, 2089, 2099, 2111, 2113, 2129, ...
     2131, 2137, 2141, 2143, 2153, 2161, 2179, 2203, 2207, 2213, ...
     2221, 2237, 2239, 2243, 2251, 2267, 2269, 2273, 2281, 2287, ...
     2293, 2297, 2309, 2311, 2333, 2339, 2341, 2347, 2351, 2357, ...
     2371, 2377, 2381, 2383, 2389, 2393, 2399, 2411, 2417, 2423, ...
     2437, 2441, 2447, 2459, 2467, 2473, 2477, 2503, 2521, 2531, ...
     2539, 2543, 2549, 2551, 2557, 2579, 2591, 2593, 2609, 2617, ...
     2621, 2633, 2647, 2657, 2659, 2663, 2671, 2677, 2683, 2687, ...
     2689, 2693, 2699, 2707, 2711, 2713, 2719, 2729, 2731, 2741, ...
     2749, 2753, 2767, 2777, 2789, 2791, 2797, 2801, 2803, 2819, ...
     2833, 2837, 2843, 2851, 2857, 2861, 2879, 2887, 2897, 2903, ...
     2909, 2917, 2927, 2939, 2953, 2957, 2963, 2969, 2971, 2999, ...
     3001, 3011, 3019, 3023, 3037, 3041, 3049, 3061, 3067, 3079, ...
     3083, 3089, 3109, 3119, 3121, 3137, 3163, 3167, 3169, 3181, ...
     3187, 3191, 3203, 3209, 3217, 3221, 3229, 3251, 3253, 3257, ...
     3259, 3271, 3299, 3301, 3307, 3313, 3319, 3323, 3329, 3331, ...
     3343, 3347, 3359, 3361, 3371, 3373, 3389, 3391, 3407, 3413, ...
     3433, 3449, 3457, 3461, 3463, 3467, 3469, 3491, 3499, 3511, ...
     3517, 3527, 3529, 3533, 3539, 3541, 3547, 3557, 3559, 3571, ...
     3581, 3583, 3593, 3607, 3613, 3617, 3623, 3631, 3637, 3643, ...
     3659, 3671, 3673, 3677, 3691, 3697, 3701, 3709, 3719, 3727, ...
     3733, 3739, 3761, 3767, 3769, 3779, 3793, 3797, 3803, 3821, ...
     3823, 3833, 3847, 3851, 3853, 3863, 3877, 3881, 3889, 3907, ...
     3911, 3917, 3919, 3923, 3929, 3931, 3943, 3947, 3967, 3989, ...
     4001, 4003, 4007, 4013, 4019, 4021, 4027, 4049, 4051, 4057, ...
     4073, 4079, 4091, 4093, 4099, 4111, 4127, 4129, 4133, 4139, ...
     4153, 4157, 4159, 4177, 4201, 4211, 4217, 4219, 4229, 4231, ...
     4241, 4243, 4253, 4259, 4261, 4271, 4273, 4283, 4289, 4297, ...
     4327, 4337, 4339, 4349, 4357, 4363, 4373, 4391, 4397, 4409, ...
     4421, 4423, 4441, 4447, 4451, 4457, 4463, 4481, 4483, 4493, ...
     4507, 4513, 4517, 4519, 4523, 4547, 4549, 4561, 4567, 4583, ...
     4591, 4597, 4603, 4621, 4637, 4639, 4643, 4649, 4651, 4657, ...
     4663, 4673, 4679, 4691, 4703, 4721, 4723, 4729, 4733, 4751, ...
     4759, 4783, 4787, 4789, 4793, 4799, 4801, 4813, 4817, 4831, ...
     4861, 4871, 4877, 4889, 4903, 4909, 4919, 4931, 4933, 4937, ...
     4943, 4951, 4957, 4967, 4969, 4973, 4987, 4993, 4999, 5003, ...
     5009, 5011, 5021, 5023, 5039, 5051, 5059, 5077, 5081, 5087, ...
     5099, 5101, 5107, 5113, 5119, 5147, 5153, 5167, 5171, 5179, ...
     5189, 5197, 5209, 5227, 5231, 5233, 5237, 5261, 5273, 5279, ...
     5281, 5297, 5303, 5309, 5323, 5333, 5347, 5351, 5381, 5387, ...
     5393, 5399, 5407, 5413, 5417, 5419, 5431, 5437, 5441, 5443, ...
     5449, 5471, 5477, 5479, 5483, 5501, 5503, 5507, 5519, 5521, ...
     5527, 5531, 5557, 5563, 5569, 5573, 5581, 5591, 5623, 5639, ...
     5641, 5647, 5651, 5653, 5657, 5659, 5669, 5683, 5689, 5693, ...
     5701, 5711, 5717, 5737, 5741, 5743, 5749, 5779, 5783, 5791, ...
     5801, 5807, 5813, 5821, 5827, 5839, 5843, 5849, 5851, 5857, ...
     5861, 5867, 5869, 5879, 5881, 5897, 5903, 5923, 5927, 5939, ...
     5953, 5981, 5987, 6007, 6011, 6029, 6037, 6043, 6047, 6053, ...
     6067, 6073, 6079, 6089, 6091, 6101, 6113, 6121, 6131, 6133, ...
     6143, 6151, 6163, 6173, 6197, 6199, 6203, 6211, 6217, 6221, ...
     6229, 6247, 6257, 6263, 6269, 6271, 6277, 6287, 6299, 6301, ...
     6311, 6317, 6323, 6329, 6337, 6343, 6353, 6359, 6361, 6367, ...
     6373, 6379, 6389, 6397, 6421, 6427, 6449, 6451, 6469, 6473, ...
     6481, 6491, 6521, 6529, 6547, 6551, 6553, 6563, 6569, 6571, ...
     6577, 6581, 6599, 6607, 6619, 6637, 6653, 6659, 6661, 6673, ...
     6679, 6689, 6691, 6701, 6703, 6709, 6719, 6733, 6737, 6761, ...
     6763, 6779, 6781, 6791, 6793, 6803, 6823, 6827, 6829, 6833, ...
     6841, 6857, 6863, 6869, 6871, 6883, 6899, 6907, 6911, 6917, ...
     6947, 6949, 6959, 6961, 6967, 6971, 6977, 6983, 6991, 6997, ...
     7001, 7013, 7019, 7027, 7039, 7043, 7057, 7069, 7079, 7103, ...
     7109, 7121, 7127, 7129, 7151, 7159, 7177, 7187, 7193, 7207, ...
     7211, 7213, 7219, 7229, 7237, 7243, 7247, 7253, 7283, 7297, ...
     7307, 7309, 7321, 7331, 7333, 7349, 7351, 7369, 7393, 7411, ...
     7417, 7433, 7451, 7457, 7459, 7477, 7481, 7487, 7489, 7499, ...
     7507, 7517, 7523, 7529, 7537, 7541, 7547, 7549, 7559, 7561, ...
     7573, 7577, 7583, 7589, 7591, 7603, 7607, 7621, 7639, 7643, ...
     7649, 7669, 7673, 7681, 7687, 7691, 7699, 7703, 7717, 7723, ...
     7727, 7741, 7753, 7757, 7759, 7789, 7793, 7817, 7823, 7829, ...
     7841, 7853, 7867, 7873, 7877, 7879, 7883, 7901, 7907, 7919, ...
     7927, 7933, 7937, 7949, 7951, 7963, 7993, 8009, 8011, 8017, ...
     8039, 8053, 8059, 8069, 8081, 8087, 8089, 8093, 8101, 8111, ...
     8117, 8123, 8147, 8161, 8167, 8171, 8179, 8191, 8209, 8219, ...
     8221, 8231, 8233, 8237, 8243, 8263, 8269, 8273, 8287, 8291, ...
     8293, 8297, 8311, 8317, 8329, 8353, 8363, 8369, 8377, 8387, ...
     8389, 8419, 8423, 8429, 8431, 8443, 8447, 8461, 8467, 8501, ...
     8513, 8521, 8527, 8537, 8539, 8543, 8563, 8573, 8581, 8597, ...
     8599, 8609, 8623, 8627, 8629, 8641, 8647, 8663, 8669, 8677, ...
     8681, 8689, 8693, 8699, 8707, 8713, 8719, 8731, 8737, 8741, ...
     8747, 8753, 8761, 8779, 8783, 8803, 8807, 8819, 8821, 8831, ...
     8837, 8839, 8849, 8861, 8863, 8867, 8887, 8893, 8923, 8929, ...
     8933, 8941, 8951, 8963, 8969, 8971, 8999, 9001, 9007, 9011, ...
     9013, 9029, 9041, 9043, 9049, 9059, 9067, 9091, 9103, 9109, ...
     9127, 9133, 9137, 9151, 9157, 9161, 9173, 9181, 9187, 9199, ...
     9203, 9209, 9221, 9227, 9239, 9241, 9257, 9277, 9281, 9283, ...
     9293, 9311, 9319, 9323, 9337, 9341, 9343, 9349, 9371, 9377, ...
     9391, 9397, 9403, 9413, 9419, 9421, 9431, 9433, 9437, 9439, ...
     9461, 9463, 9467, 9473, 9479, 9491, 9497, 9511, 9521, 9533, ...
     9539, 9547, 9551, 9587, 9601, 9613, 9619, 9623, 9629, 9631, ...
     9643, 9649, 9661, 9677, 9679, 9689, 9697, 9719, 9721, 9733, ...
     9739, 9743, 9749, 9767, 9769, 9781, 9787, 9791, 9803, 9811, ...
     9817, 9829, 9833, 9839, 9851, 9857, 9859, 9871, 9883, 9887, ...
     9901, 9907, 9923, 9929, 9931, 9941, 9949, 9967, 9973,10007, ...
    10009,10037,10039,10061,10067,10069,10079,10091,10093,10099, ...
    10103,10111,10133,10139,10141,10151,10159,10163,10169,10177, ...
    10181,10193,10211,10223,10243,10247,10253,10259,10267,10271, ...
    10273,10289,10301,10303,10313,10321,10331,10333,10337,10343, ...
    10357,10369,10391,10399,10427,10429,10433,10453,10457,10459, ...
    10463,10477,10487,10499,10501,10513,10529,10531,10559,10567, ...
    10589,10597,10601,10607,10613,10627,10631,10639,10651,10657, ...
    10663,10667,10687,10691,10709,10711,10723,10729,10733,10739, ...
    10753,10771,10781,10789,10799,10831,10837,10847,10853,10859, ...
    10861,10867,10883,10889,10891,10903,10909,10937,10939,10949, ...
    10957,10973,10979,10987,10993,11003,11027,11047,11057,11059, ...
    11069,11071,11083,11087,11093,11113,11117,11119,11131,11149, ...
    11159,11161,11171,11173,11177,11197,11213,11239,11243,11251, ...
    11257,11261,11273,11279,11287,11299,11311,11317,11321,11329, ...
    11351,11353,11369,11383,11393,11399,11411,11423,11437,11443, ...
    11447,11467,11471,11483,11489,11491,11497,11503,11519,11527, ...
    11549,11551,11579,11587,11593,11597,11617,11621,11633,11657, ...
    11677,11681,11689,11699,11701,11717,11719,11731,11743,11777, ...
    11779,11783,11789,11801,11807,11813,11821,11827,11831,11833, ...
    11839,11863,11867,11887,11897,11903,11909,11923,11927,11933, ...
    11939,11941,11953,11959,11969,11971,11981,11987,12007,12011, ...
    12037,12041,12043,12049,12071,12073,12097,12101,12107,12109, ...
    12113,12119,12143,12149,12157,12161,12163,12197,12203,12211, ...
    12227,12239,12241,12251,12253,12263,12269,12277,12281,12289, ...
    12301,12323,12329,12343,12347,12373,12377,12379,12391,12401, ...
    12409,12413,12421,12433,12437,12451,12457,12473,12479,12487, ...
    12491,12497,12503,12511,12517,12527,12539,12541,12547,12553, ...
    12569,12577,12583,12589,12601,12611,12613,12619,12637,12641, ...
    12647,12653,12659,12671,12689,12697,12703,12713,12721,12739, ...
    12743,12757,12763,12781,12791,12799,12809,12821,12823,12829, ...
    12841,12853,12889,12893,12899,12907,12911,12917,12919,12923, ...
    12941,12953,12959,12967,12973,12979,12983,13001,13003,13007, ...
    13009,13033,13037,13043,13049,13063,13093,13099,13103,13109, ...
    13121,13127,13147,13151,13159,13163,13171,13177,13183,13187, ...
    13217,13219,13229,13241,13249,13259,13267,13291,13297,13309, ...
    13313,13327,13331,13337,13339,13367,13381,13397,13399,13411, ...
    13417,13421,13441,13451,13457,13463,13469,13477,13487,13499 ];

  if ( n == -1 )
    p = prime_max;
  elseif ( n == 0 )
    p = 1;
  elseif ( n <= prime_max )
    p = prime_vector(n);
  else
    p = -1;
  end

  return
end
function [ r, seed ] = r8_uniform_01 ( seed )

%*****************************************************************************80
%
%% R8_UNIFORM_01 returns a unit pseudorandom R8.
%
%  Discussion:
%
%    This routine implements the recursion
%
%      seed = 16807 * seed mod ( 2**31 - 1 )
%      r8_uniform_01 = seed / ( 2**31 - 1 )
%
%    The integer arithmetic never requires more than 32 bits,
%    including a sign bit.
%
%    If the initial seed is 12345, then the first three computations are
%
%      Input     Output      R8_UNIFORM_01
%      SEED      SEED
%
%         12345   207482415  0.096616
%     207482415  1790989824  0.833995
%    1790989824  2035175616  0.947702
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
%
%  Parameters:
%
%    Input, integer SEED, the integer "seed" used to generate
%    the output random number.  SEED should not be 0.
%
%    Output, real R, a random value between 0 and 1.
%
%    Output, integer SEED, the updated seed.  This would
%    normally be used as the input seed on the next call.
%
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8_UNIFORM_01 - Fatal error!' );
  end

  seed = floor ( seed );

  seed = mod ( seed, i4_huge );

  if ( seed < 0 ) 
    seed = seed + i4_huge;
  end 

  k = floor ( seed / 127773 );

  seed = 16807 * ( seed - k * 127773 ) - k * 2836;

  if ( seed < 0 )
    seed = seed + i4_huge;
  end

  r = seed * 4.656612875E-10;

  return
end
function table = r8mat_data_read ( input_filename, m, n )

%*****************************************************************************80
%
%% R8MAT_DATA_READ reads data from an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the input file.
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Output, real TABLE(M,N), the point coordinates.
%

%
%  Build up the format string for reading M real numbers.
%
  string = ' ';

  for i = 0 : m
    string = strcat ( string, ' %f' );
  end

  input_unit = fopen ( input_filename );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file.\n' );
    error ( 'R8MAT_DATA_READ - Error!' );
  end

  table = zeros(m,n);

  i = 0;

  while ( i < n )

    line = fgets ( input_unit );

    if ( line == -1 )
      break;
    end

    if ( line(1) == '#' )

    elseif ( s_len_trim ( line ) == 0 )
      
    else

      [ x, count ] = sscanf ( line, string );

      if ( count == m )
        i = i + 1;
        table(1:m,i) = x(1:m);
      end

    end

  end

  fclose ( input_unit );

  return
end
function table = r8mat_latinize ( m, n, table )

%*****************************************************************************80
%
%% R8MAT_LATINIZE "Latinizes" an R8MAT.
%
%  Discussion:
%
%    It is assumed, though not necessary, that the input dataset
%    has points that lie in the unit hypercube.
%
%    In any case, the output dataset will have this property.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of cells.
%
%    Input, real TABLE(M,N), the dataset to be "Latinized".
%
%    Output, real TABLE(M,N), the Latinized dataset.
%
  for i = 1 : m
    indx = r8vec_sort_heap_index_a ( n, table(i,1:n) );
    for j = 1 : n
      table(i,indx(j)) = ( 2 * j - 1 ) / ( 2 * n );
    end
  end

  return
end
function indx = r8vec_sort_heap_index_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_HEAP_INDEX_A does an indexed heap ascending sort of an R8VEC.
%
%  Discussion:
%
%    The sorting is not actually carried out.  Rather an index array is
%    created which defines the sorting.  This array may be used to sort
%    or index the array, or to sort or index related arrays keyed on the
%    original array.
%
%    Once the index array is computed, the sorting can be carried out
%    "implicitly:
%
%      A(INDX(I)), I = 1 to N is sorted,
%
%    or explicitly, by the call
%
%      call R8VEC_PERMUTE ( N, A, INDX )
%
%    after which A(I), I = 1 to N is sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), an array to be index-sorted.
%
%    Output, integer INDX(N), the sort index.  The
%    I-th element of the sorted array is A(INDX(I)).
%
  if ( n < 1 )
    indx = [];
    return;
  end

  indx(1:n) = 1:n;

  if ( n == 1 )
    return;
  end

  l = floor ( n / 2 ) + 1;
  ir = n;

  while ( 1 )

    if ( 1 < l )

      l = l - 1;
      indxt = indx(l);
      aval = a(indxt);

    else

      indxt = indx(ir);
      aval = a(indxt);
      indx(ir) = indx(1);
      ir = ir - 1;

      if ( ir == 1 )
        indx(1) = indxt;
        break;
      end

    end

    i = l;
    j = l + l;

    while ( j <= ir )

      if ( j < ir )
        if ( a(indx(j)) < a(indx(j+1)) )
          j = j + 1;
        end
      end

      if ( aval < a(indx(j)) )
        indx(i) = indx(j);
        i = j;
        j = j + j;
      else
        j = ir + 1;
      end

    end

    indx(i) = indxt;

  end

  return
end
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
function value = s_eqi ( s1, s2 )

%*****************************************************************************80
%
%% S_EQI is a case insensitive comparison of two strings for equality.
%
%  Example:
%
%    S_EQI ( 'Anjana', 'ANJANA' ) is TRUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S1, S2, the strings to compare.
%
%    Output, logical VALUE, is TRUE if the strings are equal.
%
  FALSE = 0;
  TRUE = 1;

  len1 = length ( s1 );
  len2 = length ( s2 );
  lenc = min ( len1, len2 );

  value = FALSE;

  for i = 1 : lenc

    c1 = ch_cap ( s1(i) );
    c2 = ch_cap ( s2(i) );

    if ( c1 ~= c2 )
      value = FALSE;
      return
    end

  end

  for i = lenc + 1 : len1
    if ( s1(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  for i = lenc + 1 : len2
    if ( s2(i) ~= ' ' )
      value = FALSE;
      return
    end
  end

  value = TRUE;

  return
end
function len = s_len_trim ( s )

%*****************************************************************************80
%
%% S_LEN_TRIM returns the length of a character string to the last nonblank.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string S, the string to be measured.
%
%    Output, integer LEN, the length of the string up to the last nonblank.
%
  len = length ( s );

  while ( 0 < len )
    if ( s(len) ~= ' ' )
      return
    end
    len = len - 1;
  end

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
function s = timestring ( )

%*****************************************************************************80
%
%% TIMESTRING returns a string containing the current YMDHMS date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, string S, a string containing the current YMDHMS date.
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );

  return
end


  
function x = tuple_next_fast ( m, n, rank )

%*****************************************************************************80
%
%% TUPLE_NEXT_FAST computes the next element of a tuple space, "fast".
%
%  Discussion:
%
%    The elements are N vectors.  Each entry is constrained to lie
%    between 1 and M.  The elements are produced one at a time.
%    The first element is
%      (1,1,...,1)
%    and the last element is
%      (M,M,...,M)
%    Intermediate elements are produced in lexicographic order.
%
%    This code was written as a possibly faster version of TUPLE_NEXT.
%
%  Example:
%
%    N = 2,
%    M = 3
%
%    INPUT        OUTPUT
%    -------      -------
%    Rank          X
%    ----          ----
%   -1            -1 -1
%
%    0             1  1
%    1             1  2
%    2             1  3
%    3             2  1
%    4             2  2
%    5             2  3
%    6             3  1
%    7             3  2
%    8             3  3
%    9             1  1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the maximum entry in each component.
%    M must be greater than 0.
%
%    Input, integer N, the number of components.
%    N must be greater than 0.
%
%    Input, integer RANK, indicates the rank of the tuples.
%    Typically, 0 <= RANK < N**M; values greater than this are
%    legal and meaningful, being equivalent to the corresponding
%    value mod N**M.  RANK < 0 indicates that this is the first
%    call for the given values of (M,N).  Initialization is done,
%    and X is set to a dummy value.
%
%    Output, integer X(N), the next tuple of the given rank,
%    or a dummy value if initialization is being done.
%
  global tuple_next_fast_BASE

  if ( rank < 0 )

    if ( m <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TUPLE_NEXT_FAST - Fatal error!\n' );
      fprintf ( 1, '  M <= 0 is illegal.\n' );
      fprintf ( 1, '  M = %d\n', m );
      error ( 'TUPLE_NEXT_FAST - Fatal error!' );
    end

    if ( n <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TUPLE_NEXT_FAST - Fatal error!\n' );
      fprintf ( 1, '  N <= 0 is illegal.\n' );
      fprintf ( 1, '  N = %d\n', n );
      error ( 'TUPLE_NEXT_FAST - Fatal error!' );
    end

    tuple_next_fast_BASE(n) = 1;
    for i = n-1 : -1 : 1
      tuple_next_fast_BASE(i) = tuple_next_fast_BASE(i+1) * m;
    end

    x(1:n) = -1;

  else

    x(1:n) = mod ( floor ( rank ./ tuple_next_fast_BASE(1:n) ), m ) + 1;

  end

  return
end
