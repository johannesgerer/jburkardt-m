function halton_test025 ( )

%*****************************************************************************80
%
%% TEST025 tests I4_TO_HALTON_SEQUENCE.
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
  n = 10;
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST025\n' );
  fprintf ( 1, '  I4_TO_HALTON_SEQUENCE computes N elements of\n' );
  fprintf ( 1, '  a Halton sequence on a single call.\n' );
  fprintf ( 1, '  All arguments are specified explicitly.\n' );

  for test = 1 : 4

    if ( test == 1 )

      step = 0;
      seed(1:dim_num) = 0;
      leap(1:dim_num) = 1;
      for i = 1 : dim_num
        base(i) = prime ( i );
      end

    elseif ( test == 2 )

      step = 0;
      for i = 1 : dim_num
        seed(i) = i;
      end
      leap(1:dim_num) = 1;
      for i = 1 : dim_num
        base(i) = prime ( i );
      end

    elseif ( test == 3 )

      step = 0;
      seed(1:dim_num) = 1;
      leap(1:dim_num) = 3;
      for i = 1 : dim_num
        base(i) = prime ( i );
      end

    elseif ( test == 4 )

      step = 0;
      seed(1:dim_num) = [ 1, 2, 3 ];
      leap(1:dim_num) = 1;
      base(1:dim_num) = [ 2, 2, 2 ];

    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
    fprintf ( 1, '  N =    %12d\n', n );
    fprintf ( 1, '  STEP = %12d\n', step );
    i4vec_transpose_print ( dim_num, seed, '  SEED = ' );
    i4vec_transpose_print ( dim_num, leap, '  LEAP = ' );
    i4vec_transpose_print ( dim_num, base, '  BASE = ' );

    r = i4_to_halton_sequence ( dim_num, n, step, seed, leap, base );

    fprintf ( 1, '\n' );
    fprintf ( 1, '    STEP   Halton\n' );
    fprintf ( 1, '\n' );
    for j = 1 : n
      fprintf ( 1, '  %6d  ', step+j-1 );
      for i = 1 : dim_num
        fprintf ( 1, '%12f  ', r(i,j) );
      end
      fprintf ( 1, '\n' );
    end

  end

  return
end
