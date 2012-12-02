function test_triangulation_test04 ( )

%*****************************************************************************80
%
%% TEST04 tests P00_BOUNDARY_EPS.
%
%  Discussion:
%
%    This routine creates an EPS file containing an image of the boundary.
%
%    The boundary is broken up into segments of about H = 0.05 in length.
%
%    If SHOW_NODES is true, these points are shown in the image.
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
  h_relative = 0.050;
  show_nodes = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04\n' );
  fprintf ( 1, '  P00_BOUNDARY_EPS makes an EPS file containing\n' );
  fprintf ( 1, '  an image of the boundary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The boundary will be drawn to a relative fineness\n' );
  fprintf ( 1, '  of H_RELATIVE = %f\n', h_relative );
  fprintf ( 1, '\n' );

  if ( show_nodes )
    fprintf ( 1, '  The boundary nodes will be shown.\n' );
  else
    fprintf ( 1, '  The boundary nodes will NOT be shown.\n' );
  end

  eps_file_name = 'p00_boundary.eps';

  test_num = p00_test_num ( );

  for test = 1 : test_num

    [ lo, hi ] = p00_box ( test, m );
    
    h = h_relative * max ( hi(1) - lo(1), hi(2) - lo(2) );

    title = p00_title ( test );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Test number         = %d\n', test );
    fprintf ( 1, '  Title:              = "%s".\n', title );
    fprintf ( 1, '  H                   = %f\n', h );
    
    eps_file_name = file_name_inc ( eps_file_name );

    p00_boundary_eps ( test, h, show_nodes, eps_file_name );

    fprintf ( 1, '  Boundary image file is "%s".\n', eps_file_name );

  end

  return
end
