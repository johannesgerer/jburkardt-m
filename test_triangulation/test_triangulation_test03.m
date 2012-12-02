function test_triangulation_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests P00_BOUNDARY_NEAREST.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  P00_BOUNDARY_NEAREST returns the nearest boundary\n' );
  fprintf ( 1, '  point for a set of points.\n' );
  fprintf ( 1, '\n' );

  test_num = p00_test_num ( );

  for test = 1 : test_num

    seed = seed_start;

    test = p00_title ( test );

    n = 20;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test number         =  %d\n', test );
    fprintf ( 1, '  Title:              = "%s"\n', title );
    fprintf ( 1, '  Spatial dimension M =  %d\n', m );
    fprintf ( 1, '  Number of samples N =  %d\n', n );
    fprintf ( 1, '  Initial SEED:       =  %d\n', seed );
    fprintf ( 1, '\n' );

    [ point, seed ] = p00_sample ( test, m, n, seed );

    boundary = p00_boundary_nearest ( test, m, n, point );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Pairs of Point and Nearest Boundary Point:\n' );
    fprintf ( 1, '  (This data can be passed to the PLOT_POINTS\n' );
    fprintf ( 1, '  routine and plotted with the DASH option.)\n' );
    fprintf ( 1, ' '

    for j = 1 : n
      fprintf ( 1, '  %10f  %10f\n', point(1:2,j) );
      fprintf ( 1, '  %10f  %10f\n', boundary(1:2,j) );
      fprintf ( 1, '\n' );
    end

  end

  return
end
