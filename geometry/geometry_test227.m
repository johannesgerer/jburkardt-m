function geometry_test227 ( )

%*****************************************************************************80
%
%% TEST227 tests VOXELS_STEP_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST227\n' );
  fprintf ( 1, '  VOXELS_STEP_3D steps along a line from\n' );
  fprintf ( 1, '    one voxel to another.\n' );

  v1(1:dim_num) = [ 1, 1, 5 ];
  v2(1:dim_num) = v1(1:dim_num);

  inc = 7;
  jnc = 3;
  knc = -1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  %4d  %4d  %4d  %4d\n', 0, v2(1:dim_num) );

  for i = 1 : 10
    v3 = voxels_step_3d ( v1, v2, inc, jnc, knc );
    fprintf ( 1, '  %4d  %4d  %4d  %4d\n', i, v3(1:dim_num) );
    v2(1:dim_num) = v3(1:dim_num);
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now, as a check, reverse direction and return.\n' );
  fprintf ( 1, '\n' );

  v1(1:dim_num) = v2(1:dim_num);

  inc = -inc;
  jnc = -jnc;
  knc = -knc;

  v2(1:dim_num) = v1(1:dim_num);

  fprintf ( 1, '  %4d  %4d  %4d  %4d\n', 0, v2(1:dim_num) );
  for i = 1 : 10
    v3 = voxels_step_3d ( v1, v2, inc, jnc, knc );
    fprintf ( 1, '  %4d  %4d  %4d  %4d\n', i, v3(1:dim_num) );
    v2(1:dim_num) = v3(1:dim_num);
  end

  return
end
