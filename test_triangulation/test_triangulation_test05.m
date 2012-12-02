function test_triangulation_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests P00_POINTS_EPS.
%
%  Discussion:
%
%    This routine creates an EPS file containing an image of 
%    a set of points, and the boundary of the region.
%
%    The boundary is broken up into segments of about H = 0.05 in 
%    relative length, and these points are shown in the image.
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
  h_relative = 0.025;
  m = 2;
  n = 400;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  P00_POINTS_EPS makes an EPS file containing an\n' );
  fprintf ( 1, '  image of a set of points, and the boundary.\n' );

  eps_file_name = 'p00_points.eps';

  test_num = p00_test_num ( );

  for test = 1 : test_num

    [ lo, hi ] = p00_box ( test, m );

    h = h_relative * min ( hi(1) - lo(1), hi(2) - lo(2) );

    seed = 123456789;

    title = p00_title ( test );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test number         =  %d\n', test );
    fprintf ( 1, '  Spatial dimension   =  %d\n', m );
    fprintf ( 1, '  Relative spacing    =  %f\n', h_relative );
    fprintf ( 1, '  Actual spacing H    =  %f\n', h );
    fprintf ( 1, '  Title:              = "%s"\n', title );

    eps_file_name = file_name_inc ( eps_file_name );

    [ point, seed ] = p00_sample ( test, m, n, seed );

    p00_points_eps ( test, h, m, n, point, eps_file_name );

    fprintf ( 1, '  Boundary image file is "%s".\n', eps_file_name );

  end

  return
end
