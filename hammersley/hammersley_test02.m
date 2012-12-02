function hammersley_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests I4_TO_HAMMERSLEY_SEQUENCE.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  I4_TO_HAMMERSLEY_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Hammersley sequence on a single call.\n' );
  fprintf ( 1, '  All arguments are specified explicitly.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We are free to choose the values of BASE.\n' );
  fprintf ( 1, '  Any negative value indicates a sequence of\n' );
  fprintf ( 1, '  J/(-BASE) in that coordinate.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this example, that is the only kind of base we use.\n' );

  dim_num = 4;
  n = 12;
  step = 0;
  seed(1:dim_num) = 0;
  leap(1:dim_num) = 1;
  for i = 1 : dim_num
    base(i) = -(10^i);
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
