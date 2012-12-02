function cluster_print_summary ( point_num, cluster_num, cluster_population, ...
  cluster_energy, cluster_variance )

%*****************************************************************************80
%
%% CLUSTER_PRINT_SUMMARY prints a summary of data about a clustering.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 October 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer POINT_NUM, the number of points.
%
%    Input, integer CLUSTER_NUM, the number of clusters.
%
%    Input, integer CLUSTER_POPULATION(CLUSTER_NUM), the number of
%    points assigned to each cluster.
%
%    Input, real CLUSTER_ENERGY(CLUSTER_NUM), the energy of 
%    the clusters.
%
%    Input, real CLUSTER_VARIANCE(CLUSTER_NUM), the variance  of 
%    the clusters.
%
  ce_total = sum ( cluster_energy(1:cluster_num) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Clustering statistics:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Number of clusters is %d\n', cluster_num );
  fprintf ( 1, '    Number of points is   %d\n', point_num );
  fprintf ( 1, '    Total energy is       %f\n', ce_total );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Cluster   Population        Energy           Variance\n' );
  fprintf ( 1, '  -------  -----------  -----------------  --------------\n' );
  fprintf ( 1, '                #    %%      value       %%\n' );
  fprintf ( 1, '\n' );

  for i = 1 : cluster_num
    cp = cluster_population(i);
    cpp = floor ( 100 * cp / point_num );
    ce = cluster_energy(i);
    cep = floor ( ce * 100 / ce_total );
    cv = cluster_variance(i);
    fprintf ( 1, '      %3d  %8d  %3d  %12.6f  %3d  %12.6f\n', ...
      i, cp, cpp, ce, cep, cv );
  end

  cp = sum ( cluster_population(1:cluster_num) );
  cpp = 100;
  ce = sum ( cluster_energy(1:cluster_num) );
  cep = 100;
  cv = sum ( cluster_population(1:cluster_num) ...
    .* cluster_variance(1:cluster_num) ) / cp;

  fprintf ( 1, '\n');
  fprintf ( 1, '    Total  %8d  %3d  %12.6f  %3d  %12.6f\n', ...
    cp, cpp, ce, cep, cv );

  return
end
