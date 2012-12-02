function hammersley_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests I4_TO_HAMMERSLEY_SEQUENCE.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  I4_TO_HAMMERSLEY_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Hammersley sequence on a single call.\n' );
  fprintf ( 1, '  All arguments are specified explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The SEED vector allows us to define the zeroth\n' );
  fprintf ( 1, '  element of the coordinate subsequence.\n' );
  fprintf ( 1, '  That is, if we ask for the STEP=0 entry of the\n' );
  fprintf ( 1, '  subsequence, we will get the SEED(I)th entry\n' );
  fprintf ( 1, '  of the full sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we use a fixed base for simplicity.\n' );

  dim_num = 4;
  n = 12;
  step = 0;
  for i = 1 : dim_num
    seed(i) = 10 * i;
  end
  leap(1:dim_num) = 1;
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
