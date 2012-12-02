function quad_mesh_test11 ( )

%*****************************************************************************80
%
%% QUAD_MESH_TEST11 demonstrates SAMPLE_QUAD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2009
%
%  Author:
%
%    John Burkardt
%
  quad_xy = [ ...
    1.0, 2.0;
    5.0, 2.0;
    5.0, 3.0;
    4.0, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_MESH_TEST11\n' );
  fprintf ( 1, '  SAMPLE_QUAD computes N random points in a quadrilateral.\n' );
  fprintf ( 1, '  Write them to a file.\n' );

  n = 5000;

  seed = 123456789;

  [ xy, seed ] = sample_quad ( quad_xy, n, seed );

  output_filename = 'sample_quad.txt';

  r8mat_write ( output_filename, 2, n, xy );

  fprintf ( 1, '  Point coordinates written to "%s".\n', output_filename );

  return
end
