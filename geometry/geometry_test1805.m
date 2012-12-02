function geometry_test1805 ( )

%*****************************************************************************80
%
%% TEST1805 tests SIMPLEX_VOLUME_ND, TETRAHEDRON_VOLUME_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  tetra = [ ...
     0.000000,  0.942809, -0.333333; ...
    -0.816496, -0.816496, -0.333333; ...
     0.816496, -0.816496, -0.333333; ...
     0.000000,  0.000000,  1.000000 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1805\n' );
  fprintf ( 1, '  For an N-dimensional simplex,\n' );
  fprintf ( 1, '  SIMPLEX_VOLUME_ND computes the volume.\n' );
  fprintf ( 1, '  Here, we check the routine by comparing it\n' );
  fprintf ( 1, '  with TETRAHEDRON_VOLUME_3D.\n' );

  r8mat_transpose_print ( dim_num, 4, tetra, '  Simplex vertices:' );

  volume = tetrahedron_volume_3d ( tetra );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume computed by TETRAHEDRON_VOLUME_3D:\n' );
  fprintf ( 1, '  %f\n', volume );

  volume = simplex_volume_nd ( dim_num, tetra );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume computed by SIMPLEX_VOLUME_ND:\n' );
  fprintf ( 1, '  %f\n', volume );

  return
end
