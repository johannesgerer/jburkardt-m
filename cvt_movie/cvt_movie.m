function cvt_movie ( )

%*****************************************************************************80
%
%% CVT_MOVIE generates and animates a CVT dataset.
%
%  Discussion:
%
%    This program is meant to be used interactively.  It's also
%    possible to prepare a simple input file beforehand and use it
%    in batch mode.
%
%    The program requests input values from the user:
%
%    * NDIM, the spatial dimension,
%    * N, the number of points to generate,
%    * SEED, a seed to use for random number generation;
%    * INIT, initialize the points:
%      ** file, by reading data from file;
%      ** 'GRID', picking points from a grid;
%      ** 'HALTON', from a Halton sequence;
%      ** 'RAND', using MATLAB's RAND function;
%      ** 'UNIFORM', using a simple uniform RNG;
%    * IT_MAX, the maximum number of iterations;
%    * IT_FIXED, the number of iterative steps to take
%      using a fixed set of sampling points.
%    * SAMPLE, how to conduct the sampling:
%      ** 'GRID', picking points from a grid;
%      ** 'HALTON', from a Halton sequence;
%      ** 'RAND', using MATLAB's RAND function;
%      ** 'UNIFORM', using a simple uniform RNG;
%    * SAMPLE_NUM, the number of sampling points;
%    * BATCH, the number of sampling points to create at one time;
%    * MOVIE_NAME is the name of the file in which the movie is stored;\n' );
%    * OUTPUT, a file into which the data can be stored.
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
%    08 December 2004
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
  DEBUG = 1;

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CVT_MOVIE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Generate and animate a CVT dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program is meant to be used interactively.\n' );
  fprintf ( 1, '  It is also possible to prepare a simple input \n' );
  fprintf ( 1, '  file beforehand and use it in batch mode.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program requests input values from the user:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * NDIM, the spatial dimension,\n' );
  fprintf ( 1, '  * N, the number of points to generate,\n' );
  fprintf ( 1, '  * SEED, a seed to use for random number generation,\n' );
  fprintf ( 1, '  * INIT, initialize the points:\n' );
  fprintf ( 1, '    ** file, read data from a file;\n' );
  fprintf ( 1, '    ** ''GRID'', by picking points from a grid;\n' );
  fprintf ( 1, '    ** ''HALTON'', from a Halton sequence;\n' );
  fprintf ( 1, '    ** ''RAND'', using MATLAB''s RAND function;\n' );
  fprintf ( 1, '    ** ''UNIFORM'', using a simple uniform RNG;\n' );
  fprintf ( 1, '  * IT_MAX, the maximum number of iterations.\n' );
  fprintf ( 1, '  * IT_FIXED, the number of iterative steps to take\n' );
  fprintf ( 1, '    using a fixed set of sampling points.\n' );
  fprintf ( 1, '  * SAMPLE, how to conduct the sampling.\n' );
  fprintf ( 1, '    ** ''GRID'', by picking points from a grid;\n' );
  fprintf ( 1, '    ** ''HALTON'', from a Halton sequence;\n' );
  fprintf ( 1, '    ** ''RAND'', using MATLAB''s RAND function;\n' );
  fprintf ( 1, '    ** ''UNIFORM'', using a simple uniform RNG;\n' );
  fprintf ( 1, '  * SAMPLE_NUM, the number of sample points;\n' );
  fprintf ( 1, '  * BATCH, the number of sampling points to create at one time;\n' );
  fprintf ( 1, '  * OUTPUT, a file into which the data is stored.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To indicate that no further computations are \n' );
  fprintf ( 1, '  desired, it is enough to input a nonsensical value, \n' );
  fprintf ( 1, '  such as -1.\n' );

  while ( 1 )

    fprintf ( 1, '  *\n' );
    fprintf ( 1, ' *\n' );
    fprintf ( 1, '*  Ready to generate a new dataset:\n' );
    fprintf ( 1, ' *\n' );
    fprintf ( 1, '  *\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  NDIM is the spatial dimension.\n' );
    fprintf ( 1, '  (Try ''2'' if you have no preference.)\n' );
    fprintf ( 1, '  (Any value less than 1 terminates execution.)\n' );
    ndim = [];
    ndim = input ( '  Enter NDIM:  ' );

    fprintf ( 1, '  Default NDIM = %12d\n', ndim );

    if ( ndim < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of NDIM = %12d\n', ndim );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
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
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of N = %12d\n', n );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

%   fprintf ( 1, '\n' );
%   fprintf ( 1, '  SEED is a seed for the random number generation.\n' );
%   fprintf ( 1, '  (Try ''123456789'' if you have no preference.)\n' );
%   fprintf ( 1, '  (Any value less than 0 terminates execution.)\n' );
%   seed = [];
%   seed = input ( '  Enter SEED:  ' );
    seed = 123456789;
    fprintf ( 1, '  Default SEED = %d\n', seed );

    if ( seed < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of SEED = %12d\n', seed );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  INIT is the method of initializing the data:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  file       read data from a file;\n' );
    fprintf ( 1, '  ''GRID''     by picking points from a grid;\n' );
    fprintf ( 1, '  ''HALTON''   from a Halton sequence;\n' );
    fprintf ( 1, '  ''RAND''     using MATLAB''s RAND function;\n' );
    fprintf ( 1, '  ''UNIFORM''  using a simple uniform RNG;\n' );
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
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of INIT \n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

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
    elseif ( 0 < s_len_trim ( init_string ) )
      init = 3;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of INIT \n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  IT_MAX is the maximum number of iterations.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  An iteration carries out the following steps:\n' );
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
    it_max = [];
    it_max = input ( '  Enter IT_MAX:  ' );

    fprintf ( 1, '  User input IT_MAX = %12d\n', it_max );

    if ( it_max < 0 )
      fprintf ( 1, ' \n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of IT_MAX = %12d\n', it_max );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  IT_FIXED is the number of consecutive iterations\n' );
    fprintf ( 1, '  to take with a fixed set of sample points.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Setting IT_FIXED to 1 means a new set of sample\n' );
    fprintf ( 1, '  points is generated on every iterative step;\n' );
    fprintf ( 1, '  Setting IT_FIXED equal to IT_MAX means a single set\n' );
    fprintf ( 1, '  of sample points is used for the entire iteration.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Any value between 1 and IT_MAX is reasonable.\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  (Try "%d" if you do not have a preference).\n', it_max );
    fprintf ( 1, '  (A 0 or negative value terminates execution).\n' );
    fprintf ( 1, '\n' );
    it_fixed = [];
    it_fixed = input ( '  Enter IT_FIXED:  ' );

    fprintf ( 1, '  User input IT_FIXED = %12d\n', it_fixed );

    if ( it_max < 0 )
      fprintf ( 1, ' \n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of IT_FIXED = %12d\n', it_fixed );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  SAMPLE is the method of sampling the region:\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  ''GRID''     by picking points from a grid;\n' );
    fprintf ( 1, '  ''HALTON''   from a Halton sequence;\n' );
    fprintf ( 1, '  ''RAND''     using MATLAB''s RAND function;\n' );
    fprintf ( 1, '  ''UNIFORM''  using a simple uniform RNG;\n' );
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
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of SAMPLE \n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
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
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of SAMPLE \n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
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
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of SAMPLE_NUM = %12d\n', sample_num );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

%   fprintf ( 1, '\n' );
%   fprintf ( 1, '  BATCH is the number of sample points to create\n' );
%   fprintf ( 1, '  at one time\n' );
%   fprintf ( 1, '\n' );
%   fprintf ( 1, '  BATCH should be between 1 and SAMPLE_NUM.\n' );
%   fprintf ( 1, '\n' );
%   fprintf ( 1, '  It is FASTER to set BATCH to SAMPLE_NUM;\n' );
%   fprintf ( 1, '  setting BATCH to 1 requires the least memory.\n' );
%   fprintf ( 1, '\n' );
%   fprintf ( 1, '  (Try ''%d'' if you have no preference.)\n', ...
%     min ( 1000, sample_num ) );
%   fprintf ( 1, '  (A zero or negative value terminates execution.)\n' );
%   fprintf ( 1, '\n' );

%   batch = [];
%   batch = input ( '  Enter BATCH:  ' );
    batch = 1000;

    fprintf ( 1, '  Default BATCH = %12d\n', batch );

    if ( batch <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of BATCH = %12d\n', batch );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  MOVIE_NAME is the name of the file in which the movie is stored;\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  (Try ''movie.avi'' if you have no preference.)\n' );
    fprintf ( 1, '  (A blank value terminates execution).\n' );
    fprintf ( 1, '  (Be sure to INCLUDE QUOTES around the string!\n' );
    fprintf ( 1, ' \n' );

    movie_name = [];
    movie_name = input ( '  Enter MOVIE_NAME:  ' );

    fprintf ( 1, '  User input MOVIE_NAME = %s\n', movie_name );

%   fprintf ( 1, '\n' );
%   fprintf ( 1, '  OUTPUT is a file into which the data is stored;\n' );
%   fprintf ( 1, '\n' );
%   fprintf ( 1, '  (Try ''cvt.txt'' if you have no preference.)\n' );
%   fprintf ( 1, '  (A blank value terminates execution).\n' );
%   fprintf ( 1, '  (Be sure to INCLUDE QUOTES around the string!\n' );
%   fprintf ( 1, ' \n' );

%   file_out_name = [];
%   file_out_name = input ( '  Enter OUTPUT:  ' );

    file_out_name = 'cvt.txt';

    fprintf ( 1, '  Default OUTPUT = "%s".\n', file_out_name );

    if ( s_len_trim ( file_out_name ) <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of OUTPUT \n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    if ( s_len_trim ( file_out_name ) <= 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CVT_MOVIE\n' );
      fprintf ( 1, '  The input value of OUTPUT \n' );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end
%
%  Initialize the data.
%
    if ( init == 3 )
      r = data_read ( sample_string, ndim, n );
    else
      r = [];
    end

    seed_init = seed;
%
%  Initialize the data unless the user has already done that.
%
    if ( init ~= 3 )

      initialize = 1;

      [ r, seed ] = cvt_sample ( ndim, n, n, init, initialize, seed );

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

    if ( file_exist ( movie_name ) )
      file_delete ( movie_name )
    end

    if ( DEBUG )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Step    SEED          L2-Change     Energy\n' );
      fprintf ( 1, '\n' );
    end

    num_frames_per_second = 10;
    aviobj = avifile ( movie_name, 'fps', num_frames_per_second ); 
    box = [ 0.0, 0.0; 1.0, 0.0; 1.0, 1.0; 0.0, 1.0 ]';

    it_num = 0;
    it_diff = 0.0;
    seed_base = seed_init;
    seed = seed_init;

    while ( it_num < it_max )
%
%  Once every IT_FIXED steps, update the base value of SEED,
%  either to SEED_INIT before the first call to CVT_ITERATE, or to the 
%  output value of SEED from the previous call to CVT_ITERATE.
%
%  Otherwise, reset the value of SEED to SEED_BASE.
%
      if ( mod ( it_num, it_fixed ) == 0 )
        seed_base = seed;
      else
        seed = seed_base;
      end

      it_num = it_num + 1;

      seed_init2 = seed;

      [ r, seed, it_diff, energy ] = cvt_iterate ( ndim, n, batch, sample, ...
        initialize, sample_num, seed, r );

      scatter ( r(1,1:n), r(2,1:n), [], 'r', 'filled' );
      line ( [ 0.0, 1.0, 1.0, 0.0, 0.0 ], [ 0.0, 0.0, 1.0, 1.0, 0.0 ] );
      axis ( [ -0.05, 1.05, -0.05, 1.05 ] );
      axis equal
%
%  Label the axes and the plot.
%
    xlabel ( 'X', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16 );

    ylabel ( 'Y', 'FontName', 'Helvetica', 'FontWeight', 'bold', ...
      'FontSize', 16, 'Rotation', 0 );

    it_string = sprintf ( 'Step %4d', it_num );

    title ( it_string, 'FontName', 'Helvetica', 'FontWeight', ...
      'bold', 'FontSize', 16 );

      frame = getframe ( gca );
      aviobj = addframe ( aviobj, frame );

      initialize = 0;

      if ( DEBUG )
        fprintf ( 1, '  %4d  %12d  %14e  %14e\n', ...
          it_num, seed_init2, it_diff, energy );
      end

    end 

    aviobj = close ( aviobj );
%
%  Write the final data to a file.
%
    cvt_write ( ndim, n, batch, seed_init, seed, init_string, it_max, ...
      it_fixed, it_num, it_diff, energy, sample_string, sample_num, ...
      r, file_out_name );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The data was written to the file "%s".\n', ...
      file_out_name );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Press RETURN to proceed.\n' );
    
    pause
    
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Final value of SEED = %d\n', seed );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
