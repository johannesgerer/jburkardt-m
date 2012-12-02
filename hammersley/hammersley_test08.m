function hammersley_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests I4_TO_HAMMERSLEY_SEQUENCE.
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
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  I4_TO_HAMMERSLEY_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Hammersley sequence on a single call.\n' );
  fprintf ( 1, '  All arguments are specified explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, we demonstrate that any coordinate of\n' );
  fprintf ( 1, '  the generalized Hammersley sequence that is generated\n' );
  fprintf ( 1, '  as a fractional sequence J/|BASE(I)| will\n' );
  fprintf ( 1, '  "wrap around".\n' );

  nmax = 10;

  dim_num = 4;
  n = 20;
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

  return
end
