function quality_test_cvt ( )

%*****************************************************************************80
%
%% QUALITY_TEST_CVT calls the QUALITY routines for points in the unit hypercube.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 December 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUALITY_TEST_CVT\n' );
  fprintf ( 1, '  Test the MATLAB QUALITY library\n' );
  fprintf ( 1, '  on points in the unit hypercube.' );

  ns = 100000;
  seed_init = 123456789;
  input_filename = 'cvt_02_00100.txt';

  [ dim_num, n ] = r8mat_header_read ( input_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The pointset was read from "%s"\n', input_filename );
  fprintf ( 1, '  The sample routine is SAMPLE_HYPERCUBE_UNIFORM.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The spatial dimension DIM_NUM =  %12d\n', dim_num   );
  fprintf ( 1, '  The number of points N =	   %12d\n', n         );
  fprintf ( 1, '  The number of sample points NS = %12d\n', ns        );
  fprintf ( 1, '  The random number SEED_INIT =    %12d\n', seed_init );
  fprintf ( 1, '\n' );

  z = r8mat_data_read ( input_filename, dim_num, n );

  r8mat_transpose_print_some ( dim_num, n, z, 1, 1, 5, 5, ...
    '  5x5 portion of data read from file:' );
%
%  For 2 dimensional datasets, some quality measures work from the Delaunay triangulation.
%  Compute that here.
%
  if ( dim_num == 2 )

    triangle_node = delaunay ( z(1,1:n), z(2,1:n) );

    triangle_node = triangle_node';
    [ dummy, triangle_num ] = size ( triangle_node );

  else

    triangle_node = [];
    triangle_num = 0;

  end

  if ( dim_num == 2 )
    quality_test005 ( n, z, triangle_num, triangle_node );
    quality_test006 ( n, z, triangle_num, triangle_node );
  end
  quality_test007 ( dim_num, n, z );
  quality_test01 ( dim_num, n, z, ns, 'sample_hypercube_uniform', seed_init );
  quality_test02 ( dim_num, n, z, ns, 'sample_hypercube_uniform', seed_init );
  quality_test03 ( dim_num, n, z, ns, 'sample_hypercube_uniform', seed_init );
  quality_test04 ( dim_num, n, z );
  quality_test05 ( dim_num, n, z, ns, 'sample_hypercube_uniform', seed_init );
  quality_test06 ( dim_num, n, z );
  quality_test07 ( dim_num, n, z, ns, 'sample_hypercube_uniform', seed_init );
  quality_test08 ( dim_num, n, z, ns, 'sample_hypercube_uniform', seed_init );
  if ( dim_num == 2 )
    quality_test083 ( n, z, triangle_num, triangle_node );
  end
  quality_test085 ( dim_num, n, z );
  quality_test09 ( dim_num, n, z );
  quality_test10 ( dim_num, n, z, ns, 'sample_hypercube_uniform', seed_init );
  quality_test11 ( dim_num, n, z );

  return
end
