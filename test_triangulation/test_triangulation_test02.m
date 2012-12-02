function test_triangulation_test02 ( )

%*****************************************************************************80
%
%% TEST02 tests P00_TEST_NUM and P00_SAMPLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 2;
  seed_start = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  P00_TEST_NUM reports the number of problems.\n' );
  fprintf ( 1, '  P00_SAMPLE returns sample points from the region.\n' );

  test_num = p00_test_num ( );

  for test = 1 : test_num

    seed = seed_start;

    title = p00_title ( test );

    n = 20;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test number         =  %d\n', test );
    fprintf ( 1, '  Title:              = "%s"\n', title );
    fprintf ( 1, '  Spatial dimension M =  %d\n', m );
    fprintf ( 1, '  Number of samples N =  %d\n', n );
    fprintf ( 1, '  Initial SEED:       =  %d\n', seed );
    fprintf ( 1, '\n' );

    [ point, seed ] = p00_sample ( test, m, n, seed );

    r8mat_transpose_print ( m, n, point, '  The sample points:' );

  end

  return
end
