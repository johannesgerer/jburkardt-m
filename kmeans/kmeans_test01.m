function kmeans_test01 ( )

%*****************************************************************************80
%
%% KMEANS_TEST01 tries out the HMEANS_01 routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 October 2009
%
%  Author:
%
%    John Burkardt
%
  center_filename = 'test01_centers.txt';
  cluster_filename = 'test01_clusters.txt';
  point_filename = 'points_100.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KMEANS_TEST01\n' );
  fprintf ( 1, '  Test the HMEANS_01 algorithm.\n' );
%
%  Read the data points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data points will be read from "%s".\n', point_filename );

  [ dim_num, point_num ] = r8mat_header_read ( point_filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', dim_num );
  fprintf ( 1, '  Number of points  = %d\n', point_num );

  point = r8mat_data_read ( point_filename, dim_num, point_num );
%
%  Clustering parameters.
%
  cluster_num = 5;
  it_max = 20;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations allowed is %d\n', it_max );
%
%  Initialize the centers.
%
  [ cluster_center, seed ] = cluster_initialize_5 ( dim_num, point_num, ...
    cluster_num, point, seed );

  cluster = zeros(1,point_num);

  [ cluster, cluster_center, cluster_population, cluster_energy, it_num ] = ...
    hmeans_01 ( dim_num, point_num, cluster_num, it_max, point, ...
    cluster, cluster_center );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations taken is %d\n', it_num );

  cluster_variance = cluster_variance_compute ( dim_num, point_num, ...
    cluster_num, point, cluster, cluster_center );

  cluster_print_summary ( point_num, cluster_num, cluster_population, ...
    cluster_energy, cluster_variance );

  r8mat_write ( center_filename, dim_num, cluster_num, cluster_center );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cluster centers written to "%s".\n', center_filename );

  i4mat_write ( cluster_filename, 1, point_num, cluster );

  fprintf ( 1, '  Cluster assignments written to "%s".\n', cluster_filename );

  return
end
