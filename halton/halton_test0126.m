function halton_test0126 ( )

%*****************************************************************************80
%
%% TEST0126 tests I4_TO_HALTON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2009
%
%  Author:
%
%    John Burkardt
%

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0126\n' );
  fprintf ( 1, '  I4_TO_HALTON computes a Halton sequence.\n' );
  fprintf ( 1, '  The user gives the seed and bases as explicit input.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we call I4_TO_HALTON repeatedly.\n' );
  fprintf ( 1, '  We use the same value for all bases.\n' );

  dim_num = 3;
  n = 11;
  seed(1:dim_num) = 0;
  leap(1:dim_num) = 1;
  base(1:dim_num) = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
  i4vec_transpose_print ( dim_num, leap, '  LEAP = ' );
  i4vec_transpose_print ( dim_num, base, '  BASE = ' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  STEP      Halton\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    step = j - 1;
    r = i4_to_halton ( dim_num, step, seed, leap, base );
    fprintf ( 1, '  %6d  ', step );
    for i = 1 : dim_num
      fprintf ( 1, '%8f  ', r(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
