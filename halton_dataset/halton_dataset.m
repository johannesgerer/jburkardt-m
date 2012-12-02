function halton_dataset ( )

%*****************************************************************************80
%
%% HALTON_DATASET generates a Halton dataset and writes it to a file.
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
%    * STEP, the index of the first subsequence element to be computed.
%    * SEED(1:NDIM), the Halton sequence index corresponding
%      to STEP = 0.
%    * LEAP(1:NDIM), the successive jumps in the Halton sequence.
%    * BASE(1:NDIM), the Halton bases (usually distinct primes).
%
%    The program generates the data, writes it to the file
%
%      halton_NDIM_N.txt
%
%    where "NDIM" and "N" are the numeric values specified by the user,
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
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HALTON_DATASET\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Generate a Halton dataset.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This program is meant to be used interactively.\n' );
  fprintf ( 1, '  It is also possible to prepare a simple input \n' );
  fprintf ( 1, '  file beforehand and use it in batch mode.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program requests input values from the user:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * NDIM, the spatial dimension,\n' );
  fprintf ( 1, '  * N, the number of points to generate,\n' );
  fprintf ( 1, '  * STEP, the index of the first subsequence element.\n' );
  fprintf ( 1, '  * SEED(1:NDIM), the Halton sequence element\n' );
  fprintf ( 1, '    corresponding to STEP = 0\n' );
  fprintf ( 1, '  * LEAP(1:NDIM), the successive jumps in the\n' );
  fprintf ( 1, '    Halton sequence.\n' );
  fprintf ( 1, '  * BASE(1:M), the Halton bases,\n' );
  fprintf ( 1, '    usually distinct primes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The program generates the data, writes it to the file\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    halton_NDIM_N.txt\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  where "NDIM" and "N" are the numeric values specified\n' );
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
    fprintf ( 1, '  NDIM is the spatial dimension.\n' );
    fprintf ( 1, '  (Try ''2'' if you have no preference.)\n' );
    fprintf ( 1, '  Any value less than 1 terminates execution.\n' );
    ndim = input ( '  Enter NDIM:  ' );

    fprintf ( 1, '  User input NDIM = %d\n', ndim );

    if ( ~halham_ndim_check ( ndim ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HALTON_DATASET\n' );
      fprintf ( 1, '  The input value of NDIM = %d\n', ndim );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  N is the number of points.\n' );
    fprintf ( 1, '  (Try ''25'' if you have no preference.)\n' );
    fprintf ( 1, '  Any value less than 1 terminates execution.\n' );
    n = input ( '  Enter N:  ' );

    fprintf ( 1, '  User input N = %d\n', n );

    if ( ~halham_n_check ( n ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HALTON_DATASET\n' );
      fprintf ( 1, '  The input value of N = %d\n', n );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  STEP is the index of the first subsequence element.\n' );
    fprintf ( 1, '  (Try ''0'' or ''1'' if you have no preference.)\n' );
    fprintf ( 1, '  Any value less than 0 terminates execution.\n' );
    step = input ( '  Enter STEP:  ' );

    fprintf ( 1, '  User input STEP = %d\n', step );

    if ( ~halham_step_check ( step ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HALTON_DATASET\n' );
      fprintf ( 1, '  The input value of STEP = %d\n', step );
      fprintf ( 1, '  is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
      break
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  SEED(1:NDIM) is the starting element index\n' );
    fprintf ( 1, '  for each coordinate.\n' );
    fprintf ( 1, '  (Try ''[0,0,...,0]'' if you have no preference.)\n' );
    fprintf ( 1, '  (Any value less than 0 terminates execution.)\n' );
    seed = [];
    seed(1:ndim) = input ( '  Enter SEED(1:NDIM):  ' );

    fprintf ( 1, '\n' );
    i4vec_transpose_print ( ndim, seed, 'SEED:' );

    if ( ~halham_seed_check ( ndim, seed ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HALTON_DATASET\n' );
      fprintf ( 1, '  The negative input value of at least one entry of\n' );
      fprintf ( 1, '  SEED is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  LEAP(1:NDIM) is the leaping multiplier\n' );
    fprintf ( 1, '  for each coordinate.\n' );
    fprintf ( 1, '  (Try ''[1,1,...,1]'' if you have no preference.)\n' );
    fprintf ( 1, '  (Another choice is a prime bigger than all the bases.)\n' );
    fprintf ( 1, '  (Any value less than 1 terminates execution.)\n' );
    leap = [];
    leap(1:ndim) = input ( '  Enter LEAP(1:NDIM):  ' );

    fprintf ( 1, '\n' );
    i4vec_transpose_print ( ndim, leap, 'LEAP:' );

    if ( ~halham_leap_check ( ndim, leap ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HALTON_DATASET\n' );
      fprintf ( 1, '  The input value of at least one entry of\n' );
      fprintf ( 1, '  LEAP is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  BASE(1:NDIM) is the base for each coordinate,\n' );
    fprintf ( 1, '  usually distinct primes.\n' );
    fprintf ( 1, '  (Try ''[2,3,5,7,11,13,...]'' if you have no preference.)\n' );
    fprintf ( 1, '  (Any value less than 2 terminates execution.)\n' );
    base = [];
    base(1:ndim) = input ( '  Enter BASE:  ' );

    fprintf ( 1, '\n' );
    i4vec_transpose_print ( ndim, base, 'BASE:' );

    if ( ~halton_base_check ( ndim, base ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'HALTON_DATASET\n' );
      fprintf ( 1, '  The input value of at least one entry of\n' );
      fprintf ( 1, '  BASE is interpreted as a request for termination.\n' );
      fprintf ( 1, '  Normal end of execution.\n' );
    end

    r = i4_to_halton_sequence ( ndim, n, step, seed, leap, base );

    file_out_name = ...
      strcat ( 'halton_', num2str ( ndim ), '_', num2str ( n ), '.txt' );

    halham_write ( ndim, n, step, seed, leap, base, r, file_out_name );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The data was written to the file "%s".\n', ...
      file_out_name );

  end

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
