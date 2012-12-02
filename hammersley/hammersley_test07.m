function hammersley_test07 ( )

%*****************************************************************************80
%
%% TEST07 tests HALHAM_WRITE.
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
  file_name = 'hammersley_04_00010.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST07\n' );
  fprintf ( 1, '  HALHAM_WRITE writes a Halton or Hammersley\n' );
  fprintf ( 1, '  dataset to a file.\n' );

  dim_num = 4;
  n = 10;
  step = 0;
  seed(1) = 1;
  seed(2:dim_num) = 0;
  leap(1:dim_num) = 1;
  base(1) = -n;
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

  halham_write ( dim_num, n, step, seed, leap, base, r, file_name );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to "%s".\n', file_name );

  return
end
