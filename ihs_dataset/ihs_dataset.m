function ihs_dataset ( )

%% IHS_DATASET generates an IHS dataset and writes it to a file.
%
%  Discussion:
%
%    This program is meant to be used interactively.  It's also
%    possible to prepare a simple input file beforehand and use it
%    in batch mode.
%
%    The program requests input values from the user:
%
%    * M, the spatial dimension,
%    * N, the number of points to generate,
%    * D, the duplication factor,
%    * SEED, a seed for the random number generator.
%
%    The program generates the data, writes it to the file
%
%      ihs_M_N.txt
%
%    where "M" and "N" are the numeric values specified by the user,
%    and then asks the user for more input.   To indicate that no further
%    computations are desired, it is enough to input a nonsensical
%    value, such as -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2005
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'IHS_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Generate an IHS dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program is meant to be used interactively.\n' );
  fprintf ( 1, '  It is also possible to prepare a simple input \n' );
  fprintf ( 1, '  file beforehand and use it in batch mode.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program requests input values from the user:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * M, the spatial dimension,\n' );
  fprintf ( 1, '  * N, the number of points to generate,\n' );
  fprintf ( 1, '  * D, the duplication factor,\n' );
  fprintf ( 1, '  * SEED, a seed for the random number generator.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program generates the data, writes it to the file\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ihs_M_N.txt\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where "M" and "N" are the numeric values specified\n' );
  fprintf ( 1, '  by the user, and then asks the user for more input.\n' );
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
    fprintf ( 1, '  M is the spatial dimension.\n' );
    fprintf ( 1, '  (Try ''2'' if you have no preference.)\n' );
    fprintf ( 1, '  Any value less than 1 terminates execution.\n' );
    m = input ( '  Enter M:  ' );

    fprintf ( 1, '  User input M = %d\n', m );

    if ( m < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'IHS_DATASET\n' );
      fprintf ( 1, '  The input value of M = %d\n', m );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  N is the number of points.\n' );
    fprintf ( 1, '  (Try ''10'' if you have no preference.)\n' );
    fprintf ( 1, '  Any value less than 1 terminates execution.\n' );
    n = input ( '  Enter N:  ' );

    fprintf ( 1, '  User input N = %d\n', n );

    if ( n < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'IHS_DATASET\n' );
      fprintf ( 1, '  The input value of N = %d\n', n );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end


    fprintf ( 1, '\n' );
    fprintf ( 1, '  D is the duplication factor.\n' );
    fprintf ( 1, '  This must be at least 1, but not too large.\n' );
    fprintf ( 1, '  (Try ''5'' if you have no preference.)\n' );
    fprintf ( 1, '  Any value less than 1 terminates execution.\n' );
    d = input ( '  Enter D:  ' );

    fprintf ( 1, '  User input D = %d\n', d );

    if ( n < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'IHS_DATASET\n' );
      fprintf ( 1, '  The input value of D = %d\n', d );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  SEED is a seed for the random number generator.\n' );
    fprintf ( 1, '  (Try 123456789 if you have no preference.)\n' );
    fprintf ( 1, '  (A value of 0 means the program picks a seed.)\n' );
    fprintf ( 1, '  (A negative value terminates execution.)\n' );
    seed = input ( '  Enter SEED:  ' );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  SEED = %d\n', seed );

    if ( seed < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'UNIFORM_DATASET\n' );
      fprintf ( 1, '  The nonpositive input value of SEED is interpreted\n' );
      fprintf ( 1, '  as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
    end

    if ( seed == 0 )
      seed = get_seed ( );
      fprintf ( 1, '\n' );
      fprintf ( 1, '  The randomly chosen SEED = %d\n', seed );
    end

    seed_init = seed;

    [ r, seed ] = ihs ( m, n, d, seed );

    file_out_name = ...
      strcat ( 'ihs_', num2str ( m ), '_', num2str ( n ), '.txt' );

    ihs_write ( m, n, d, seed_init, seed, r, file_out_name );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The data was written to the file "%s".\n', ...
      file_out_name );

  end

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
