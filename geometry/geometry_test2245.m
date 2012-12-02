function geometry_test2245 ( )

%*****************************************************************************80
%
%% TEST2245 tests VOXELS_DIST_L1_ND.
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
  fprintf ( 1, 'TEST2245\n' );
  fprintf ( 1, '  VOXELS_DIST_L1_ND prints the voxels on a line in 3D.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P1:\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', p1(1:dim_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P2:\n' );
  fprintf ( 1, '  %4d  %4d  %4d\n', p2(1:dim_num) );

  dist = voxels_dist_l1_nd ( dim_num, p1, p2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  L1 distance = %d\n', dist );

  return
end
