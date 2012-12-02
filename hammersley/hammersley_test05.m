function hammersley_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests I4_TO_HAMMERSLEY_SEQUENCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  I4_TO_HAMMERSLEY_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Hammersley sequence on a single call.\n' );
  fprintf ( 1, '  All arguments are specified explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Any entry of the Hammersley sequence can be computed\n' );
  fprintf ( 1, '  immediately, without having to compute the previous\n' );
  fprintf ( 1, '  entries.  This is also true of the entries of the\n' );
  fprintf ( 1, '  leaped Hammersley subsequences we generate.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we compute the first 10 elements\n' );
  fprintf ( 1, '  of a "classical" Hammersley sequence, and then\n' );
  fprintf ( 1, '  the "last" 10 elements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The value of a component of the Hammersley sequence\n' );
  fprintf ( 1, '  is computed directly from its index.  But there\n' );
  fprintf ( 1, '  should not be much difficulty handling indices\n' );
  fprintf ( 1, '  that go as high as a million or a billion.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we look at high index entries,\n' );
  fprintf ( 1, '  attained by large values of STEP, or SEED or LEAP.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we use the default bases.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  BIG VALUES OF STEP:\n' );
  fprintf ( 1, '\n' );

  dim_num = 4;
  n = 5;

  for k = 1 : 4

    step = 100^k;
    seed(1:dim_num) = 0;
    leap(1:dim_num) = 1;
    base(1) = -(step+n-1);
    for i = 2 : dim_num
      base(i) = prime ( i - 1 );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
    fprintf ( 1, '  N =    %12d\n', n );
    fprintf ( 1, '  STEP = %12d\n', step );
    i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
    i4vec_transpose_print ( dim_num, leap, '  LEAP = ' );
    i4vec_transpose_print ( dim_num, base, '  BASE = ' );

    r = i4_to_hammersley_sequence ( dim_num, n, step, seed, leap, base );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    STEP   Hammersley\n' );
    fprintf ( 1, '\n' );
    for j = 1 : n
      fprintf ( 1, '  %6d  ', step+j-1 );
      for i = 1 : dim_num
        fprintf ( 1, '%12f  ', r(i,j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  BIG VALUES OF SEED:\n' );
  fprintf ( 1, '\n' );

  step = 0;
  for i = 1 : dim_num
    seed(i) = 100^i;
  end
  leap(1:dim_num) = 1;
  base(1) = -(100+n-1);
  for i = 2 : dim_num
    base(i) = prime ( i - 1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
  i4vec_transpose_print ( dim_num, leap, '  LEAP = ' );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  r = i4_to_hammersley_sequence ( dim_num, n, step, seed, leap, base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Hammersley\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  BIG VALUES OF LEAP:\n' );
  fprintf ( 1, '\n' );

  step = 0;
  seed(1:dim_num) = 0;
  for i = 1 : dim_num
    leap(i) = 100^i;
  end
  base(1) = -( n * 100 );
  for i = 2 : dim_num
    base(i) = prime ( i - 1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
  i4vec_transpose_print ( dim_num, leap, '  LEAP = ' );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  r = i4_to_hammersley_sequence ( dim_num, n, step, seed, leap, base );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    STEP   Hammersley\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  ', step+j-1 );
    for i = 1 : dim_num
      fprintf ( 1, '%12f  ', r(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
