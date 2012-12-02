function hammersley_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests I4_TO_HAMMERSLEY_SEQUENCE.
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
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  I4_TO_HAMMERSLEY_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Hammersley sequence on a single call.\n' );
  fprintf ( 1, '  All arguments are specified explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we compute the first 10 elements\n' );
  fprintf ( 1, '  of a "classical" Hammersley sequence, and then\n' );
  fprintf ( 1, '  the "last" 10 elements.\n' );

  nmax = 1000;

  dim_num = 4;
  n = 10;
  step = 1;
  seed(1:dim_num) = 0;
  leap(1:dim_num) = 1;
  base(1) = -nmax;
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
  fprintf ( 1, '  We can jump ahead in the sequence by changing STEP.\n' );

  step = nmax - n + 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STEP = %12d\n', step );

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
