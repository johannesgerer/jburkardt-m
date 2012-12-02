function geometry_test225 ( )

%*****************************************************************************80
%
%% TEST225 tests VOXELS_LINE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  p1 = [ 1, 1, 5 ];
  p2 = [ 9, 4, 4 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST225\n' );
  fprintf ( 1, '  VOXELS_LINE_3D computes the voxels on a line in 3D\n' );
  fprintf ( 1, '  starting at the first voxel, and heading towards\n' );
  fprintf ( 1, '  the second one.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting voxel:\n' );
  fprintf ( 1, '  %6d  %6d  %6d\n', p1(1:dim_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  "Heading" voxel:\n' );
  fprintf ( 1, '  %6d  %6d  %6d\n', p2(1:dim_num) );

  n = voxels_dist_l1_nd ( dim_num, p1, p2 ) + 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of voxels we will compute is %d\n', n );

  v = voxels_line_3d ( p1, p2, n );

  i4mat_transpose_print ( 3, n, v, '  The voxels:' );

  return
end
