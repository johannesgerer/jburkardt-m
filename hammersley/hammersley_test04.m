function hammersley_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests I4_TO_HAMMERSLEY_SEQUENCE.
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
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  I4_TO_HAMMERSLEY_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Hammersley sequence on a single call.\n' );
  fprintf ( 1, '  All arguments are specified explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The LEAP vector allows us to define the distance\n' );
  fprintf ( 1, '  (in the original sequence) between successive\n' );
  fprintf ( 1, '  subsequence elements.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A LEAP of 1 means that, once we start sampling\n' );
  fprintf ( 1, '  the sequence, we are taking every element.\n' );
  fprintf ( 1, '  A LEAP of 2 takes every other sequence element,\n' );
  fprintf ( 1, '  and so on.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we use a fixed base for simplicity.\n' );

  dim_num = 4;
  n = 12;
  step = 0;
  seed(1:dim_num) = 0;
  for i = 1 : dim_num
    leap(i) = 2^(i-1);
  end
  base(1:dim_num) = -100;

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
