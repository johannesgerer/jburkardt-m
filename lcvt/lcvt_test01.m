function lcvt_test01 ( sample_function_cvt )

%*****************************************************************************80
%
%% TEST01 tests CVT, R8MAT_LATINIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2006
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  n = 25;
  latin_steps = 3;
  sample_function_init = 0;
  sample_num_cvt = 100000;
  sample_num_steps = 50;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  CVT computes a Centroidal Voronoi Tessellation.\n' );
  fprintf ( 1, '  R8MAT_LATINIZE makes it a Latin Hypersquare.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this test, we vary the sampling used during the\n' );
  fprintf ( 1, '  CVT Latin iteration.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension M =        %d\n', m );
  fprintf ( 1, '  Number of generators N =     %d\n', n );
  fprintf ( 1, '  Initial random number seed = %d\n', seed );
  fprintf ( 1, '\n' );

  if ( sample_function_init == -1 )
    fprintf ( 1, '  Initialize using RAND (MATLAB intrinsic).\n' );
  elseif ( sample_function_init == 0 )
    fprintf ( 1, '  Initialize using UNIFORM.\n' );
  elseif ( sample_function_init == 1 )
    fprintf ( 1, '  Initialize using HALTON.\n' );
  elseif ( sample_function_init == 2 )
    fprintf ( 1, '  Initialize using GRID.\n' );
  elseif ( sample_function_init == 3 )
    fprintf ( 1, '  USER will initialize data.\n' );
  end

  if ( sample_function_cvt == -1 )
    fprintf ( 1, '  Sample using RAND (MATLAB intrinsic).\n' );
  elseif ( sample_function_cvt == 0 )
    fprintf ( 1, '  Sample using UNIFORM.\n' );
  elseif ( sample_function_cvt == 1 )
    fprintf ( 1, '  Sample using HALTON.\n' );
  elseif ( sample_function_cvt == 2 )
    fprintf ( 1, '  Sample using GRID.\n' );
  end

  fprintf ( 1, '  Number of sample points = %d\n', sample_num_cvt );
  fprintf ( 1, '  Number of sample steps =  %d\n', sample_num_steps );

  generator = zeros ( m, n );
  
  for i = 1 : latin_steps

    [ generator, seed ] = cvt ( m, n, sample_function_init, ...
      sample_function_cvt, sample_num_cvt, sample_num_steps, seed, generator );

    r8mat_transpose_print ( m, n, generator, '  After CVT steps:' );

    generator = r8mat_latinize ( m, n, generator );

    r8mat_transpose_print ( m, n, generator, '  After Latin step:' );

  end

  return
end
