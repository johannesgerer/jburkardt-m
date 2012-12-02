function geometry_test187 ( )

%*****************************************************************************80
%
%% TEST187 tests SPHERE_IMP_GRIDFACES_3D.
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
  maxtri = 1000;

  nlat = 3;
  nlong = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST187\n' );
  fprintf ( 1, '  SPHERE_IMP_GRIDFACES_3D computes gridfaces\n' );
  fprintf ( 1, '  on a sphere in 3D.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of intermediate latitudes is %d\n', nlat );
  fprintf ( 1, '  Number of longitudes is %d\n', nlong );

  [ ntri, tri ] = sphere_imp_gridfaces_3d ( maxtri, nlat, nlong );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of triangles is %d\n', ntri );

  i4mat_transpose_print ( 3, ntri, tri, '  Triangle vertices:' );

  return
end
